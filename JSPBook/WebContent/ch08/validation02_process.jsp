<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<h3>로그인을 성공했습니다</h3>
	<%
		// 문자 인코딩 유형 처리
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pw %></p>
	<p><button onclick="javascript:history.back()">이전페이지로 이동</button></p>
</body>
</html>