<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String Shipping_name = "";
String Shipping_zipCode = "";
String Shipping_country = "";
String Shipping_addressName = "";
String Shipping_shippingDate = "";
String Shipping_cartId = "";

Cookie[] cookies = request.getCookies();
//쿠키의 개수만큼 반복
for(int i=0;i<cookies.length;i++){
   Cookie thisCookie = cookies[i];
   //쿠키 이름 가져옴
//    out.print(thisCookie.getName() + "<br />");
   //쿠키 값 가져옴
//    out.print(URLDecoder.decode(thisCookie.getValue(),"UTF-8")+"<br />");
   if(thisCookie.getName().equals("Shipping_name")){
      Shipping_name = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
   }
   if(thisCookie.getName().equals("Shipping_zipCode")){
      Shipping_zipCode = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
   }
   if(thisCookie.getName().equals("Shipping_country")){
      Shipping_country = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
   }
   if(thisCookie.getName().equals("Shipping_addressName")){
      Shipping_addressName = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
   }
   if(thisCookie.getName().equals("Shipping_shippingDate")){
      Shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
   }
   if(thisCookie.getName().equals("Shipping_cartId")){
      Shipping_cartId = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
   }
}

		//장바구니 세션 가져오기
		List<ProductVO> list = (List<ProductVO>)session.getAttribute("cartlist");

%>
	<!-- header -->
	<%@ include file="menu.jsp" %>

	<!-- 표현문 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<!-- 고객 정보 시작 : cookie 사용 -->
		<div class="row justify-content-between" style="padding:5%">
			<strong>배송 주소</strong><br>
			성명 : <%=Shipping_name %><br>
			우편번호 : <%=Shipping_zipCode %><br>
			주소 : <%=Shipping_addressName %>&nbsp;<%=Shipping_country %><br>
		</div>
		<div align="right">
			<p>
				<em>배송일 : <%=Shipping_shippingDate %></em>
			</p>
		</div>
	
	<!-- 상품 정보 시작 -->
	<c:set var="list" value="<%=list %>"/>
	<div>
		<table class="table table-hover" style="background:white;">
			<tr style="text-align:center;">
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<c:set var="amt" value="${amt + vo.unitPrice * vo.quantity}"/>
				<tr>
					<td style="vertical-align: middle; display:flex; align-item:center;">
						<span><img src="/images/${vo.filename}" style='width:100px; margin-right:60px;' /></span>
						<span><span class="badge badge-danger">${vo.condition}</span> ${vo.productId}<br>${vo.pname}</span></td>
					<td style="vertical-align: middle; text-align:center;"><fmt:formatNumber value="${vo.unitPrice}" type="number" pattern="#,###" /></td>
					<td style="vertical-align: middle; text-align:center;">${vo.quantity}</td>
					<td style="vertical-align: middle; text-align:center;"><fmt:formatNumber value="${vo.unitPrice * vo.quantity}" type="number" pattern="#,###" /></td>
				</tr>
			</c:forEach>
			<tr>
				<th></th>
				<th></th>
				<th>총 액</th>
				<th id="sumsum" style="color:red;"><fmt:formatNumber value="${amt}" type="number" pattern="#,###" /></th>
			</tr>
		</table>
		<div class="row justify-content-between">
		<a href="/shippingInfo.jsp?cartId=<%=Shipping_cartId%>" class="btn btn-secondary" role="button">이전</a>
		<a href="/thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
		<a href="/checkOutCancelled.jsp" class="btn btn-danger" role="button">취소</a>
		</div>
	</div>
	</div>
	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>