<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Form Processing</title>
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
	$('#btnAuto').on('click',function(){
		$('#id').val('a001');
// 		$('input[name="id"]').val('a001');
		$('#pw').val('java');
		$('#name').val('홍길동');
		$('#phone1').val('010');
		$('#phone2').val('1234');
		$('#phone3').val('4567');
		$('textarea').val('안녕하세요\n반갑습니다');
		
		$('#genW').prop('checked', true);
  		$('#hR').prop('checked', true);
  		$('#hM').prop('checked', true);
	});
})
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<!-- 
   		요청URI : form01_process.jsp
   		요청파라미터 : {id=a001,pw=java,name=개똥이
         		,phone1=010,phone2=111,phone3=2222
         		,gender=여성,hobby=reading,movie}
  		 요청방식 : post
   -->
	<form action="form02_process.jsp" name="member" method="post">
		<p>
			아이디 : <input type="text" name="id" id="id"/>
			<input type="button" value="중복 검사"/>
		</p>
		<p>
			비밀번호 : <input type="password" name="pw" id="pw"/>
		</p>
		<p>
			이름 : <input type="text" name="name" id="name"/>
		</p>
		<p>
			<!-- maxlength : 최대 글지 지정 , size : 너비 지정 -->
			연락처 : 
			<!-- select 태그 : 여러 개의 항목이 나타나는 목록 상자에서 항목을 선택하는 태그 -->
			<select name="phone1" id="phone1">
				<option value="" disabled selected>선택</option>
				<option value="010">010</option>
				<option value="011">011</option>
			</select>
			- <input type="text" maxlength="4" size="4" name="phone2" id="phone2"/> -
			<input type="text" maxlength="4" size="4" name="phone3" id="phone3"/>
		</p>
		<p>
			성별 : <input id="genM" type="radio" name="gender" value="남성" checked /><label for="genM">남성</label>
			<input id="genW" type="radio" name="gender" value="여성" /><label for="genW">여성</label>
		</p>
		<p>
			취미 : 
			<label for="hR">독서</label><input id="hR" type="checkbox" name="hobby" value="reading" />
			<label for="hE">운동</label><input id="hE" type="checkbox" name="hobby" value="exercise" />
			<label for="hM">영화</label><input id="hM" type="checkbox" name="hobby" value="movie" />
		</p>
		<p>
			<!-- 여러줄을 입력 cols="열의 수" rows="행의 수" -->
			<textarea rows="3" cols="30" placeholder="가입 인사말" name="comment"></textarea>
		</p>
		<p>
			좋아하는 음식 : <select name="food">
				<optgroup label="한식">
					<option value="김치찌개">김치찌개</option>
					<option value="밥버거">밥버거</option>
				</optgroup>
				<optgroup label="중식">
					<option value="짜장면">짜장면</option>
					<option value="짬뽕">짬뽕</option>
				</optgroup>
				<optgroup label="양식">
					<option value="피자">피자</option>
					<option value="스파게티">스파게티</option>
				</optgroup>
			</select>
		</p>
		<p>
			<input type="submit" value="가입">
			<input type="reset" value="초기화">
			<input type="button" value="자동입력" id="btnAuto">
		</p>
	</form>
</body>
</html>