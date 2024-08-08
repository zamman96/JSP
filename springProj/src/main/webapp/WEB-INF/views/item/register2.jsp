<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<h2>파일업로드</h2>
<!-- spring form 태그 생성 -->
<!-- 필수! modelAttribute = "폼객체의 속성명(VO)" (mybatis) -->

<c:set value="${memberVO.fgvo}" var="fileGroupVO"/>
<form:form action="/item/registerPost2" method="post" enctype="multipart/form-data"
			modelAttribute="memberVO"> <!-- 폼 객체의 속성명을 addAttribute 속성에 지정 (같은 이름으로) -->
						<!-- MemberVO의 객체의 memName과 연동 -->
						
	<!-- path = memberVo의 프로퍼티명
		폼 항목에 바인딩(메모리에 데이터가 올라감)되는 폼 객체의 프로퍼티를 지정함
		disabled : 폼 항목을 비활성화 할 때 사용. 기본값 false
		readonly : 폼 항목을 읽기 전용으로 만들 때 사용. 기본값 false -->
	<p>아이디: <form:input path="memId" disabled="false"/>
	<p>이름 : <form:input path="memName" readonly="true"/></p>
	<!-- submit으로 정보를 전달 할 시 form태그를 사용하지 않아도 정보가 전달됨 -->
	<!-- form 태그를 사용하지않고 el태그를 통해 값을 받음 -->
	<p>주민번호1 : <input type="text" name="memRegno1" value="${memberVO.memRegno1}"> </p>
<c:forEach var="fileDetailVO" items="${fileGroupVO.fileDetailVoList}">
	<img src="${fileDetailVO.fileSaveLocate}">
</c:forEach>

	<input type="file" name="fileImage" />
	<button type="submit">파일업로드</button>
</form:form>