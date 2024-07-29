<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>id라는 session객체의 속성명</title>
</head>
<body>
	<%	
	// 세션에 저장된 이름 id 추가
		session.setAttribute("id","admin");
	
	// 결과 확인
		response.sendRedirect("/ch13/session02.jsp");
	%>
</body>
</html>