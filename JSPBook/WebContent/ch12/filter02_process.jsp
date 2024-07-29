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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<h3>입력된 id 값 : <%=id %></h3>
<h3>입력된 pw 값 : <%=pw %></h3>
</body>
</html>