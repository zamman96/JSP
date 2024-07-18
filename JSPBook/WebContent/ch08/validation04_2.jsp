<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script>
function checkKey(){
	// event :
	let keyCode = event.keyCode;
	
	console.log("keyCode : "+keyCode);
	
	if(!(keyCode>=48 && keyCode<=57)){
		alert("숫자를 입력해주세요");
		event.returnValue = false;
	}
}

function checkForm(){
	let form = document.loginForm;
	let id = form.id.value;
	let pw = form.pw.value;
	
	for(i=0; i<id.length; i++){
		let ch = id.charAt(i);
		// 소문자 / 대문자 / 숫자가 아닐 때 인 조건
		if(!((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z')||(ch>='0'&&ch<='9'))){
			alert('아이디는 영 소문자나 숫자만 입력 가능합니다');
			form.id.select();
			return;
		}
	}
	
	// 숫자만 입력가능
	if(isNaN(pw)){
		alert("비밀번호는 숫자만 입력해주세요");
		form.pw.select();
		return;
	}
	
	form.submit();
}
</script>
</head>
<body>
	<!--  body와 body사이를 document라고 부름 -->
	 <!-- form에 action없음=>현재URL을 요청, method없음=>기본get방식 -->
	<form name="loginForm">
		<!-- 폼데이터 -->
		<p>아이디 : <input type="text" name="id"/> </p>
		<p>비밀번호 : <input type="password" name="pw"/> </p>
		<p><input type="button" value="전송" onclick="checkForm()"></p>
	</form>
</body>
</html>