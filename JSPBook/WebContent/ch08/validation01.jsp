<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script>
function checkForm(){
	let id = document.loginForm.id.value;
	let pw = document.loginForm.pw.value;
	
	console.log(id, pw);
}
</script>
</head>
<body>
	<!-- 폼페이지
		action 생략 시 validation01.jsp가 action의 기본값
	 -->
	<form name="loginForm">
		<!-- 폼데이터 -->
		<p>아이디 : <input type="text" name="id" id="id"/> </p>
		<p>비밀번호 : <input type="password" name="pw" id="pw"/></p>
		
		<!-- checkForm() : 핸들러 함수
			전송 버튼을 클릭하면 핸들러 함수를 호출 
		 -->
		<p><input type="button" value="전송" onclick="checkForm()"></p>
	</form>
</body>
</html>