<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<h2>파일업로드</h2>
<form action="/item/registerPost" method="post" enctype="multipart/form-data">
	<input type="file" name="uploadFile" />
	<button type="submit">파일업로드</button>
</form>
<hr/>
<form action="/item/registerPost2" method="post" enctype="multipart/form-data">
	<p>이름 : <input type="text" name="name"></p>
	<input type="file" name="fileImage" />
	<button type="submit">파일업로드</button>
</form>