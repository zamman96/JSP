<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
///removeCart.jsp?id=P1234 의 요청 파라미터를 받아서 변수에 저장
	String pId = request.getParameter("pId");

	if(pId==null||pId.trim().isEmpty()){
		response.sendRedirect("/products.jsp");
		return;
	}
	
	//기본키인 P1234 코드의 상품을 찾아보자
	//싱글톤 패턴으로 객체를 1회 생성
	ProductRepository dao = ProductRepository.getInstance();
	
	//select * from ProductRepository
	//where id='P1234';
	ProductVO vo = dao.getProductById(pId);
	if(vo==null){
		// 상품이 없음 예외 페이지로 이동		
		response.sendRedirect("/exceptionNoProductId.jsp");
		return;
	} 
	
	 // 세션에서 장바구니 정보를 가져옴
    session = request.getSession();
    List<ProductVO> list = (List<ProductVO>) session.getAttribute("cartlist");
    
    // 장바구니에서 해당 상품을 찾아 수량 업데이트
    for (int i=0; i<list.size(); i++) {
    	ProductVO product = list.get(i);
        if (product.getProductId().equals(pId)) {
        	list.remove(i);
            break;
        }
    }
    
    // 업데이트된 장바구니 정보를 세션에 저장
    session.setAttribute("cartlist", list);
    response.sendRedirect("/cart.jsp");
%>