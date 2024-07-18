<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>session</title>
</head>
<body>
	<h4>----------세션 유효시간 변경 전 --------</h4>
	<%
	/*
	    세션 유효 시간 : 세션을 유지하기 위한 세션의 일정 시간
	       웹 브라우저(크롬)에 마지막 접근한 시간부터 일정 시간 이내에 다시 웹 브라우저에
	          접근하지 않으면 자동으로 세션이 종료됨
	    세션 유효 시간 설정 : void setMaxInactiveInterval(int interval) : 초단위
    */
    
		// 세션에 설정된 유효 시간(기본 1800초 (30분))
		int time = session.getMaxInactiveInterval(); // 초단위
	%>
	<p>세션 유효 시간 : <%=time %></p>
	<h4>----------세션 유효시간 변경 후 --------</h4>
	<%
		session.setMaxInactiveInterval(60*60); // 초단위
		
		time = session.getMaxInactiveInterval(); // 초단위
	%>
	<p>세션 유효 시간 : <%=time %></p>
	
</body>
</html>