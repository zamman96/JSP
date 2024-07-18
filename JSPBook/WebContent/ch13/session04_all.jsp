<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>id라는 session객체의 속성명</title>
</head>
<body>
	<%	
	// 다중 세션 삭제
	// session.invalidate();
	// 세션에 저장된 모든 세션 속성 이름 삭제
		session.invalidate();

		application.removeAttribute("id");
	// 결과 확인
		response.sendRedirect("/ch13/session02.jsp");
	%>
</body>
</html>