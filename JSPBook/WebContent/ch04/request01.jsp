<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- 폼페이지 
	요청 URI : request01_process.jsp
	요청파라미터 : {id : a001, password : java}
	요청방식 : post
	-->
	<form action="request01_process.jsp" method="post">
		<!-- 폼데이터 -->
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="password" name="password"></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>