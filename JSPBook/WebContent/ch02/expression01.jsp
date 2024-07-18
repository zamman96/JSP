<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%	// 스크립틀릿
		// 지역변수
		int a = 10;
		int b = 20;
		int c = 30;
		
		out.print(a + b + c + "<br>");
	%>
	<!-- 표현문 -->
	<p>오늘은 <%=new Date().getDate()%>일 입니다.</p>
	<p><%=a + b + c %></p>
</body>
</html>