<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
	<p>이 페이지는 5초마다 새로고침 됩니다</p>
	<%
		//response 내장 객체
		/*
			서버(톰캣) > 응답 > 클라이언트 (크롬)
			MIME 유형, 문자 인코딩, 오류메세지 (404, 500),
			상태코드를 설정 및 가져올 수 있음
		*/
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		response.setIntHeader("Refresh", 5);
	
	%>
	<p><%=new Date() %></p>
	<p>문자 인코딩 : <%=response.getCharacterEncoding() %></p>
	<p>콘텐츠 유형 : <%=response.getContentType() %></p>
	
</body>
</html>