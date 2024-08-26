<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-12 card">
	<div class="card-header">
		<div class="row" style="justify-content: space-between;">
			<h3>사원 목록</h3>
			<button type="button" class="btn btn-success" onclick="javascript:location.href='/emp/regist'">사원 등록</button>
		</div>
	</div>
	<div class="card-body row" style="justify-content: space-between;">
<table class="table table-hover text-nowrap">
	<thead>
		<tr>
			<th>사원명</th>
			<th>주소</th>
			<th>우편번호</th>
			<th>상세주소</th>
			<th>연락처</th>
			<th>급여</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list.content}">
		<tr style="cursor: pointer;" onclick="javascript:location.href='/emp/detail?empNum=${vo.empNum}'">
			<td>${vo.nm}</td>
			<td>${vo.addr}</td>
			<td>${vo.pnum}</td>
			<td>${vo.detAddr}</td>
			<td>${vo.pne}</td>
			<td>${vo.sal}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<div class="card-footer clearfix" style="width: 100%">
	${list.pagingArea}
</div>
</div>
</div>