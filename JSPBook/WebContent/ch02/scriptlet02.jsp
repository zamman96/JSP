<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%	// 스크립틀릿
		// 0부터 10까지의 짝수를 화면에 출력
		for(int i=0; i<=10; i=i+2){
			out.print(i+"<br>");
		}
	%>
</body>
</html>