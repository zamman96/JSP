<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 상단에 작성해줍니다. -->
<%
	pageContext.setAttribute("LF", "\n");
	pageContext.setAttribute("BR", "<br/>");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script>
window.onload = function(){
	let editBtn = document.querySelector('#edit');
	let delBtn = document.querySelector('#delete');
	
	let view = document.querySelector('#viewForm');
	let edit = document.querySelector('#editForm');
	
	editBtn.addEventListener('click', function(e){
		view.hidden = true;
		edit.hidden = false;
	})
	
	delBtn.addEventListener('click', function(e){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "/jdbcBoard/delete?boardNo=${vo.boardNo}";
		}
	})
}
</script>
</head>
<body>
<div id="viewForm">
<h3>게시글 조회</h3>
	<table border="1">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<tr>
		<td>${vo.boardNo}</td>
		<td>${vo.boardTitle}</td>
		<td>${vo.boardWriter}</td>
		<td>
			<fmt:formatDate value="${vo.boardDate}" pattern="yyyy-MM-dd"/> <fmt:formatDate value="${vo.boardDate}" pattern="HH:mm:ss"/>
		</td>
		<td>${vo.boardCnt}</td>
	</tr>
	<tr>
		<td colspan="5">
			<c:out value="${fn:replace(vo.boardContent, LF, BR)}" escapeXml="false"/>
		</td>
	</tr>
	</table>
	<input type="button" value="수정" id="edit">
	<input type="button" value="삭제" id="delete">
	<input type="button" value="목록" onclick="location.href='/jdbcBoard/list'">
</div>
<div id="editForm" hidden>
<h3>게시글 수정</h3>
	<form action="/jdbcBoard/update" method="post">
			<input type="hidden" name="boardNo" value="${vo.boardNo}">
		<p>	
			<label>제목</label>
			<input type="text" name="boardTitle" value="${vo.boardTitle}" placeholder="제목" required="required">
		</p>
		<p>
			<label>작성자</label>
			<input type="text" name="boardWriter" value="${vo.boardWriter}" placeholder="작성자" required="required">
		</p>
		<p>
			<textarea rows="3" cols="50" name="boardContent" placeholder="내용">${vo.boardContent}</textarea>
		</p>
		<p>
			<input type="submit" value="완료">
			<input type="button" value="취소" onclick="location.href='/jdbcBoard/detail?boardNo=${vo.boardNo}'">
		</p>
	</form>
</div>
</body>
</html>