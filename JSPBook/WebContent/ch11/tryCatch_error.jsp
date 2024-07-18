<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<!-- isErrorPage 속성 : 현재 JSP 페이지를 오류 페이지로 호출하는 page 디렉티브 태그의 속성
	이때 오류 페이지에서 exception 내장 객체를 사용할 수 있음 -->
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<h3>잘못된 데이터가 입력되었습니다</h3>
	<p><%=request.getParameter("num1") %></p>
	<p><%=request.getParameter("num2") %></p>
	<p><a href="/ch11/tryCatch.jsp">처음으로 이동</a></p>
</body>
</html>