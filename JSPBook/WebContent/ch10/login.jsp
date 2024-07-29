<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Security</title>
</head>
<body>
	<!-- 로그인 인증 처리를 위한 form 페이지 -->
	<!-- 폼 기반 인증을 처리하도록 action 속성의 값을 j_security_check로 작성 -->
	<form name="loginForm" method="post" action="j_security_check">
		<!-- name속성의 값인 j_username은 변경할 수 없음 -->
		<p>아이디 : <input type="text" name="j_username" placeholder="아이디" required="required"/></p>
		<!-- name속성의 값인 j_password도 변경할 수 없음 -->
		<p>비밀번호 : <input type="password" name="j_password" required="required"/></p>
		<p><input type="submit" value="전송" /></p>
	</form>
</body>
</html>