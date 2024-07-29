<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
	<%
	// 지역변수
	String name = "오리";
	%>
	<%@ include file="include02_header.jsp" %>
	<p><%=name%>님 방문해 주셔서 감사합니다.
	</p>
	<%@ include file="include02_footer.jsp" %>
</body>
</html>