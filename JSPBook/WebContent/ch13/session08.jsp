<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>session</title>
</head>
<body>
	<%
		//java.util.Date
	    Date time = new Date();
	    //간단날짜형식. java.text.SimpleDateFormat
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
		// 고유한 세션 내장 객체의 아이디
		String sessionId = session.getId();
	
		// 세션이 생성된 시간
		//1970년 1월 1일 이후 흘러간 시간을 의미, 단위는 ms
		long startTime = session.getCreationTime();
		
		// 세션에 마지막으로 접근한 시간
		long lastTime = session.getLastAccessedTime();
		
		// 웹 사이트에 머문 시간
		long userTime = lastTime - startTime;
	%>
	<p>세션 아이디 : <%=sessionId %></p>
	<p>요청시작 시간 : <%=format.format(startTime) %></p>
	<p>요청 마지막 시간 : <%=format.format(lastTime) %></p>
	<p>웹 사이트의 경과시간 : <%=userTime/(1000*60)%>분</p>
</body>
</html>