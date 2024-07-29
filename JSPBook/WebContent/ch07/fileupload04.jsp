<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>File Upload</title>
</head>
<body>
<!-- 1. form태그 2. post 3.multipart/form-data 4. file 
   요청URI : fileupload04_process.jsp
   요청파라미터 : {filename=파일객체}
   요청방식 : post
   -->
	<form action="fileupload04_process.jsp" method="post" enctype="multipart/form-data">
		<p><input type="file" name="filename" /></p>
		<p><input type="submit" value="파일올리기" /></p>
	</form>
</body>
</html>