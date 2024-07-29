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
<script src="/js/jquery-3.6.0.js"></script>
<script>
$(function(){
	$(document).on('click','.col-md-4',function(){
		let id = $(this).attr("name");
		location.href="/product.jsp?pid="+id;
	})
})
</script>
</head>
<body>
	<!-- header -->
	<!-- 
	디렉티브 태그 	속성 	    속성의 값		 -->
	<%@ include file="menu.jsp" %>
	<% // 스크립틀릿getQueryString()
	// 클래스			    객체 	 클래스			     메서드(호출)
	ProductRepository dao = ProductRepository.getInstance();
	// 객체타입		변수		객체	메서드(호출)
	List<ProductVO> list = dao.getAllProducts();
	%>
	<!-- 상품 목록 시작 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Product List</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
		<c:set var="list" value="<%=list %>"/>
		<!-- 상품 반복 부분 시작 -->
		
		<!-- 객체 타입 변수 list에 저장된 상품 목록 개수만큼 실행하는 JSTL 반복문 -->
		<c:forEach var="vo" items="${list}">
			<div class="col-md-4" name="${vo.productId}">
				<!-- EL 표현문 -->
				<h3>${vo.pname}</h3>
				<img src="/images/${vo.filename}" style='width:200px;' />
				<p>${vo.description}</p>
				<p><fmt:formatNumber value="${vo.unitPrice}" type="number" pattern="#,###" />원</p>
				<p>
					<a href="product.jsp?pid=${vo.productId}" class="btn btn-secondary" role="button">상세정보 &raquo;</a>
				</p>
			</div>
		</c:forEach>		
		<!-- 상품 반복 부분 끝 -->
		</div>
		<hr />
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="/addProduct.jsp" class="btn btn-primary" role="button">등록</a>
				</div>
			</div>
	</div>
	<!-- 상품 목록 끝 -->
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>	
</body>
</html>