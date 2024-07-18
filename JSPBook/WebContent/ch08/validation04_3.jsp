<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script>
function checkForm(){
	let regExp = /Java/i; 
	
	 let str = document.frm.name.value;
	 
	 console.log(str); // Java Server Page
	 
	 // exec : 찾는다
	 // "Java".찾는다("Java Server Page")
	 let result = regExp.exec(str);
	 
	 if(result!=null){
		 console.log(result[0]); // Java
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
		<p><input type="button" value="전송" onclick="checkForm()"></p>
	</form>
</body>
</html>