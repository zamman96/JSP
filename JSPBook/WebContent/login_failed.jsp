<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	// 로그인 자체가 안됨 => 아이디가 없거나 비밀번호가 잘못된 경우
	// login.jsp로 강제 이동
	
	response.sendRedirect("/login.jsp?error=1");
%>