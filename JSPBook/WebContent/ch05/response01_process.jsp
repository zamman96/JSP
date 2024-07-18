<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Object</title>
</head>
<body>
<!-- 
	요청 URI : /ch05/response01_process.jsp
	요청파라미터 : request{id : a001, password : java}
	요청방식 : post
	-->
<% 	
	// 문자인코딩 유형(한글 처리)
	request.setCharacterEncoding("utf-8");
	// request 내장 객체로 전달된 요청 파라미터 정보를 받음
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
%>
<!-- 표현문 -->
<p>아이디 : <%=id %></p>
<p>비밀번호 : <%=pw %></p>
<%	
	if(id.equals("a001")&&pw.equals("java")){ // 로그인 성공 시 이동
		response.sendRedirect("/welcome.jsp");
	} else{ // 로그인 실패시 로그인 화면으로 이동
		response.sendRedirect("/ch05/response01.jsp");
	}
%>
</body>
</html>