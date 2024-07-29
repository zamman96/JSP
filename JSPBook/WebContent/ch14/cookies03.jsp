<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
		//Cookie cookie_id = new Cookie("userId",user_id);
	//Cookie cookie_pw = new Cookie("userPd",user_pw);
	//+ JSESSIONID
	//요청 시 함께 툭툭 던져지는 request객체 안에 있는 쿠키들을 확인해보자
	Cookie[] cookies = request.getCookies();
	
	//현재 설정된 쿠키의 개수?
	out.print("현재 설정된 쿠키의 개수 : " + cookies.length + "<br />");
	out.print("<hr />");
	for (int i = 0; i < cookies.length; i++) {//i : 0, 1, 2
		out.print("<p>쿠키[" + i + "] : " + cookies[i] + "</p>");
		// 쿠키 속성 이름
		out.print("<p>설정된 쿠키의 속성 이름[" + i + "] : " + cookies[i].getName() + "</p>");
		//쿠키 속성 값
		out.print("<p>설정된 쿠키의 값[" + i + "] : " + cookies[i].getValue() + "</p>");
		out.print("<hr />");
	
		//쿠키 삭제
		/*
		    쿠키를 삭제하는 기능은 별도로 없음.
		    쿠키를 더 유지할 필요가 없으면 쿠키의 유효 기간을 만료하면 됨
		    쿠키의 유효 기간을 결정하는 setMaxAge() 메소드에 유효 기간을 0으로 설정하여
		 쿠키를 삭제할 수 있음
		*/
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
	}
	out.print("<p>세션ID : " + session.getId() + "</p>");
%>
<script>
setTimeout(function(){
	location.href="/ch14/cookies01.jsp";
},5000);
</script>