<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<!-- 
   		요청URI : form01_process.jsp
   		요청파라미터 : request{id=a001,pw=java,name=개똥이
         		,phone1=010,phone2=111,phone3=2222
         		,gender=여성,hobby=reading,movie}
  		 요청방식 : post
   -->
	<%
		/*
			사용자가 웹브라우저의 폼페이지에 입력한 데이터를 서버(톰캣 컨테이너)로 전달하여(submit)
			서버가 이를 처리
			request 내장 객체를 이용하여 폼페이지에서 전달된 값을 얻을 수 있음
		*/
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
		String hobbyStr = "";
		if(hobby!=null){
			for(String a : hobby){
				hobbyStr += a + ", ";
			}
			hobbyStr = hobbyStr.substring(0, hobbyStr.length()-2);
		}
		String comment = request.getParameter("comment").replaceAll("[\n]", "<br>");
		String food = request.getParameter("food");
	%>
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pw %></p>
	<p>이름 : <%=name %></p>
	<p>연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %></p>
	<p>성별 : <%=gender %></p>
	<p>취미 : <%=hobbyStr %></p>
	<p>인사말<br><%=comment %></p>
	<p>좋아하는 음식 : <%=food %></p>
</body>
</html>