<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-12 card">
	<div class="card-header">
		<div class="row" style="justify-content: space-between;">
			<h3>자동차 목록</h3>
			<button type="button" class="btn btn-success" onclick="javascript:location.href='/car/regist'">자동차 등록</button>
		</div>
	</div>
	<div class="card-body row" style="justify-content: space-between;">
<table class="table table-hover text-nowrap">
	<thead>
		<tr>
			<th>고객 번호</th>
			<th>자동차 번호</th>
			<th>제조사</th>
			<th>연식</th>
			<th>주행거리</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list.content}">
		<tr style="cursor: pointer;" onclick="javascript:location.href='/car/detail?carNum=${vo.carNum}'">
			<td>${vo.custNum}</td>
			<td>${vo.carNum}</td>
			<td>${vo.mfr}</td>
			<td>${vo.myr}</td>
			<td>${vo.drvDst}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<div class="card-footer clearfix" style="width: 100%">
	${list.pagingArea}
</div>
</div>
</div>