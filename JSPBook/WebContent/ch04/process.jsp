<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<!-- 
	요청URL : process.jsp
	요청파라미터 : name=이름(input양식 name = value)
	요청방식 : post
	 -->
<% 
	//내장객체.메서드(인코딩)
	request.setCharacterEncoding("UTF-8");
	// 		변수	    내장객체.폼페이지에서 입력된 데이터를 전달하는 요청파라미터값을 가져오는 메서드
	String name = request.getParameter("name"); %>
	<p>이름 : <%=name %></p>
</body>
</html>