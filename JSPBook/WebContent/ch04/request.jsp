<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
	<!-- 
	form 페이지
	요청URL : process.jsp
	요청파라미터 : name=이름(input양식 name = value)
	요청방식 : post
	 -->
	 <!-- 
	 	action 기본값 현재 페이지(request.jsp)
		method 기본값 get	 
	 -->
	<form action="process.jsp" method="post">
		<!-- 폼데이터 -->
		<p>
			<label>이름</label>
			<!-- required : 필수 입력 -->
			<input type="text" name="name" required="required" placeholder="이름"/>
			<input type="submit" value="전송"/>
		</p>
	</form>
</body>
</html>