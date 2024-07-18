<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- 폼페이지  -->
	<!-- 
   요청URI : /ch12/filter01_process.jsp
   요청파라미터 : {name=개똥이}
   요청방식 : post
    -->
	<form action="/ch12/filter03_process.jsp">
		<p>아이디 : <input type="text" name="id" placeholder="아이디"></p>
		<p>비밀번호 : <input type="password" name="pw" placeholder="비밀번호"></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>