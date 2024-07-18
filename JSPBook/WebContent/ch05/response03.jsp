<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<%
		response.sendError(404, "요청할 페이지를 찾을 수 없습니다");
		//response.sendError(500, "개발자 오류");
	%>
</body>
</html>