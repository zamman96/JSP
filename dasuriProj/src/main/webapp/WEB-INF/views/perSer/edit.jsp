<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen"/>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<div class="card card-warning">
	<div class="card-header">
		<h2>수리 서비스 수정</h2>
	</div>

	<form action="/emp/editPost" method="post">
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<!-- text input -->
					<input hidden id="empNum" name="empNum" value="${vo.empNum}">
					<div class="form-group">
						<label for="prodId">수리 서비스명</label> <input required type="text"
							class="form-control" placeholder="수리 서비스명"
							name="nm" id="nm" value="${vo.nm}">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="prodLgu">연락처</label>
						<input required="required" type="text" value="${vo.pne}" class="form-control" placeholder="연락처" name="pne" id="pne">
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="prodLgu">급여</label>
						<input required="required" type="number" value="${vo.sal}" class="form-control" placeholder="급여" name="sal" id="pne">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="prodLgu">우편번호</label>
						<input required="required" type="text" class="form-control" value="${vo.pnum}" placeholder="우편" name="pnum" id="pnum">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="prodLgu">주소</label>
						<input required="required" type="text" class="form-control" value="${vo.addr}" placeholder="주소" name="addr" id="addr">
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="prodLgu">상세 주소</label>
						<input required="required" type="text" class="form-control" value="${vo.detAddr}" placeholder="상세 주소" name="detAddr" id="detAddr">
					</div>
				</div>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer row" style="justify-content: space-between;">
			<sec:csrfInput/>
			<div>
				<a href="/emp/detail?empNum=${vo.empNum}" class="btn btn-info">취소</a>
			</div>
			<div>
				<button type="submit" class="btn btn-warning">등록</button>
			</div>
		</div>
	</form>
</div>