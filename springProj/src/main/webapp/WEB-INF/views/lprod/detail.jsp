<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 상세</title>
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
		if(confirm("정말 현재 상품을 삭제하시겠습니까?")){
			location.href = "/lprod/delete?lprodId=${vo.lprodId}";
		}
	})
}
</script>
<body>
<!-- //// 일반모드 시작 //// -->
<div id="viewForm">
	<h2>상품 상세</h2>
		<p>상품번호 : ${vo.lprodId}</p>
   		<p>상품분류번호 : ${vo.lprodGu}</p>
   		<p>상품분류명 : ${vo.lprodNm}</p>
   	<p>
		<input type="button" id="edit" value="수정">
		<input type="button" id="del" value="삭제">
      	<input type="button" value="목록" onclick="javascript:location.href='/lprod/list'" />
	</p>
</div>
<!-- //// 일반모드 끝 //// -->
<!-- //// 수정모드 시작 //// -->
<div id="editForm">
	<h2>상품 수정</h2>
	<form action="/lprod/update" method="post">
		<input type="hidden" name="lprodId" value="${vo.lprodId}">
   		<p>상품분류코드 : <input type="text" name="lprodGu" required placeholder="상품분류코드" value="${vo.lprodGu}" /></p>
   		<p>상품분류명 : <input type="text" name="lprodNm" required placeholder="상품분류명" value="${vo.lprodNm}"/></p>
          	<p>
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="location.href='/lprod/detail?lprodId=${vo.lprodId}'">
			</p>
	</form>
</div>
<!-- //// 수정모드 끝 //// -->
</body>
</html>