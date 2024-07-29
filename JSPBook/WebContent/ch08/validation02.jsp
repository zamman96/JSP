<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script>
function checkForm(){
	let form = document.loginForm;
	let id = form.id.value;
	let pw = form.pw.value;
	
	
	if(id.trim() == ""){
		alert("아이디를 입력해주세요 ");
		form.id.focus(); // 해당 요소로 커서 이동
	 	return false; // submit 안됨
	} else if(pw.trim() == ""){
		form.pw.focus();
	 	return false; // submit 안됨
	}
	
	console.log(id, pw);
	
	/*
  	 유효성 검사 처리 방법 : 사용자가 폼 페이지에 입력한 데이터 값이 서버(톰켓)로 전송되기 전에 
            웹 브라우저(크롬)에서 검증하는 방법
   1) 기본 유효성 검사 : 폼 페이지에 입력된 데이터 값의 존재 유무를 검사함
   2) 데이터 형식 유효성 검사 : 정규 표현식을 사용하여 폼 페이지에 입력된 데이터 값이
               	특정 패턴에 적합한지 여부를 검사
              데이터 값의 유무에 대한 검사. 
              사용자가 아이디와 비밀번호 등의 필수(mandatory, Not Null) 입력 항목을 입력하지 않고
      [전송]을 클릭하면 입력하지 않았다는 오류 메시지가 나타남
   */
	
	// form을 submit
	document.loginForm.submit();
}
</script>
</head>
<body>
	<!--  body와 body사이를 document라고 부름 -->
	<!-- 폼페이지
		action 생략 시 validation01.jsp가 action의 기본값
	 -->
	 <!-- 폼페이지 
  	 요청URI : validation02_process.jsp
  	 요청파라미터(QueryString) : {id=a001,passwd=java}
  	 요청방식(Http method) : post 
   -->
	<form name="loginForm" action="validation02_process.jsp" method="post">
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