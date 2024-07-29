<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="page_errorPage_error.jsp" %>
<!-- 
	errorPage 속성 : 오류 발생 시 특정 오류 처리 페이지로 이동
 -->
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title> 
</head>
<body>
	<% // 스크립틀릿
		// 지역변수 : 밑에서 부터만 변수 활용 가능
		String str = null;
		
		// 오류 (null은 toString() 할 수 없음)
		// HTTP 상태 500 : HTTP Status. 개발자 오류
		out.print(str.toString());
	%>
	<%=str %>
</body>
</html>