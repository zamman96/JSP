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
	let form = document.frm;
	let age = form.age.value;
	
	/*
	// 첫글자
	let lastName = name.substr(0,1); // 성
	
	// isNaN : (It)istNotaNumber (숫자 아님)
	console.log(isNaN(lastName)); // 숫자가 아닐때 true
	
	if(!isNaN(lastName)){
		alert("이름은 숫자로 시작할 수 없습니다");
		form.name.select();
		return;
	}
	*/
	
	form.submit();
}
</script>
</head>
<body>
	<!--  body와 body사이를 document라고 부름 -->
	 <!-- form에 action없음=>현재URL을 요청, method없음=>기본get방식 -->
	<form name="frm">
		<!-- 폼데이터 -->
		<p>나이 : <input type="text" name="age" onkeypress="checkKey()"/> </p>
		<p><input type="button" value="전송" onclick="checkForm()"></p>
	</form>
</body>
</html>