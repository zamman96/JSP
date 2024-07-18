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
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-success" style="color:green;font-weight:bold;">주문해주셔서 감사합니다.</h2>
		<p>주문은 <%=Shipping_shippingDate %>에 배송될 예정입니다.</p>
		<p>주문 번호 : <%=Shipping_cartId %></p>
	</div>
	<div class="container">
		<p>
			<a href="/products.jsp"
			class="btn btn-secondary">&laquo;상품 목록</a>
		</p>
	</div>
	<!-- footer -->
	<%@ include file="footer.jsp" %>
	<%
		// 장바구니 비우기
		session.removeAttribute("cartlist");
		
		// 배송정보 쿠키 삭제
		for(Cookie cookie : cookies){
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	%>
</body>
</html>