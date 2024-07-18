<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	<%! // 선언문 태그 (변수, 메서드 선언)
	// 전역 변수 선언
	int count = 3;
	
	// 전역 메서드 선언 (영문 소문자로 변환하여 리턴)
	// String : 리턴 타입 / data : 매개변수(파라미터(인수)를 받음)
	// 접근제한자 생략 시 open 범위는  >> 동일 패키지 (default)
	String makeItLower(String data){
		return data.toLowerCase();
	}
	%>
	
	<% // 스크립틀릿 태그(자바 로직 코드 생성)
		// 지역 변수 i. 1부터 3까지 1씩 증가
		for(int i=1; i<=count; i++){
			// out : JSP의 기본 내장 객체 - 화면에 출력 (PrintWrite)
			out.println("Java Server Pages " + i + ".<br />");
		}
	%>
	
	<!-- 표현문 태그 -->
	<%=makeItLower("HELLO WORLD") %>
	
</body>
</html>