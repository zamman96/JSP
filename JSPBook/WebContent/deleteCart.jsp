<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
//요청URI : /deleteCart.jsp?cartId=CF61A1B17D9247CFCA3D6B33E48528A6
//요청파라미터 : cartId=CF61A1B17D9247CFCA3D6B33E48528A6
//session.getId() : 세션고유아이디 = 고유장바구니 = 동일웹브라우저 = 1명의고객
	String cartId = request.getParameter("cartId");

	//cartId가 없네? => cart.jsp로 이동
	if(cartId==null || cartId.trim().isEmpty()){
		response.sendRedirect("/cart.jsp");
		return;
	}
	
	if(!session.getId().equals(cartId)){
		response.sendRedirect("/products.jsp");
		return;
	}
	
	session.removeAttribute("cartlist");
	// session.invalidate(); // 로그아웃
	
	response.sendRedirect("/cart.jsp");
	
%>