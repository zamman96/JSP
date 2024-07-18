<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page errorPage="/exceptionNoProductId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script>
function addToCart(){
	let form = document.addForm;
	let q = document.querySelector('#qu').value;
	if(q==0){
		alert("수량을 선택해주세요");
		return;
	}
	if(confirm("상품을 장바구니에 추가하시겠습니까?")){
		form.submit();
	} else{
		form.reset();
	}
}
</script>
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
			try{
				vo.toString();
			}catch(ArithmeticException e){
				RequestDispatcher dispatcher =
						request.getRequestDispatcher("exceptionNoProductId.jsp");

				dispatcher.forward(request, response);
			}
		%>
	<!-- 상품 목록 시작 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="product_description" /></h1>
		</div>
	</div>
	<div class="container">
	<div class="text-right">
		<a href="/product.jsp?pid=<%=pid %>&language=ko">Korean</a>
		<a href="/product.jsp?pid=<%=pid %>&language=en">English</a>
	</div>
		<c:set var="vo" value="<%=vo %>"/>
		<div class="row">
			<div class="col-md-6"> <!-- style = " width : 50%; "-->
				<span class="badge badge-danger">${vo.condition}</span>
				<h3>
				${vo.pname}</h3>
				<img src="/images/${vo.filename}" style='width:200px;' />
				<p>${vo.description}</p>
				<p>
					<b><fmt:message key="productId" /> : </b>
					${vo.productId}
				</p>
				<p>
					<b><fmt:message key="manufacturer" /> : </b>
					${vo.manufacturer}
				</p>
				<p>
					<b><fmt:message key="category" /> : </b>
					${vo.category}
				</p>
				<p>
					<b><fmt:message key="unitsInStock" /> : </b>
					${vo.unitsInStock}
				</p>
				<h4>
					<fmt:formatNumber value="${vo.unitPrice}" type="number" pattern="#,###" /><fmt:message key="won" />
				</h4>
				<p>
				<!-- 장바구니에 상품을 넣음
					addToCart() 핸들러 함수 -->
					<form name="addForm" method="post" action="/addCart.jsp">
					<input type="text" name="pId" value="${vo.productId}" hidden="hidden">
					<label>수량</label>
					<input type="number" name="q" value="0" id="qu">
						 <a href="#" class="btn btn-info" onclick="addToCart()">상품 주문&raquo;</a>
						<!--  장바구니 목록 -->
						<a href="/cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
						<a href="/products.jsp" class="btn btn-secondary" role="button"><fmt:message key="product_list" /> &raquo;</a>
					</form>
				</p>
			</div>
		</div>
	</div>
	<!-- 상품 목록 끝 -->
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>	
	</fmt:bundle>
</body>
</html>