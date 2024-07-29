<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
	$('#btnCookieDel').on('click',function(){
		location.href="/ch14/cookies03.jsp"
	})
})
</script>
</head>
<body>
<%
	// 클라이언트에 저장한 모든 쿠키 객체를 가져옴
	Cookie[] cookies = request.getCookies();

	for(int i=0; i<cookies.length; i++){
		out.print("<p>"+cookies[i].getName() + " : " + cookies[i].getValue() + "</p>" );
	}
	out.print("<hr />");
	out.print("<p>세션 아이디 : "+session.getId()+"</p>");

%>
<!-- 
   요청URI : cookie01_process.jsp
   요청파라미터 : {id=a001,passwd=java}
   요청방식 : post
    -->
	<form action="cookies01_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id" placeholder="아이디"></p>
		<p>비밀번호 : <input type="password" name="pw" placeholder="비밀번호"></p>
		<p><input type="submit" value="전송"></p>
		<p><input id="btnCookieDel" type="button" value="쿠키 삭제"></p>
	</form>
</body>
</html>