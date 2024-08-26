<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-12 card">
	<div class="card-header">
		<div class="row" style="justify-content: space-between;">
			<h3>고객 목록</h3>
			<button type="button" class="btn btn-success" onclick="javascript:location.href='/cust/regist'">고객 등록</button>
		</div>
	</div>
	<div class="card-body row" style="justify-content: space-between;">
<table class="table table-hover text-nowrap">
	<thead>
		<tr>
			<th>고객명</th>
			<th>주소</th>
			<th>우편번호</th>
			<th>상세주소</th>
			<th>연락처</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list.content}">
		<tr style="cursor: pointer;" onclick="javascript:location.href='/cust/detail?custNum=${vo.custNum}'">
			<td>${vo.custNm}</td>
			<td>${vo.addr}</td>
			<td>${vo.pnum}</td>
			<td>${vo.detAddr}</td>
			<td>${vo.pne}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<div class="card-footer clearfix" style="width: 100%">
	${list.pagingArea}
</div>
</div>
</div>