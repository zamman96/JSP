<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<!-- 
	요청 URI : request01_process.jsp
	요청파라미터 : {id : a001, password : java}
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
<!-- 
	웹브라우저는 HTTP 헤더에 부가 정보를 담아서 서버로 전송함. 
	request 내장 객체를 통해 헤더 정보, 쿠키 관련 정보를 얻을 수 있음.
-->
<%
	String hostValue = request.getHeader("host");
	String alValue = request.getHeader("accept-language");
	String clValue = request.getHeader("content-length");
%>
<p><%=hostValue %></p>
<p><%=alValue %></p>
<p><%=clValue %></p>
<hr />
<%
	// 모든 헤더 이름을 열거형으로 저장
	Enumeration en = request.getHeaderNames();
	// 저장된 헤더 이름이 있을 때 까지 반복
	while(en.hasMoreElements()){
		//Object 타입
		String name = (String) en.nextElement();
		out.println("<h3>"+name + " : " +request.getHeader(name)+"</h3>");
	}
%>
<hr />
	<!-- 웹 브라우저 / 서버 관련 메서드를 사용해보기 -->
	<p>요청 IP주소 : <%=request.getRemoteAddr() %></p>
	<p>요청 파라미터 길이 : <%=request.getContentLength() %></p>
	<p>문자 인코딩 : <%=request.getCharacterEncoding() %></p>
	<p>콘텐츠 유형(MIME) : <%=request.getContentType() %></p>
	<p>요청 프로토콜 : <%=request.getProtocol() %></p>
	<p>요청 메서드 : <%=request.getMethod() %></p>
	<p>요청 URI경로 : <%=request.getRequestURI() %></p>
	<p>contextPath : <%=request.getContextPath() %></p>
	<p>서버 이름 : <%=request.getServerName() %></p>
	<p>서버 포트번호 : <%=request.getServerPort() %></p>
	<!-- get방식으로 왔을 때 나옴 post는 null -->
	<p>쿼리스트링(요청파라미터) : <%=request.getQueryString() %></p>
	
	<%
		// 새로운 URI로 재요청
		response.sendRedirect("/welcome.jsp");
	%>
</body>
</html>