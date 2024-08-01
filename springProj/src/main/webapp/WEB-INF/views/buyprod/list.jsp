<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-md-12 card">
	<div class="card-header">
		<h3>월별 매입 현황</h3>
		<form class="row" style="justify-content: space-between;">
			<select id="year" name="year" style="width: 100px"
				class="form-control">
				<c:forEach var="yr" begin="2020" end="2024">
					<option value="${yr}"
						<c:if test="${param.year==yr or (param.year=='' and yr==2020)}">selected</c:if>>${yr}</option>
				</c:forEach>
			</select>
			<div class="card-tools">
				<div class="input-group input-group-sm" style="width: 150px;">
					<input type="text" name="amt" class="form-control float-right"
						placeholder="검색할 매입금액의 합계"
						value="<c:if test="${param.amt!=null}">${param.amt}</c:if>">
					<div class="input-group-append">
						<button type="submit" class="btn btn-default">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<div class="card-body">
	<!-- items : 배열, Collection(list, Set), Map(hashTable, hashMap, sortedMap) -->
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th style="width: 10%">월</th>
				<th style="width: 45%">매입 재고 수량</th>
				<th style="width: 45%">매입 금액 합계</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="data" items="${data.content}">
				<tr onclick="javascript:location.href='/buyprod/detail/${data.year}/${data.buyDateMonth}'">
<%-- 				<tr onclick="javascript:location.href='/buyprod/detail?year=${data.year}&month=${data.buyDateMonth}'"> --%>
					<td>${data.buyDateMonth}월</td>
					<td><fmt:formatNumber value="${data.buyQty}" type="number"
							pattern="#,###" /> 개</td>
					<td><fmt:formatNumber value="${data.amt}" type="number"
							pattern="#,###" /> 원</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="card-footer clearfix">
		<!-- startPage가 5보다 클 때에만 [이전] 활성화 -->
		${data.pagingArea}
	</div>
</div>
</div>
