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
	
	
	/*
  	 유효성 검사 처리 방법 : 사용자가 폼 페이지에 입력한 데이터 값이 서버(톰켓)로 전송되기 전에 
            웹 브라우저(크롬)에서 검증하는 방법
   1) 기본 유효성 검사 : 폼 페이지에 입력된 데이터 값의 존재 유무를 검사함
   2) 데이터 형식 유효성 검사 : 정규 표현식을 사용하여 폼 페이지에 입력된 데이터 값이
               	특정 패턴에 적합한지 여부를 검사
      데이터 길이 확인하기
      아이디, 비밀번호 등과 같은 입력 데이터의 제한 길이 검사   	
   */
   
    // 아이디 4~12자
	if(id.trim().length < 4 ||id.length > 12){
		alert("아이디를 4~12자 이내로 입력해주세요 ");
		form.id.select(); // 해당 요소의 값을 블록 처리
	 	return false; // submit 안됨
	} 
	
	// 비밀번호 4자 이상
	if(pw.trim().length < 4){
		alert("비밀번호를 4자 이상으로 입력해주세요 ");
		form.pw.select();
	 	return false; // submit 안됨
	}
	
	console.log(id, pw);
	
	
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
   <%
		// 문자 인코딩 유형 처리
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		if(id==null){
			id="";
		}
	%>
	<form name="loginForm" action="validation03_process.jsp" method="post">
		<!-- 폼데이터 -->
		<p>아이디 : <input type="text" name="id" id="id" value="<%=id%>"/> </p>
		<p>비밀번호 : <input type="password" name="pw" id="pw" value="${param.pw}"/></p>
		
		<!-- checkForm() : 핸들러 함수
			전송 버튼을 클릭하면 핸들러 함수를 호출 
		 -->
		<p><input type="button" value="전송" onclick="checkForm()"></p>
	</form>
</body>
</html>