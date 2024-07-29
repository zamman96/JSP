<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Object</title>
</head>
<body>
	<!-- 
		요청 URI : out02_process.jsp
		요청파라미터(HTTP파라미터, QueryString) : request{id : admin, password : java}
		요청방식 : post
	-->
	<%
		//request 내장 객체. 문자 인코딩 유형을  UTF-8로 작성
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id"); // admin
		String pw = request.getParameter("password"); //java
		
		/*
		out.print("<p>아이디 : "+id+"</p>");
		out.print("<p>비밀번호 : "+pw+"</p>");
		*/
	%>
	<p>아이디 : <%out.print(id);%></p>
	<p>비밀번호 : <%out.print(pw);%></p>
	
	<!-- 표현문 -->
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pw %></p>
</body>
</html>