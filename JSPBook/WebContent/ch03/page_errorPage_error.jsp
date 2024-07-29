<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="page_errorPage_error.jsp" %>
<%@ page isErrorPage="true" %>
<!-- 
	isErrorPage 속성 : 오류 페이지인지 여부를 설정, 기본값은 false
 -->
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title> 
</head>
<body>
	<img alt="오류메세지" src="https://uic.yonsei.ac.kr/main/images/errorpage.jpg"><br>
	<!-- isErrorPage가 true이면 exception을 사용할 수 있다 -->
	<%=exception.getMessage() %> 
</body>
</html>