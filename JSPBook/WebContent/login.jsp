<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
	<!-- header -->
	<%@ include file="menu.jsp" %>
	
	<!-- 표현문 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" style="justify-content:center; display:flex;">
		<div class="col-md-4 col-md-offset-4" style="width:33%;">
		<h3 class="form-signin-heading">Please sign in</h3>
		<!--  /login.jsp?error=1
		error=1 => param
		param.error => 1 (문자열)-->
		<c:if test="${param.error=='1'}">
			<div class="alert alert-danger">
				아이디와 비밀번호를 확인해주세요.
			</div>
		</c:if>
			<!-- 시큐리티 인증을 위한 Form 페이지 시작 -->
			<form name="loginForm" method="post" action="j_security_check">
				<!-- name속성의 값인 j_username은 변경할 수 없음 -->
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" name="j_username" class="form-control" autofocus id="inputUserName" placeholder="아이디" required/>
				</div>
				<!-- name속성의 값인 j_password도 변경할 수 없음 -->
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" name="j_password" class="form-control" id="inputPassword" placeholder="비밀번호" required/>
				</div>
				<!-- submit 버튼 영역 -->
				<button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
			</form>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>