<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Security</title>
</head>
<body>
	<h3>인증 성공02! 프로그래밍적 시큐리티 처리</h3>
	<!-- security를 통해서 로그인 한 사용자의 아이디 -->
	<p>사용자명 : <%=request.getRemoteUser() %></p>
	<!-- web.xml의 <auth-method>FORM</auth-method> -->
	<p>인증방법 : <%=request.getAuthType() %></p>
	<p>인증한 사용자명이 role(역할) "tomcat"에 속하는 사용자 인지 여부
	<!-- Is that your role? -->
		<%=request.isUserInRole("tomcat") %></p>
	<p>인증한 사용자명이 role(역할) "role1"에 속하는 사용자 인지 여부
	<!-- Is that your role? -->
		<%=request.isUserInRole("role1") %></p>
</body>
</html>