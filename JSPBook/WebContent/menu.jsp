<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	// 스트립틀릿
	// 시큐리티의 로그인 한 사용자명을 가져옴
	String username = request.getRemoteUser();

	//out.print("<p>username : "+username + "</p>");
%>	
<c:set var="username" value="<%=username %>"/>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header" style="width:100%; justify-content:space-between; display:flex;">
				<div>
					<a class="navbar-brand" href="/welcome.jsp">Home</a>
				</div>
				<div>
					<span class="navber-brand">
						<!-- 로그인 했음 -->
						<c:if test="${fn:length(username)>0}">
							<span style="color:white">${username}님 환영합니다.</span>
							<a href="/logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
						</c:if>
						<!-- 로그인 안함 -->
						<c:if test="${fn:length(username)==0}">
							<a href="/addProduct.jsp" class="btn btn-sm btn-success pull-right">로그인 해주세요</a>
						</c:if>
					</span>
				</div>
			</div>
			
		</div>
	</nav>