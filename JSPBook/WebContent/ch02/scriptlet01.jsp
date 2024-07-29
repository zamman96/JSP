<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%	// 스크립틀릿
		// ** 지역변수
		// 선언과 동시에 값을 할당 ==> 초기화
		int a = 2;
		int b = 3;
		int sum = a+b;
		// out객체 : JSP기본 내장 객체
		out.print(a+" + "+b+" = "+sum+"<br>");
	%>
</body>
</html>