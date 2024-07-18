<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
</head>
<body>
<!-- 
   요청URI : validation05_process.jsp
   요청파라미터 : request{id=a001,passwd=java,name=개똥이
            ,phone1=010,phone2=1234,phone3=4321,email=test@test.com}
   요청방식 : post
   -->
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String email = request.getParameter("email");
%>
<p>아이디 : <%=id %></p>
<p>비밀번호 : <%=pw %></p>
<p>이름 : <%=name %></p>
<p>핸드폰 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %></p>
<p>이메일 : <%=email %></p>

</body>
</html>