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
	<p><img src="/images/error.png"></p>
	<p>예외 : <%=exception %></p>
	<p>toString : <%=exception.toString() %></p>
</body>
</html>