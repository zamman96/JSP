<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
	<!-- header -->
	<%@ include file="menu.jsp" %>
	
	<%! // 선언문
		// 전역변수
		String greeting = "Welcome to My Page";
		String tagline = "I want to sleep";
	%>
	<!-- 표현문 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting %></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3><%=tagline %></h3>
			<%
				Date day = new Date();
				int hour = day.getHours();
				String min = "0"+day.getMinutes();
				String sec = "0"+day.getSeconds();
				String am_pm;
				if(hour/12==0){
					am_pm ="AM";
				} else {
					am_pm = "PM";
					hour = hour-12;
				}
				String hourStr = "0"+hour;
				hourStr = hourStr.substring(hourStr.length()-2,hourStr.length());
				min = min.substring(min.length()-2,min.length());
				sec = sec.substring(sec.length()-2,sec.length());
				String CT = hourStr + ":" + min + ":" + sec + " " + am_pm;
				
				
				out.print("<p>"+CT+"</p>");
			%>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>