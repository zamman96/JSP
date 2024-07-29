<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
	<%
		// 날짜 객체 생성
		Date today = new Date();
		
		// 간단 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(today);
	%>
	 오늘 날짜 : <%=str %>
</body>
</html>