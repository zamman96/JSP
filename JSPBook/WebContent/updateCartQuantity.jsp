<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
//상품 ID와 변경된 수량을 받아옴
	// JSON 데이터를 파싱하여 필요한 정보 가져오기
    BufferedReader reader = request.getReader();
    StringBuilder sb = new StringBuilder();
    String line;
    while ((line = reader.readLine()) != null) {
        sb.append(line);
    }

    // JSON 데이터 파싱
    Gson gson = new Gson();
    String reqdata = sb.toString();
    ProductVO pvo = gson.fromJson(reqdata, ProductVO.class);
    String productId = pvo.getProductId();
    int quantity = pvo.getQuantity();


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