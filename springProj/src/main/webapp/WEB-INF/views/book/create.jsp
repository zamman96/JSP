<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<h2>책 등록하기</h2>
	<!-- 
	   요청URI : /createPost
	   요청파라미터 : {title=개똥이의 모험, category=소설, price=12000}
	   요청방식 : post
	   
	   get방식 : 주소표시줄에 요청파라미터가 노출됨
   	   post방식 : 주소표시줄에 요청파라미터가 노출되지 않음. 주소창에 변화 없이
            데이터만 서버로 전달 됨
   -->
	<form action="/createPost" method="post">
		<p>제목 : <input type="text" name="title" required placeholder="제목" /></p>
   		<p>카테고리 : <input type="text" name="category" required placeholder="카테고리" /></p>
   		<p>가격 : <input type="number" name="price" required placeholder="가격" /></p>
   		<p>
   			<!-- <form>~</form> 태그 안에 내용이 서버로 전송됨
            	서버로 전달되는 항목들은 form 태그 안에 존재해야 함.
            name 속성은 key로, value 속성을 value로 판단함
          -->
      		<input type="submit" value="저장" />
      		<input type="button" value="목록" onclick="javascript:location.href='/list'" />
   		</p>
	</form>
</body>
</html>