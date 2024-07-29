<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Object</title>
</head>
<body>
	<!-- 
	요청 URI : out02_process.jsp
	요청파라미터(HTTP파라미터, QueryString) : request{id : admin, password : java}
	요청방식 : post
	-->
	<form action="out02_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id" placeholder="아이디" title="아이디" required></p>
		<p>비밀번호 : <input type="password" name="password" placeholder="비밀번호" title="비밀번호" required></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>