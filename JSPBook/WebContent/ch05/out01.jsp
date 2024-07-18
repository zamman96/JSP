<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Object</title>
</head>
<body>
	<%
		out.print("오늘의 날짜 및 시간 : <br />");
		out.print("<p>"+ Calendar.getInstance().getTime() + "</p>");
		out.print("&copy 오리");
	%>
</body>
</html>