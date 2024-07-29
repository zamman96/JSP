<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<h3>게시글 작성</h3>
	
	<form action="/jdbcBoard/createPost" method="post">
		<p>
			<input type="text" name="boardTitle" placeholder="제목" required="required">
		</p>
		<p>
			<input type="text" name="boardWriter" placeholder="작성자" required="required">
		</p>
		<p>
			<textarea rows="3" cols="50" name="boardContent" placeholder="내용"></textarea>
		</p>
		<p>
			<input type="submit" value="저장">
		</p>
	</form>
</body>
</html>