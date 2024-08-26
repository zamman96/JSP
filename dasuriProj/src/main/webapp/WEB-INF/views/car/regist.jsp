<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen"/>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<style>
.file-item img {
    width: 100px;
    border: 1px solid #ced4da;
    border-radius: .25rem;
}
</style>
<script>
let selectedFiles = [];
$(function(){
	let currentPage = 1;
	$('#cust').on('click', function(){
		let data = {"currentPage" : 1}
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
					str += "<td>"+vo.addr+"</td>";
					str += "<td>"+vo.pnum+"</td>";
					str += "<td>"+vo.detAddr+"</td>";
					str += "<td>"+vo.pne+"</td>";
					str += "</tr>";
				});
				$('#custT').html(str);
				$('#custP').html(res.pagingArea);
			}
		})
	})
	
	$(document).on('click', '.custSel', function(){
		let num = $(this).data("num");
		let nm = $(this).data("nm");
		$('#custNum').val(num);
		let name = nm+"("+num+")";
		$('#custinfo').val(name);
		
		$('#modal-lg').modal('hide');
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
		<h2>자동차 등록</h2>
	</div>

	<form action="/car/registPost" method="post">
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<!-- text input -->
					<div class="form-group">
						<label for="nm">자동차번호</label> <input required type="text"
							class="form-control" placeholder="자동차번호"
							name="carNum" id="carNum">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group" data-toggle="modal" data-target="#modal-lg" id="cust">
						<label for="custNum">고객 번호</label>
						<input hidden required="required" type="text" class="form-control" placeholder="고객 번호" name="custNum" id="custNum">
						<input required="required" type="text" class="form-control" placeholder="고객" id="custinfo">
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="mfr">제조사</label>
						<select class="custom-select" required="required" name="mfr" id="mfr">
							<option value="" selected disabled>선택해주세요</option>
							<c:forEach var="mfr" items="${mfr}">
								<option value="${mfr.mfrCode}">${mfr.mfrNm}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="myr">연식</label>
						<input required="required" type="number" class="form-control" placeholder="연식" name="myr" id="myr">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="drvDst">주행거리</label>
						<input required="required" type="text" class="form-control" placeholder="주행거리" name="drvDst" id="drvDst">
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
			<div>
				<a href="/car/list" class="btn btn-info">목록</a>
			</div>
			<div>
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
						<th>주소</th>
						<th>우편번호</th>
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