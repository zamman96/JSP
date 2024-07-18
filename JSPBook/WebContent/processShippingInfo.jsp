<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Enumeration en = request.getParameterNames();
	Cookie[] cookies = new Cookie[6];
	int cnt = 0;
	
	while(en.hasMoreElements()){
		String paramName = (String)en.nextElement();
		out.println(paramName);
		/*
	      //paramName : [cartId, name, shippingDate
	      //   , country, zipCode, addressName]
	      
	      request{cartId=aslkasdfj,name=개똥이,shippingDate=2024-07-18,
	            country=대한민국,zipCode=12345,addressName=중구 선화동123}
	      */
	      //cookies
	      //[0]       [1]      [2]    [3]      [4]      [5]
	      //cartId쿠키 name쿠키  ..
		cookies[cnt] = new Cookie("Shipping_"+paramName, 
				URLEncoder.encode(request.getParameter(paramName),"UTF-8")); 
	    cookies[cnt].setMaxAge(60*60);
	    
		response.addCookie(cookies[cnt++]);
	}
	response.sendRedirect("/orderConfirmation.jsp");
%>
<a href="/ch14/cookies01.jsp" target="_blank">[테스트] 쿠키생성 확인</a>