<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>책 상세</title>
</head>
<script>
window.onload = function(){
	let p1 = document.querySelector('#viewForm');
	let p2 = document.querySelector('#editForm');
	
	let edit = document.querySelector('#edit');
	let del = document.querySelector('#del');
	
	p2.hidden = true;
	
	edit.addEventListener('click', function(e){
		p1.hidden = true;
		p2.hidden = false;
	})
	
	del.addEventListener('click', function(e){
		if(confirm("정말 현재 책을 삭제하시겠습니까?")){
			location.href = "/delete?bookId=${vo.bookId}";
		}
	})
}
</script>
<body>
<!-- //// 일반모드 시작 //// -->
<div id="viewForm">
	<h2>책 상세</h2>
		<p>제목 : ${vo.title}</p>
   		<p>카테고리 : ${vo.category}</p>
   		<p>가격 ${vo.price}</p>
   			<!-- <form>~</form> 태그 안에 내용이 서버로 전송됨
            	서버로 전달되는 항목들은 form 태그 안에 존재해야 함.
            name 속성은 key로, value 속성을 value로 판단함
          -->
			<p>
				<input type="button" id="edit" value="수정">
				<input type="button" id="del" value="삭제">
      		<input type="button" value="목록" onclick="javascript:location.href='/list'" />
			</p>
</div>
<!-- //// 일반모드 끝 //// -->
<!-- //// 수정모드 시작 //// -->
<div id="editForm">
	<h2>책 수정</h2>
	<form action="/update" method="post">
		<input type="hidden" name="bookId" value="${vo.bookId}">
		<p>제목 : <input type="text" name="title" required placeholder="제목" value="${vo.title}"/></p>
   		<p>카테고리 : <input type="text" name="category" required placeholder="카테고리" value="${vo.category}" /></p>
   		<p>가격 : <input type="number" name="price" required placeholder="가격" value="${vo.price}"/></p>
   			<!-- <form>~</form> 태그 안에 내용이 서버로 전송됨
            	서버로 전달되는 항목들은 form 태그 안에 존재해야 함.
            name 속성은 key로, value 속성을 value로 판단함
          -->
          	<p>
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="location.href='/detail?bookId=${vo.bookId}'">
			</p>
	</form>
</div>
<!-- //// 수정모드 끝 //// -->
</body>
</html>