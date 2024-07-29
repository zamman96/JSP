<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<form action="/lprod/createPost" method="post">
		<p>
			<select name="gubun">
				<option value="" disabled selected>선택해주세요</option>
				<option value="P1" >컴퓨터전자</option>
				<option value="P2" >의류</option>
				<option value="P3" >생활용품</option>
				<option value="P4" >음반/도서</option>
				<option value="P5" >음식</option>
			</select>
		</p>
		<p>
			상품분류명 : <input type="text" name="lprodNm" placeholder="상품분류명" required>
		</p>
		<p>
			<input type="submit" value="등록">
		</p>
	</form>
</body>
</html>