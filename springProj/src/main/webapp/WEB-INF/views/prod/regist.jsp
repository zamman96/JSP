<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen"/>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<div class="card card-success">
	<div class="card-header">
		<h2>상품 등록</h2>
	</div>

	<form id="frm" action="/prod/registPost" method="post" enctype="multipart/form-data">
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<!-- text input -->
					<div class="form-group">
						<label for="prodId">상품 코드</label> <input required type="text"
							class="form-control" readonly placeholder="상품분류를 선택해주세요"
							name="prodId" id="prodId">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="prodLgu">상품 분류 코드</label> <select required="required" class="form-control"
							id="prodLgu" name="prodLgu">
							<option value="" selected="selected" disabled="disabled">선택해주세요</option>
							<c:forEach var="lprod" items="${lprod}">
								<option value="${lprod.lprodGu}">${lprod.lprodNm}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<!-- text input -->
					<div class="form-group">
						<label for="prodName">상품 명</label> <input required type="text"
							class="form-control" placeholder="상품명" name="prodName"
							id="prodName">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="prodBuyer">거래처</label> <select required class="form-control"
							id="prodBuyer" name="prodBuyer">
							<option value="" selected="selected" disabled="disabled">상품 분류를 선택해주세요</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<!-- textarea -->
					<div class="form-group">
						<label for="prodSale">상품 판매가</label> <input required type="number"
							class="form-control" placeholder="판매가" name="prodSale"
							id="prodSale">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label>업로드 파일</label>
						<div class="custom-file">
							<input required type="file" class="custom-file-input" name="uploadFile"
								id="uploadFile" multiple="multiple"> <label class="custom-file-label" id="fileLabel"
								for="uploadFile">파일을 선택해주세요</label>
						</div>
					</div>
					<div id="pImg">
<!-- 						<img src="/resources/images/P1234.jpg" style="width: 100px; border:1px solid #ced4da;border-radius: .25rem;" /> -->
					</div>
				</div>
			</div>
			<!-- input states -->
			<div class="form-group">
				<label class="col-form-label" for="prodDetail">상품 상세 설명</label>
				<div id="prodDetailTemp"></div>
				<textarea hidden class="form-control" rows="3" id="prodDetail"
					placeholder="상품 상세 설명" name="prodDetail" cols=""></textarea>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer row" style="justify-content: space-between;">
			<div>
				<a href="/prod/list" class="btn btn-info">목록</a>
			</div>
			<div>
				<button type="submit" class="btn btn-warning">등록</button>
			</div>
			<div>
				<button type="reset" id="reset" class="btn btn-secondary">초기화</button>
			</div>
		</div>
	</form>
</div>
<script>
// uploadUrl => 이미지 업로드 시 요청할 요청URI
// editor => CKEditor가 생성된 후 바로 그 객체
// window.editor : 그 객체를 이렇게 부르겠다 정의
ClassicEditor.create( document.querySelector('#prodDetailTemp'),{ckfinder:{uploadUrl:'/image/upload'}})
 .then(editor=>{window.editor=editor;})
 .catch(err=>{console.error(err.stack);});

//e 이벤트 객체
function handleImg(e){
	let files = e.target.files; // 파일에 접근
	let fileArr = Array.prototype.slice.call(files); // 붙어있는 파일을 배열로 정렬
	let img_html = "";
	$.each(fileArr, function(){
		// 이미지 여부 체크
		if(!this.type.match("image.*")){
			console.log("이미지가 아닙니다")
			return;
		}
		
		// 이미지 
		let reader = new FileReader();
		
		// e : reader가 이미지 객체를 읽는 이벤트
		reader.onload = function(e){
			img_html += "<img src='"+e.target.result+"' style='width: 100px; border:1px solid #ced4da;border-radius: .25rem;'  />";
			// 요소.append : 누적, 요소.html : 새로고침,
			// 요소.innerHTML : JavaScript에서 새로고침
			$('#pImg').html(img_html);
		}
		reader.readAsDataURL(this);
	});
}

$(function(){
	$('#uploadFile').on('input', handleImg);
	
	$(".ck-blurred").keydown(function(){
		console.log("str : " + window.editor.getData());

		$("#prodDetail").val(window.editor.getData());
		});

		$(".ck-blurred").on("focusout",function(){
		$("#prodDetail").val(window.editor.getData());
	});
	
	$('#prodLgu').on('change',function(){
		let lgu = $('#prodLgu').val();
		// prodId 생성
		$.ajax({
			url : "/prod/createProdId",
			data : JSON.stringify({"prodLgu" : lgu}),
			contentType : 'application/json',
			type : "post",
			success : function(res){
				$('#prodId').val(res);
			}
		})
		
		// buyer select 설정
		$.ajax({
			url : "/prod/buyer",
			data : JSON.stringify({"buyerLgu" : lgu}),
			contentType : 'application/json',
			type : "post",
			success : function(res){
				console.log(res);
				let str="<option value='' selected disabled>선택해주세요</option>";
				$.each(res, function(){
					str += "<option value='"+this.buyerId+"'>"+this.buyerName+"</option>";
				})
				if(res.length==0){
					str = "<option value='' selected disabled>해당하는 거래처가 없습니다</option>"
				}
				$('#prodBuyer').html(str);
			}
		})
	})
	
	// 파일 label 이름 변경
	$('#uploadFile').on('change', function() {
	    // 선택된 파일이 있는지 확인
	    if ($('#uploadFile').get(0).files.length > 0) {
	        // 파일 이름을 레이블에 설정
	        $('#fileLabel').text($('#uploadFile').get(0).files[0].name);
	    } else {
	        // 파일이 선택되지 않았을 경우 기본 텍스트로 설정
	        $('#fileLabel').text('파일을 선택해주세요');
	    }
	});
	
	// reset시 buyer select도 리셋
	$('#reset').on('click',function(){
		let str="<option value='' selected disabled>상품 분류를 선택해주세요</option>";
		$('#prodBuyer').html(str);
	})
})
</script>