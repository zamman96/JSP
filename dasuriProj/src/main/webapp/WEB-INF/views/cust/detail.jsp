<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen"/>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<div class="card card-info">
	<div class="card-header">
		<h2>고객 상세</h2>
	</div>

	<form action="/cust/deletePost" method="post">
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<!-- text input -->
					<input hidden id="custNum" name="custNum" value="${vo.custNum}">
					<div class="form-group">
						<label for="custNm">고객명</label> <input readonly required type="text"
							class="form-control" placeholder="고객명"
							name="custNm" id="custNm" value="${vo.custNm}">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="pne">연락처</label>
						<input readonly required="required" type="text" value="${vo.pne}" class="form-control" placeholder="연락처" name="pne" id="pne">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="pnum">우편번호</label>
						<input readonly required="required" type="text" class="form-control" value="${vo.pnum}" placeholder="우편" name="pnum" id="pnum">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="addr">주소</label>
						<input readonly required="required" type="text" class="form-control" value="${vo.addr}" placeholder="주소" name="addr" id="addr">
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="detAddr">상세 주소</label>
						<input readonly required="required" type="text" class="form-control" value="${vo.detAddr}" placeholder="상세 주소" name="detAddr" id="detAddr">
					</div>
				</div>
			</div>
			
			<div class="col-sm-12">
				<div class="form-group">
				<label for="prodLgu">자동차 목록</label>
					<table class="table table-bordered">
					<thead>
						<tr>
							<th>자동차 번호</th>
							<th>제조사</th>
							<th>연식</th>
							<th>주행거리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="car" items="${vo.carVOList}">
							<tr>
								<td>${perser.carNum}</td>
								<td>${perser.mfr}</td>
								<td>${perser.myr}</td>
								<td>${perser.drvDst}</td>
							</tr>			
						</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
				<label for="prodLgu">수리 내역</label>
					<table class="table table-bordered">
					<thead>
						<tr>
							<th>자동차 번호</th>
							<th>수리 시간</th>
							<th>수리비</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="perser" items="${vo.perSerVOList}">
							<tr>
								<td>${perser.carNum}</td>
								<td>${perser.perTme}</td>
								<td>${perser.amt}</td>
							</tr>			
						</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer row" style="justify-content: space-between;">
			<sec:csrfInput/>
			<div>
				<a href="/cust/list" class="btn btn-info">목록</a>
			</div>
			<div>
				<a href="/cust/edit?custNum=${vo.custNum}" class="btn btn-warning">수정</a>
			</div>
			<div>
				<button type="submit" class="btn btn-danger">삭제</button>
			</div>
		</div>
	</form>
</div>