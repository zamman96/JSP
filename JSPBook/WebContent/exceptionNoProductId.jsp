<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
	<c:set var="lang" value="${param.language}"/>
	<c:if test="${lang==null}">
		<c:set var="lang" value="ko"/>
	</c:if>
	<fmt:setLocale value="${lang}"/> <!-- 영어 en -->
	<fmt:bundle basename="bundle.message">
	<!-- header -->
	<!-- 
	디렉티브 태그 	속성 	    속성의 값		 -->
	<%@ include file="menu.jsp" %>
		<%
			String pid = request.getParameter("pid");
			ProductRepository dao = ProductRepository.getInstance();
			ProductVO vo = dao.getProductById(pid);
		%>
	<!-- 상품 목록 시작 -->
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다</h2>
		</div>
	</div>
	<div class="container">
		<!-- getRequestURI() : http://localhost/product.jsp -->
		<!-- getQueryString() : productId=P1239 -->
		<p><%=request.getRequestURI() %>?<%=request.getQueryString() %></p>
		<p><a href="/products.jsp" class="btn btn-secondary" role="button"><fmt:message key="product_list" /> &raquo;</a></p>
	</div>
	<!-- 상품 목록 끝 -->
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>	
	</fmt:bundle>
</body>
</html>