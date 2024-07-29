<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String productId = request.getParameter("pId");
	int q = Integer.parseInt(request.getParameter("q"));

	//addCart.jsp or addCart.jsp?productId=
	if(productId==null || productId.trim().isEmpty()){
		response.sendRedirect("/products.jsp");
		return;
	}
	//기본키인 P1234 코드의 상품을 찾아보자
	//싱글톤 패턴으로 객체를 1회 생성
	ProductRepository dao = ProductRepository.getInstance();
	
	//select * from ProductRepository
	//where id='P1234';
	ProductVO vo = dao.getProductById(productId);
	if(vo==null){
		// 상품이 없음 예외 페이지로 이동		
		response.sendRedirect("/exceptionNoProductId.jsp");
		return;
	} else {
		
	}
	
	// 장바구니 (세션) => 세션명 : cartlist
	List<ProductVO> list = (List<ProductVO>)session.getAttribute("cartlist");
	
	// 장바구니가 없다면 생성
	if(list == null){
		list = new ArrayList<>();
		session.setAttribute("cartlist", list);
	}
	// 장바구니에 파라미터에 해당하는 상품이 있는 지 체크
	int cnt = 0;
	//1)장바구니에 P1234 상품이 이미 들어있는 경우
	   //    private int quantity;   //상품을 장바구니에 담은 개수
	   //   quantity를 1 증가
	   //2)장바구니에 P1234 상품이 없는 경우
	   //  장바구니에 상품을 넣어주고
	   //   quantity를 1로 처리
	   //list : 장바구니에 들어있는 상품 목록
	   for(int i=0; i<list.size(); i++){
		   if(list.get(i).getProductId().equals(productId)){
			   cnt=list.get(i).getQuantity()+q;
			 //장바구니에 상품이 이미 들어있다면 장바구니에 담은 개수만 1 증가
			 list.get(i).setQuantity(cnt);
		   }
	   }
	 //장바구니에 해당 상품이 없다면
	   if(cnt==0){
			vo.setQuantity(q);
			list.add(vo);
	   }
	 
	 // 장바구니 확인
	 // list : 장바구니. List<ProductVO>
	   for(ProductVO vv : list){
		   out.print(vv.toString()+"<br/>");
	   }
	   
	   session.setAttribute("cartlist", list);
	   
	   response.sendRedirect("/product.jsp?pid="+productId);
%>
<%=productId%>