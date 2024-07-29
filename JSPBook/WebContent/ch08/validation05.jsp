<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
<script>
function checkMember(){ // 가입하기
	// form object
	let form = document.Member;
	
	//1) 아이디는 영(대소문자)로 시작(시작만 따지기 떄문에 $로 종료시키지 않음)
	let regExpId = /^[a-z|A-Z]/;
	// 2) 이름은 한글만 입력.
	let regExpName = /^[가-힣]+$/;
	// 3) 비밀번호는 숫자만 입력
	let regExpPasswd =  /^[0-9]+$/;
	// 4) 연락처 형식 준수 (010-111-2222, 010-1231-1231)
	// \d숫자
	let regExpPhone = /^\d{3}-\d{3,4}-\d{4}/;
	// 5) 이메일 형식 준수 (02test-_\.02test@naver-_\..com(kr))
	// * : 0 이상 반복
	// + : 1 이상 반복
	// ? : 존재하거나 존재하지 않음
	let regExpEmail = /^[0-9|a-z|A-Z]([-_\.]?[0-9|a-z|A-Z])*@[0-9|a-z|A-Z]([-_\.]?[0-9|a-z|A-Z])*\.[a-z|A-Z]{2,3}$/i;
	
	let id = form.id.value;
	let passwd = form.passwd.value;
	let name = form.name.value;
	let phone = form.phone1.value+"-"+form.phone2.value+"-"+form.phone3.value;
	let email = form.email.value;
	
	// JSON Object
	let data = {
			"id" : id,
			"passwd" : passwd,
			"name" : name,
			"phone" : phone,
			"email" : email
	}
	
	if(!regExpId.test(data.id)){
		alert("잘못된 아이디 형식입니다");
		form.id.select();
		return;
	}
	if(!regExpPasswd.test(data.passwd)){
		console.log(form.passwd.value)
		alert("잘못된 비밀번호 형식입니다");
		form.passwd.select();
		return;
	}
	if(!regExpName.test(data.name)){
		alert("잘못된 이름 형식입니다");
		form.name.select();
		return;
	}
	if(!regExpPhone.test(data.phone)){
		alert("잘못된 전화번호 형식입니다");
		form.phone2.select();
		return;
	}
	if(!regExpEmail.test(data.email)){
		alert("잘못된 이메일 형식입니다");
		form.email.select();
		return;
	}
	
	
	form.submit();
}
</script>
</head>
<body>
<!-- 
   요청URI : validation05_process.jsp
   요청파라미터 : request{id=a001,passwd=java,name=개똥이
            ,phone1=010,phone2=1234,phone3=4321,email=test@test.com}
   요청방식 : post
   -->
<h3>회원 가입</h3>
   <form action="validation05_process.jsp" name="Member" method="post">
      <p>아이디 : <input type="text" name="id" /></p>
      <p>비밀번호 : <input type="password" name="passwd" /></p>
      <p>이름 : <input type="text" name="name" /></p>
      <p>연락처 : 
         <select name="phone1">
            <option value="010">010</option>         
            <option value="011">011</option>         
            <option value="016">016</option>         
            <option value="017">017</option>         
            <option value="019">019</option>         
         </select> - 
         <input type="text" maxlength="4" size="4" name="phone2" /> -
         <input type="text" maxlength="4" size="4" name="phone3" />
      </p>
      <p>이메일 : <input type="text" name="email" /></p>
      <p><input type="button" value="가입하기" onclick="checkMember()" /></p>
   </form>
</body>
</html>