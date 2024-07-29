<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- 폼페이지  -->
	<!-- 
   요청URI : /ch12/filter01_process.jsp
   요청파라미터 : {name=개똥이}
   요청방식 : post
    -->
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>
<h3>입력된 name 값 : <%=name %></h3>
</body>
</html>