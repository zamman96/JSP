<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
	$('#btnDel').on('click',function(){
		location.href="/ch13/session04.jsp";
	})
	$('#btnAdd').on('click',function(){
		location.href="/ch13/session04_add.jsp";
	})
	$('#btnDelAll').on('click',function(){
		location.href="/ch13/session04_all.jsp";
	})
})
</script>
<title></title>
</head>
<body>
	<%	
	
		// 생성된 세션의 정보를 가져오기
		/*
		1. getAttribute() : 단일 세션 정보 얻기
			Object getAttribute(String name)
		2. getAttributeNames() : 다중 세션 정보 얻기
			세션에 저장된 여러 개의 세션 속성 이름을 열거형으로 반환
		*/
		if(request.isRequestedSessionIdValid()){
			out.print("세션이 유효화지 않음");
		} else{
			out.print("세션이 유효");
		}
		
		// Object 타입
		String id = (String) session.getAttribute("id"); // admin;
		String pw = (String) session.getAttribute("pw"); // java;
		String id2 = (String) pageContext.getAttribute("id"); // admin;
		String id3 = (String) request.getAttribute("id"); // admin;
		String id4 = (String) application.getAttribute("id"); // admin;
	%>
	<p>설정된 세션 속성 값 : <%=id %></p>
	<p>설정된 세션 속성 값 : <%=pw %></p>
	<p>설정된 pageContext 속성 값 : <%=id2 %></p>
	<p>설정된 request 속성 값 : <%=id3 %></p>
	<p>설정된 application 속성 값 : <%=id4 %></p>
	<hr>
	<% 
		String name = "";
		String value = "";
		// 세션에 저장된 모든 세션 속성 이름을 리턴
		Enumeration names = session.getAttributeNames();
		int i= 0;
		// 세션 속성 이름이 있을 때까지만 반복
		while(names.hasMoreElements()){
			name = names.nextElement().toString();
			value = session.getAttribute(name).toString();
			 out.print("설정된 세션 속성 명 [" + i + "] : " + name + "<br />");
	         out.print("설정된 세션 속성 값 [" + i + "] : " + value + "<br />");
	         out.print("<hr />");
	         i++;
		}
	%>
	<button type="button" id="btnDel">id 세션 삭제</button>
	<button type="button" id="btnAdd">id 세션 추가</button>
	<button type="button" id="btnDelAll">모든 세션 속성 이름 삭제</button>
</body>
</html>