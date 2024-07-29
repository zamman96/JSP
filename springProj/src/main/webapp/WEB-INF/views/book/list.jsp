<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>도서목록</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script type="text/javascript">
$(function(){
	$("#selCategory").on("change",function(){
		$("#searchForm").submit();
	})
	
	$("input[type='reset']").on("click",function(){
		window.location.href ="/list";
	})
})
</script>
</head>
<body>
<h1>책 목록</h1>

<div>
	<!-- 
	요청URI : /list?category=드라마
         요청파라미터 : category=드라마
         요청방식 : get
    
    URI 파라미터
    param : category=드라마
    param.category : 드라마
	-->
	<!-- <form id="searchForm" action="/list" method="get"> -->
	<form id="searchForm">
		<label for="selCategory">카테고리</label>
		<select id="selCategory" name="category">
			<option disabled="disabled" selected="selected">선택해주세요</option>
			<c:forEach var="category" items="${categories}">
				<option value="${category.CATEGORY}"
					<c:if test="${param.category==category.CATEGORY}">selected</c:if>
				>${category.CATEGORY}</option>
			</c:forEach>
		</select>
		<br/><br/>
		<label for="selGubun">제목/가격</label>
		<select id="selGubun" name="gubun">
			<option disabled="disabled" selected="selected">선택해주세요</option>
			<option value="title"
				<c:if test="${param.gubun=='title'}">selected</c:if> <%--GET방식으로 페이지가 이동되기 때문에 이동될때 저장될 목적--%>
			>제목</option>
			<option value="price"
				<c:if test="${param.gubun=='price'}">selected</c:if>
			>가격</option>
		</select>
		<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요" value="${param.keyword}"/>
		<br/><br/>
		<input type="submit" value="검색">
		<input type="reset" value="초기화">
	</form>
</div>
<br>
<!-- 
	forEach 태그? 배열(String[], int[][]), Collection(List, Set) 또는 
	Map(HashTable, HashMap, SortedMap)에 저장되어 있는 값들을 
	순차적으로 처리할 때 사용함. 자바의 for, do~while을 대신해서 사용함
	var : 변수
	items : 아이템(배열, Collection, Map)
	varStatus : 루프 정보를 담은 객체 활용
   - index : 루프 실행 시 현재 인덱스(0부터 시작)
   - count : 실행 회수(1부터 시작. 보통 행번호 출력)
-->
<table border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>가격</th>
		</tr>	
	</thead>
	<tbody>
		<c:forEach var="bookVO" items="${BookVOList}" varStatus="stat">
		<tr>
			<td>${bookVO.rnum}</td>
			<td><a href="/detail?bookId=${bookVO.bookId}">${bookVO.title}</a></td>
			<td>${bookVO.category}</td>
			<td>${bookVO.price}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
	${data.pagingArea}
</body>
</html>