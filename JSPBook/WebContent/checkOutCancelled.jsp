<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
			<h1 class="display-3">주문 취소</h1>
		</div>
	</div>
	<div class="container">
		<%
			session.removeAttribute("cartlist");
		
			Cookie[] cookies = request.getCookies();
			// 배송정보 쿠키 삭제
			for(Cookie cookie : cookies){
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		%>
		<h2 class="alert alert-danger" style="color:red;font-weight:bold;">주문이 취소되었습니다.</h2>
	</div>
	<div class="container">
		<p>
		<a href="/products.jsp" class="btn btn-secondary" role="button">상품 목록 &raquo;</a>
		</p>
	</div>
	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>