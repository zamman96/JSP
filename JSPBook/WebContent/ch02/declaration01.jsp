<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<%! // 선언문 태그
		// 정수형 변수. 할당(대입)
		int data = 50; 
		
		// 전역 메서드
		// 매개변수, 리턴타입
		public int sum(int a, int b){
			return a+b;
		};
		
		public String makeItLower(String name){
			return name.toLowerCase();
		}
	%>
		
	<% // 스크립틀릿
		out.println("data : "+data+"<br>");
		out.println("2 + 3 = "+sum(2,3)+"<br>"); // 파라미터, (메서드) 호출
		out.println(makeItLower("HELLO DUCK")+"<br>");
	%>
</body>
</html>