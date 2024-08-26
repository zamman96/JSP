<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script>
function openHomeSearch(){
	new daum.Postcode({
	    oncomplete: function(data) {
	    	// json 형태로 데이터가 전달
	    	console.log(data);
	    	$('#pnum').val(data.zonecode);
	    	$('#addr').val(data.address);
	    	$('#detAddr').val(data.buildingName);
	    	$('#detAddr').focus();
	    }
	}).open();
}
</script>
<div class="card card-success">
	<div class="card-header">
		<h2>사원 등록</h2>
	</div>

	<form action="/emp/registPost" method="post">
		<div class="card-body">
			<div class="row">
				<div class="col-sm-6">
					<!-- text input -->
					<div class="form-group">
						<label for="nm">사원명</label> <input required type="text"
							class="form-control" placeholder="사원명"
							name="nm" id="nm">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="pne">연락처</label>
						<input required="required" type="text" class="form-control" placeholder="연락처" name="pne" id="pne">
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="sal">급여</label>
						<input required="required" type="number" class="form-control" placeholder="급여" name="sal" id="sal">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group" onclick="openHomeSearch()">
						<label for="pnum">우편번호</label>
						<input required="required" type="text" class="form-control" placeholder="우편" name="pnum" id="pnum">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="addr">주소</label>
						<input required="required" type="text" class="form-control" placeholder="주소" name="addr" id="addr">
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group">
						<label for="detAddr">상세 주소</label>
						<input required="required" type="text" class="form-control" placeholder="상세 주소" name="detAddr" id="detAddr">
					</div>
				</div>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer row" style="justify-content: space-between;">
			<sec:csrfInput/>
			<div style="float: left;">
				<a href="/emp/list" class="btn btn-info">목록</a>
			</div>
			<div style="float: right;">
				<button type="submit" class="btn btn-warning">등록</button>
			</div>
		</div>
	</form>
</div>
