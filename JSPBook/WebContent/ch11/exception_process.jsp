<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- <%@ page errorPage="exception_error.jsp" %> --%>
<!-- 본 페이지에서 오류 발생 시 exception_error.jsp에서 오류를 대신 처리 -->
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<% 
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	double res = num1/num2;
		%>
	<p><%=num1 %> / <%=num2 %> = <%=res %></p>
</body>
</html>