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
	
	<%! // 선언문
		// 전역변수
		String greeting = "Welcome to My Page";
		String tagline = "I want to sleep";
	%>
	<!-- 표현문 -->
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURI() %></p>
		<p><a href="/products.jsp" class="btn btn-secondary" role="button">상품목록 &raquo;</a></p>
	</div>
	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>