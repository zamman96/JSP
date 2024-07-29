<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="errorPage_error.jsp" %>
<!-- page 디렉티브. errorPage속성의 값으로 jsp페이지를 넣음
JSP 페이지로 실행되는 도중 오류 발생 시 오류 페이지 호출
 -->
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- parameter name값이 없다면 오류 발생 (null을 대문자로 변환불가능) -->
	<p>name 파라미터 : <%=request.getParameter("name").toUpperCase() %></p>
</body>
</html>