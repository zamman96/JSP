<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String productId = request.getParameter("productId");
	System.out.println("id"+productId);
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	System.out.println(quantity);
	// 세션에서 장바구니 정보를 가져옴
	session = request.getSession();
	List<ProductVO> list = (List<ProductVO>) session.getAttribute("cartlist");
	
	// 장바구니에서 해당 상품을 찾아 수량 업데이트
	for (ProductVO product : list) {
	    if (product.getProductId().equals(productId)) {
	        product.setQuantity(quantity);
	        break;
	    }
	}
	
	// 업데이트된 장바구니 정보를 세션에 저장
	session.setAttribute("cartlist", list);
%>