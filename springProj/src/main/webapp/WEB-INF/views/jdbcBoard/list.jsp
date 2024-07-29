<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 목록</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script>
window.onload = function(){
	let board = document.querySelectorAll('.board');
	
	board.forEach(function(e){
		e.addEventListener('click',function(e){
			let tr = e.target.parentNode;
			let no = tr.getAttribute('idx');
			console.log(no);
			location.href = "/jdbcBoard/detail?boardNo="+no;
		})
	})
}
</script>
<style>
.board:hover{
	background: skyblue;
}
</style>
</head>
<body>
<h3>게시글 목록</h3>
<a href="/jdbcBoard/create">게시글 등록</a>
<form action="/jdbcBoard/list">
	<select name="gubun">
		<option value="" disabled selected>선택해주세요</option>
		<option value="boardTitle"
		<c:if test="${param.gubun=='boardTitle'}">selected</c:if>
		>제목</option>
		<option value="boardWriter"
		<c:if test="${param.gubun=='boardWriter'}">selected</c:if>
		>작성자</option>
		<option value="boardContent"
		<c:if test="${param.gubun=='boardContent'}">selected</c:if>
		>내용</option>
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
	<input type="reset" onclick="location.href='/jdbcBoard/list'">
</form>
<table border="1">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="vo" items="${list}">
	<tr class="board" idx="${vo.boardNo}">
		<td>${vo.boardNo}</td>
		<td>${vo.boardTitle}</td>
		<td>${vo.boardWriter}</td>
		<td><fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd"/></td>
		<td>${vo.boardCnt}</td>
	</tr>
	</c:forEach>
</table>
	${data.pagingArea}
</body>
</html>