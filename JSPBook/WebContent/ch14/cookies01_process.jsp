<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<!-- 
   요청URI : cookie01_process.jsp
   요청파라미터 : {id=a001,passwd=java}
   요청방식 : post
    -->
	<!-- 쿠키 생성
	Cookie 클래스를 사용하여 쿠키를 생성.
	쿠키를 생성한 후에는 꼭 response 내장 객체의 addCookies()메서드로 쿠키를 설정해야 함 -->
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	
		Cookie cookie_id = new Cookie("id",id);
		Cookie cookie_pw = new Cookie("pw",pw);
		response.addCookie(cookie_id);
		response.addCookie(cookie_pw);
	%>
	<a href="/ch14/cookies01.jsp" class="btn btn-primary">되돌아가기</a>
</body>
</html>