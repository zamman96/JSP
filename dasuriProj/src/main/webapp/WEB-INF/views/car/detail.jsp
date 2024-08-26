<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen"/>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<div class="card card-info">
	<div class="card-header">
		<h2>자동차 상세</h2>
	</div>

	<form action="/car/deletePost" method="post">
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<!-- text input -->
					<div class="form-group">
						<label for="carNum">자동차번호</label> <input required type="text"
							class="form-control" placeholder="자동차명" readonly
							name="carNum" id="carNum" value="${vo.nm}">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="custNum">고객 번호</label>
						<input required="required"  readonly type="text" value="${vo.custNum}" class="form-control" placeholder="고객번호" name="custNum" id="custNum">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="mfr">제조사</label>
						<input required="required"  readonly type="text" value="${vo.mfr}" class="form-control" placeholder="제조사" name="mfr" id="mfr">
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="myr">연식</label>
						<input required="required"  readonly type="text" value="${vo.myr}" class="form-control" placeholder="연식" name="myr" id="myr">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="drvDst">주행거리</label>
						<input required="required" readonly type="text" class="form-control" value="${vo.drvDst}" placeholder="주행거리" name="drvDst" id="drvDst">
					</div>
				</div>
			</div>
		<div class="col-sm-12">
			<div class="form-group">
			<label for="prodLgu">수리 내역</label>
				<table class="table table-bordered">
				<thead>
					<tr>
						<th>수리 시간</th>
						<th>수리비</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="perser" items="${vo.perSerVOList}">
						<tr>
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
				<a href="/car/list" class="btn btn-info">목록</a>
			</div>
			<div>
				<a href="/car/edit?carNum=${vo.carNum}" class="btn btn-warning">수정</a>
			</div>
			<div>
				<button type="submit" class="btn btn-danger">삭제</button>
			</div>
		</div>
	</form>
</div>