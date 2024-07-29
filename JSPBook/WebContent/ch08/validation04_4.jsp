<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script>
function checkForm(){
	// 이름은 숫자로 시작할 수 없다
	let name = document.frm.name.value;
	// 정규 표현식 생성
	// (문자만 가능) [a-z] : a~z 사이의 문자 1개
	let regExp = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	
	// ! 테스트 통과X
	if(!regExp.test(name)){ // test()메서드
		alert("이름은 숫자로 입력할 수 없습니다.");
		return;
	}
	
}
</script>
</head>
<body>
	<!--  body와 body사이를 document라고 부름 -->
	 <!-- form에 action없음=>현재URL을 요청, method없음=>기본get방식 -->
	<form name="frm">
		<!-- 폼데이터 -->
		<p>이름 : <input type="text" name="name"/> </p>
		<!-- 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkForm()"></p>
	</form>
</body>
</html>