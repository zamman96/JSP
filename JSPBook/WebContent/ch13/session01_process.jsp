<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	/*
		세션을 사용하려면 세션을 생성해야 함
		1) 세션 생성  
			JSP 내장 객체인 session.setAttribute(String name, Object value);
			세션의 속성을 설정하면 계속 세션 상태를 유지할 수 있음.
			만약, 동일한 세션의 속성 이름으로 세션을 생성하면 마지막에 설정한 것이 세션 속성 값이 됨
		2) 세션 설명 :
		    String name : 
		    	세션으로 사용할 세션 속성 이름. 세션에 저장된 특정 값(value)
		                  을 찾아오기 위한 키로 사용 됨.
		    Object value : 세션 속성의 값. Object 객체 타입만 가능하므로
		    	int, double, char 등의 기본 타입은 사용할 수 없음
	*/
	if(id.equals("admin")&&pw.equals("java")){
		// sessionScope(아시아) - 동일 웹브라우저 내
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		out.print("세션 설정 성공<br>");
		out.print(id+"님 환영합니다");
		
		// pageScope (대전) - 동일 jsp 내
		pageContext.setAttribute("id", id);
		// requestScope (대한민국) - 동일 요청 내
		request.setAttribute("id", id);
		//applicationScope (지구) - 웹브라우저 내
		application.setAttribute("id", id);
	} else {
		out.print("세션 설정 실패");
	}
%>
<h3>입력된 id 값 : <%=id %></h3>
<h3>입력된 pw 값 : <%=pw %></h3>
</body>
</html>