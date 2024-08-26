<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-12 card">
	<div class="card-header">
		<div class="row" style="justify-content: space-between;">
			<h3>수리 서비스 목록</h3>
			<button type="button" class="btn btn-success" onclick="javascript:location.href='/perSer/regist'">수리 서비스 등록</button>
		</div>
	</div>
	<div class="card-body row" style="justify-content: space-between;">
<table class="table table-hover text-nowrap">
	<thead>
		<tr>
			<th>수리번호</th>
			<th>사원번호</th>
			<th>고객번호</th>
			<th>차번호</th>
			<th>수리비</th>
			<th>수리시간</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${list.content}">
		<tr style="cursor: pointer;" onclick="javascript:location.href='/perSer/detail?serNum=${vo.serNum}'">
			<td>${vo.serNum}</td>
			<td>${vo.empNum}</td>
			<td>${vo.custNum}</td>
			<td>${vo.carNum}</td>
			<td>${vo.amt}</td>
			<td>${vo.perTme}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<div class="card-footer clearfix" style="width: 100%">
	${list.pagingArea}
</div>
</div>
</div>