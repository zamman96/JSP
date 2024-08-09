<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen"/>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<div class="card card-info">
	<div class="card-header">
		<h2>상품 수정</h2>
	</div>
<c:set var="prod" value="${buyer.prodVoList[0]}"/>
	<form id="frm" action="/prod/updatePost" method="post" enctype="multipart/form-data">
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<!-- text input -->
					<div class="form-group">
						<label for="prodId">상품 코드</label> <input required type="text"
							class="form-control" readonly placeholder="상품분류를 선택해주세요"
							name="prodId" id="prodId" value="${prod.prodId}">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="prodLgu">상품 분류 코드</label> <select disabled="disabled" required="required" class="form-control"
							id="prodLgu" name="prodLgu">
							<c:forEach var="lprod" items="${lprod}">
								<option value="${lprod.lprodGu}"
							<c:if test="${prod.prodLgu==lprod.lprodGu}">selected</c:if>
								>${lprod.lprodNm}</option>
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
							class="form-control" placeholder="상품명" name="prodName" value="${prod.prodName}"
							id="prodName">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="prodBuyer">거래처</label> <select  value="${prod.prodBuyer}" required class="form-control"
							id="prodBuyer" name="prodBuyer">
								<option value="">선택해주세요</option>
							<c:forEach var="vo" items="${sel}">
								<option value="${vo.buyerId}"
							<c:if test="${prod.prodBuyer==vo.buyerId}">selected</c:if>
								>${vo.buyerName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<!-- textarea -->
					<div class="form-group">
						<label for="prodSale">상품 판매가</label> <input required type="number"
							class="form-control" placeholder="판매가" value="${prod.prodSale}" name="prodSale"
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
					<c:forEach var="img" items="${prod.fgvo.fileDetailVoList}">
						<div class="image-container" style="display: inline-block; position: relative; margin: 5px;">
						<img src="${img.fileSaveLocate}" style="width: 100px; border:1px solid #ced4da; border-radius: .25rem;" />
<!-- 						<button type="button" class="btn btn-tool" onclick="removeImage(this)" style="position: absolute; top: 5px; right: -1px; cursor: pointer;"> -->
<!-- 							<i class="fas fa-times"></i> -->
<!-- 						</button> -->
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
			<!-- input states -->
			<div class="form-group">
				<label class="col-form-label" for="prodDetail">상품 상세 설명</label>
				<div id="prodDetailTemp">${prod.prodDetail}</div>
				<textarea hidden class="form-control" rows="3" id="prodDetail"
					placeholder="상품 상세 설명" name="prodDetail" cols="">${prod.prodDetail}</textarea>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer row" style="justify-content: space-between;">
			<div>
				<a href="/prod/detail?prodId=${prod.prodId}" class="btn btn-info">취소</a>
			</div>
			<div>
				<button type="submit" class="btn btn-warning">수정</button>
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

document.getElementById('uploadFile').addEventListener('change', function(event) {
    const files = event.target.files; // 업로드된 파일 목록
    const imagePreviewContainer = document.getElementById('pImg');
    imagePreviewContainer.innerHTML = ''; // 기존 미리보기 초기화

    // 업로드된 파일을 미리보기로 표시
    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const reader = new FileReader();

        reader.onload = function(e) {
            const imgContainer = document.createElement('div');
            imgContainer.className = 'image-container';
            imgContainer.style.position = 'relative';
            imgContainer.style.display = 'inline-block';
            imgContainer.style.margin = '5px';

            // 이미지 생성
            const img = document.createElement('img');
            img.src = e.target.result; // FileReader로 읽은 이미지 URL
            img.style.width = '100px';
            img.style.border = '1px solid #ced4da';
            img.style.borderRadius = '.25rem';

            // 삭제 버튼 생성
            const button = document.createElement('button');
            button.type = 'button';
            button.className = 'btn btn-tool';
            button.style.position = 'absolute';
            button.style.top = '5px';
            button.style.right = '-1px';
            button.style.background = 'rgba(255, 255, 255, 0.8)';
            button.style.border = 'none';
            button.style.borderRadius = '50%';
            button.style.padding = '2px';
            button.style.cursor = 'pointer';
            button.innerHTML = '<i class="fas fa-times"></i>';

            // 삭제 버튼 클릭 시 동작
            button.onclick = function() {
                // 이미지 컨테이너 삭제
                imgContainer.remove();

                // 업로드된 파일 목록에서 해당 파일 삭제
                const fileList = Array.from(document.getElementById('uploadFile').files);
                const newFileList = fileList.filter((_, index) => index !== i); // 현재 인덱스 제외
                const dataTransfer = new DataTransfer(); // 새로운 파일 리스트 생성

                newFileList.forEach(file => dataTransfer.items.add(file)); // 새로운 파일 리스트 추가
                document.getElementById('uploadFile').files = dataTransfer.files; // 파일 입력 필드 업데이트
            };

            // 이미지 컨테이너에 이미지와 버튼 추가
            imgContainer.appendChild(img);
            imgContainer.appendChild(button);
            imagePreviewContainer.appendChild(imgContainer);
        };

        reader.readAsDataURL(file); // 파일을 데이터 URL로 읽기
    }
});

function removeImage(button) {
    // Find the parent container of the button
    const imageContainer = button.closest('.image-container');

    // Remove the image container from the DOM
    if (imageContainer) {
        imageContainer.remove();
    }
}


$(function(){
	window.editor.setData("${prod.prodDetail}");
	
	
	$(".ck-blurred").keydown(function(){
		console.log("str : " + window.editor.getData());

		$("#prodDetail").val(window.editor.getData());
		});

		$(".ck-blurred").on("focusout",function(){
		$("#prodDetail").val(window.editor.getData());
	});
	

	let lgu = $('#prodLgu').val();
	
	// 파일 label 이름 변경
	$('#uploadFile').on('change', function() {
		console.log($('#uploadFile').get(0).files);
	    // 선택된 파일이 있는지 확인
	    if ($('#uploadFile').get(0).files.length > 0) {
	        // 파일 이름을 레이블에 설정
	        $('#fileLabel').text($('#uploadFile').get(0).files[0].name);
	    } else {
	        // 파일이 선택되지 않았을 경우 기본 텍스트로 설정
	        $('#fileLabel').text('파일을 선택해주세요');
	    }
	});
	
})
</script>