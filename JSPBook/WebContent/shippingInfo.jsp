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
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	<!-- --------------------배송 정보 시작-------------------- -->
   <!-- /shippingInfo.jsp?cartId=FC168E8DF4B5079F18B719D89DA0075B -->
	<div class="container">
	<!-- 
      요청URI : /processShippingInfo.jsp
      요청파라미터 : {name=개똥이,shippingDate=2024-07-18,
         country=대한민국,zipCode=12345,addressName=중구 선화동123}
      요청방식 : post
      -->
	<form action="/processShippingInfo.jsp" class="form-horizontal" method="post">
		<input type="text" name="cartId" value="<%=request.getParameter("cartId") %>"/>
		<div class="form-group row">
			<label class="col-sm-2">성명</label>
			<div class="col-sm-3">
				<input type="text" name="name" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">배송일</label>
			<div class="col-sm-3">
				<input type="date" name="shippingDate" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">국가명</label>
			<div class="col-sm-3">
				<input type="text" name="country" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">주소</label>
			<div class="col-sm-3">
				<input type="text" name="addressName" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">우편번호</label>
			<div class="col-sm-3">
				<input type="text" name="zipCode" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-offset-2 col-sm-10">
				 <a href="/cart.jsp?cartId=<%=request.getAttribute("cartId")%>" role="button" class="btn btn-secondary">이전</a>
				 <input type="submit" class="btn btn-primary" value="등록"/>
				  <a href="/checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
			</label>
		</div>
		</form>
	</div>
	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>