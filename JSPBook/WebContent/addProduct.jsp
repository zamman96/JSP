<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="kr.or.ddit.vo.ProductVO"%>
<%@ page import="java.util.List"%>
<%@ page import="kr.or.ddit.dao.ProductRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script src="/js/jquery.min.js"></script>
<script src="/js/validation2.js"></script>
<title>상품 목록</title>
<script>
$(function(){
	$('input:file').on('input',handleImg);
})


// e 이벤트 객체
function handleImg(e){
	let files = e.target.files; // 파일에 접근
	let fileArr = Array.prototype.slice.call(files); // 붙어있는 파일을 배열로 정렬
	$.each(fileArr, function(){
		// 이미지 여부 체크
		if(!this.type.match("image.*")){
			console.log("이미지가 아닙니다")
			return;
		}
		
		// 이미지 
		let reader = new FileReader();
		
		// e : reader가 이미지 객체를 읽는 이벤트
		reader.onload = function(e){
			let img_html = "<img src='"+e.target.result+"' style='width:200px;' />";
			// 요소.append : 누적, 요소.html : 새로고침,
			// 요소.innerHTML : JavaScript에서 새로고침
			$('#pImg').html(img_html);
		}
		reader.readAsDataURL(this);
	});
}
</script>
</head>
<body>
	<fmt:setLocale value="ko"/> <!-- 영어 en -->
	<fmt:bundle basename="bundle.message">
	<!-- 
		value="en" ==> bundle.message_en.propertes를 사용
		value="ko" ==> bundle.message_ko.propertes를 사용
					   bundle.message.propertes
					  	우리의 지역 locale은 ko
	 -->
	<!-- header -->
	<!-- 
	디렉티브 태그 	속성 	    속성의 값		 -->
	<%@ include file="menu.jsp"%>
	<!-- 상품 목록 시작 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title" /></h1>
		</div>
	</div>
	<div class="container">
	<form action="processAddProduct.jsp" method="post" enctype="multipart/form-data" class="form-horizontal" name="newProduct">
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="productId" /></label>
			<div class="col-sm-3">
				<input type="text" name="productId" placeholder="P1234">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="pname" /></label>
			<div class="col-sm-3">
				<input type="text" name="pname" placeholder="4~15글자">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
			<div class="col-sm-3">
				<input type="text" name="unitPrice">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="description" /></label>
			<div class="col-sm-5">
				<textarea rows="2" cols="23" name="description">
						
				</textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="manufacturer" /></label>
			<div class="col-sm-3">
				<input type="text" name="manufacturer">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="category" /></label>
			<div class="col-sm-3">
				<input type="text" name="category">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
			<div class="col-sm-3">
				<input type="text" name="unitsInStock">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="condition" /></label>
			<div class="col-sm-5">
				<input type="radio" id="new" name="condition" value="New">
				<label for="new"><fmt:message key="condition_New" /></label>
				<input type="radio" id="old" name="condition" value="Old">
				<label for="old"><fmt:message key="condition_Old" /></label>
				<input type="radio" id="Refurbished" name="condition" value="Refurbished">
				<label for="Refurbished"><fmt:message key="condition_Refurbished" /></label>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="productImage" /></label>
			<div class="col-sm-3">
				<input type="file" name="filename">
				<span id="pImg"></span>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input class="btn btn-primary" type="button" onclick="CheckAddProduct()" value="<fmt:message key="button" />" />
			</div>
		</div>
		<hr />
	</form>
	</div>
	<!-- 상품 목록 끝 -->

	<!-- footer -->
	<%@ include file="footer.jsp"%>
	</fmt:bundle>
</body>
</html>