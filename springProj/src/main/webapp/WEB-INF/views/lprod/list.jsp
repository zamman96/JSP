<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<h1>상품 목록</h1>
<a href="/lprod/create">상품 등록</a>
<form action="/lprod/list">
	<select name="gubun">
		<option value="" selected>선택</option>
		<option value="lprodGu"
		<c:if test="${param.gubun=='lprodGu'}">selected</c:if>
		>상품분류번호</option>
		<option value="lprodNm"
		<c:if test="${param.gubun=='lprodNm'}">selected</c:if>
		>상품분류명</option>
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">
</form>
	<table border="1">
	<tr>
		<th>순번</th>
		<th>상품코드</th>
		<th>상품분류명</th>
		<th>상품분류별 갯수</th>
	</tr>
	<c:if test="${fn:length(data.content)==0}">
	<tr>
		<td colspan="4">해당하는 조건의 상품이 없습니다</td>
	</tr>
	</c:if>
	<c:forEach items="${data.content}" var="vo">
	<tr>
		<td>${vo.rnum}</td>
		<td><a href="/lprod/detail?lprodId=${vo.lprodId}">${vo.lprodGu}</a></td>
		<td>${vo.lprodNm}</td>
		<td>${vo.cnt}</td>
	</tr>
	</c:forEach>
	</table>
	${data.pagingArea}
</body>
</html>