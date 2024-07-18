<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	addCount();
%>
<p><%=name %>님은 이 사이트에 <%=pageCount %>번째 방문하였습니다.</p>
<%! // 선언문
	// 전역 변수(재기동 해야 0으로 다시 초기화가 됨)
	String name = ""; // 지역변수에서 사용하므로 해당 이름입력X
	// 방문 카운터
	int pageCount = 0; 
	// 전역 메서드
	void addCount(){
		pageCount++;
	}
%>
<div>Copyright &copy; <%=name %></div>
<!-- 지역변수 name 들어감 -->
 