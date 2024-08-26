<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen"/>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
    <style>
        #file-list {
            display: flex;
            flex-direction: column;
            margin-top: 20px;
        }
        .file-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .file-preview {
            margin-right: 10px;
        }
        .file-item img {
            width: 100px;
            border: 1px solid #ced4da;
            border-radius: .25rem;
        }
    </style>
<script>
let selectedFiles = [];
$(function(){
	ClassicEditor.create(document.querySelector('#temp'),{ckfinder:{uploadUrl:'/image/upload?${_csrf.parameterName}=${_csrf.token}'}})
	 .then(editor=>{window.editor=editor;
	
	$(".ck-blurred").keydown(function(){
		console.log("str : " + window.editor.getData());
		$("#perDet").val(window.editor.getData());
	});

	$(".ck-blurred").on("focusout",function(){
		$("#perDet").val(window.editor.getData());
	});
	
	})
	.catch(err=>{console.error(err.stack);});
	

		
	let currentPage = 1;
	$('#cust').on('click', function(){
		$('#modal-lg').modal('show');
		currentPage=1;
		let data = {"currentPage" : currentPage}
		$.ajax({
			type : "get",
			url : "/car/custList",
			dataType : "json",
			data : data,
			success : function(res){
				console.log(res.content);
				let str = '';
				$.each(res.content, function(idx,vo){
					console.log("vo", vo);
					str += "<tr class='custSel' data-num='"+vo.custNum+"' data-nm='"+vo.custNm+"'>";
					str += "<td>"+vo.custNm+"</td>";
					str += "<td>"+vo.pnum+"</td>";
					str += "<td>"+vo.addr+"</td>";
					str += "<td>"+vo.detAddr+"</td>";
					str += "<td>"+vo.pne+"</td>";
					str += "</tr>";
				});
				$('#custT').html(str);
				$('#custP').html(res.pagingArea);
			}
		})
	})
	$('#emp').on('click', function(){
		$('#modal-emp').modal('show');
		currentPage=1;
		let data = {"currentPage" : currentPage}
		$.ajax({
			type : "get",
			url : "/emp/empList",
			dataType : "json",
			data : data,
			success : function(res){
				console.log(res.content);
				let str = '';
				$.each(res.content, function(idx,vo){
					console.log("vo", vo);
					str += "<tr class='empSel' data-num='"+vo.empNum+"' data-nm='"+vo.nm+"'>";
					str += "<td>"+vo.nm+"</td>";
					str += "<td>"+vo.pnum+"</td>";
					str += "<td>"+vo.addr+"</td>";
					str += "<td>"+vo.detAddr+"</td>";
					str += "<td>"+vo.pne+"</td>";
					str += "</tr>";
				});
				$('#empT').html(str);
				$('#empP').html(res.pagingArea);
			}
		})
	})
	
	$(document).on('click', '.custSel', function(){
		let num = $(this).data("num");
		let nm = $(this).data("nm");
		$('#custNum').val(num);
		let name = nm+"("+num+")";
		$('#custInfo').val(name);
		$('#modal-lg').modal('hide');
		
		$.ajax({
			type : "get",
			url : "/cust/carList",
			dataType : "json",
			data : {"custNum" : num},
			success : function(res){
				console.log(res);
				let str = '';
				$.each(res, function(idx,vo){
					console.log("vo", vo);
					str += "<option value='"+vo.carNum+"'>"+vo.carNum+" ("+vo.mfr+")"+"</option>";
				});
				$('#carNum').html(str);
			}
		})
	})
	
	$(document).on('click', '.empSel', function(){
		currentPage=1;
		let num = $(this).data("num");
		let nm = $(this).data("nm");
		$('#empNum').val(num);
		let name = nm+"("+num+")";
		$('#empInfo').val(name);
		
		$('#modal-emp').modal('hide');
	})
	
	$('#submit').on('click', function(){
		let custNum = $('#custNum').val();
		let empNum = $('#empNum').val();
		let carNum = $('#carNum').val();
		let amt = $('#amt').val();
		let perTme = $('#perTme').val();
		let perDet = $('#perDet').val();
		
		console.log(selectedFiles); // selectedFiles 배열 확인
		
	    // FormData 객체 생성
	    let formData = new FormData();
	    formData.append("custNum", custNum);
	    formData.append("empNum", empNum);
	    formData.append("carNum", carNum);
	    formData.append("amt", amt);
	    formData.append("perTme", perTme);
	    formData.append("perDet", perDet);

	    // 선택한 파일들을 FormData에 추가
	    selectedFiles.forEach(file => {
	        formData.append("uploadFile", file); // uploadFile 필드에 파일 추가
	    });

		$.ajax({
			type : "post",
			url : "/perSer/registPost",
			// 파일업로드시 필수!!
			contentType:false, //보내는데이터타입 false->"multipart/form-data"로 선언됩니다.
			processData:false, //폼데이터가 name=값&name=값 형식으로 자동변경되는 것을 막아줍니다.
			data : formData,
			// csrf설정 secuity설정된 경우 필수!!
			beforeSend:function(xhr){ 
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}"); 
			},
			success : function(res){
				console.log(res);
// 				location.href="/perSer/detail?serNum="+res;
			}
		})
	})
})

// 파일이 선택될 때 호출되는 함수
function concatFile(files) {
    // FileList를 배열로 변환
    let fileArr = Array.from(files);

    // 기존의 selectedFiles 배열에 새로운 파일 추가
    selectedFiles = selectedFiles.concat(fileArr);

    // 파일 목록 표시 업데이트
    updateFileList(selectedFiles);
}

// 파일 목록 표시를 업데이트하는 함수
function updateFileList(files) {
    const fileList = document.getElementById('file-list');
    fileList.innerHTML = ''; // 기존 파일 목록을 초기화

    // 선택된 파일을 반복하면서 미리보기 생성
    files.forEach((file) => {
        const reader = new FileReader();

        reader.onload = function(e) {
            const item = document.createElement('div');
            item.className = 'file-item';

            // 이미지 미리보기 생성
            const img = document.createElement('img');
            img.src = file.type.match("image.*") ? e.target.result : '/resources/images/noimage.jpg';
            img.className = 'file-preview';

            // 파일 이름 표시
            const fileName = document.createTextNode(file.name);

            // 삭제 버튼 생성
            const deleteButton = document.createElement('button');
            deleteButton.innerText = "X";
            deleteButton.addEventListener('click', (event) => {
                item.remove(); // 미리보기 항목 제거
                event.preventDefault();
                deleteFile(file); // 파일 삭제 처리
            });

            item.appendChild(img);
            item.appendChild(fileName);
            item.appendChild(deleteButton);
            fileList.appendChild(item);
        };

        reader.readAsDataURL(file); // 파일을 읽어 미리보기 생성
    });
	 // 선택된 파일 목록을 input 파일 태그에 반영
	    updateInputFile();

//     console.log(selectedFiles); // 현재 선택된 파일 확인
}

//선택된 파일을 input 태그에 반영하는 함수
function updateInputFile() {
    const inputFile = document.getElementById('uploadFile');
    const dataTransfer = new DataTransfer(); // 새로운 DataTransfer 객체 생성

    // selectedFiles를 inputFile.files에 추가
    selectedFiles.forEach(file => {
        dataTransfer.items.add(file);
    });

    // inputFile의 files 속성을 업데이트
    inputFile.files = dataTransfer.files;
}

function deleteFile(deleteFile) {
    const inputFile = $('#uploadFile');
    const dataTransfer = new DataTransfer();
    selectedFiles = selectedFiles.filter(file => file!==deleteFile);
    selectedFiles.forEach(file => {
        dataTransfer.items.add(file);
    })
    inputFile.files = dataTransfer.files;
//     console.log(selectedFiles);
 // 선택된 파일 목록을 input 파일 태그에 반영
    updateInputFile();
}
</script>
<div class="card card-success">
	<div class="card-header">
		<h2>수리 서비스 등록</h2>
	</div>

	<form action="/perSer/registPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<div class="card-body">
			<div class="row">
				<div class="col-sm-12">
					<!-- text input -->
					<div class="form-group"  data-target="#modal-emp" id="emp">
						<label for="empNum">사원</label> 
						<input hidden required type="text" class="form-control" placeholder="사원번호" name="empNum" id="empNum">
						<input required type="text" class="form-control" placeholder="사원정보" name="empInfo" id="empInfo">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group" data-target="#modal-lg" id="cust">
						<label for="custNum">고객</label>
						<input hidden required="required" type="text" class="form-control" placeholder="고객" name="custNum" id="custNum">
						<input required="required" type="text" class="form-control" placeholder="고객" name="custInfo" id="custInfo">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="carNum">자동차</label>
						<select name="carNum" id="carNum" class="form-control">
							<option value="고객을 선택해주세요"></option>
						</select>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="amt">수리비용</label>
						<input required="required" type="number" class="form-control" placeholder="수리비용" name="amt" id="amt">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="perTme">수리시간</label>
						<input required="required" type="text" class="form-control" placeholder="수리시간" name="perTme" id="perTme">
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="perDet">수리 내역</label>
						<div id="temp"></div>
						<textarea hidden rows="3" id="perDet" class="form-control" name="perDet" cols=""></textarea>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="uploadFile">첨부 파일</label>
						<div class="custom-file">
							<input onchange="concatFile(this.files)" id="uploadFile" name="uploadFile" type="file" multiple="multiple" class="custom-file-input">
							<label class="custom-file-label" id="fileLabel"
								for="uploadFile">파일을 선택해주세요</label>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<div id="file-list"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer row" style="justify-content: space-between;">
			<sec:csrfInput/>
			<div style="float: left;">
				<a href="/perSer/list" class="btn btn-info">목록</a>
			</div>
			<div style="float: right;">
				<button type="submit" class="btn btn-warning">등록</button>
			</div>
		</div>
	</form>
</div>
<div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">고객 정보</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <table class="table table-hover text-nowrap">
				<thead>
					<tr>
						<th>고객명</th>
						<th>우편번호</th>
						<th>주소</th>
						<th>상세주소</th>
						<th>연락처</th>
					</tr>
				</thead>
				<tbody id="custT">

				</tbody>
			</table>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
            <div class="card-footer clearfix" style="width: 100%" id="custP"></div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
<div class="modal fade" id="modal-emp">
        <div class="modal-dialog modal-emp">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">사원 정보</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <table class="table table-hover text-nowrap">
				<thead>
					<tr>
						<th>사원명</th>
						<th>우편번호</th>
						<th>주소</th>
						<th>상세주소</th>
						<th>연락처</th>
					</tr>
				</thead>
				<tbody id="empT">

				</tbody>
			</table>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
            <div class="card-footer clearfix" style="width: 100%" id="empP"></div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->