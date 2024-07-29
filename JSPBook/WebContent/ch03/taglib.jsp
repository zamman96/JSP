<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	taglib 디렉티브 : EL(Expression Language-표현 언어), 
				   JSTL(JSP Standard Tag Library) 설정 태그
	uri : 태그 설정 정보를 가진 경로 주소
	prefix : 식별 명
 -->
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%
	// java 세계의 변수
	String title = "JSTL Core 태그 라이브러리";
	String[] fruitArr = {"apple", "watermelon", "melon", "strawberry", "grape"};
	List<String> likeList = new ArrayList<>();
	likeList.add("초콜릿");
	likeList.add("사탕");
	likeList.add("젤리");
	likeList.add("과자");
	likeList.add("껌");
	
	List<Map<String, Object>> mapList = new ArrayList<>();
	Map<String, Object> map = new HashMap<>();
	map.put("name", "아잠만");
	map.put("age",5);
	map.put("animal","오리");
	mapList.add(map);
	Map<String, Object> map2 = new HashMap<>();
	map2.put("name", "뽀야미");
	map2.put("age",15);
	map2.put("animal","햄스터");
	mapList.add(map2);
	Map<String, Object> map3 = new HashMap<>();
	map3.put("name", "쭈니");
	map3.put("age",20);
	map3.put("animal","다람쥐");
	mapList.add(map3);
%>
<!-- JSTL -->
<!-- title이 subject라는 이름의 jsp의 변수가 된다 -->
<c:set var="subject" value="<%=title %>" />
<c:set var="arr" value="<%=fruitArr %>" />
<c:set var="list" value="<%=likeList %>" />
<c:set var="mapList" value="<%=mapList %>" />

<!-- java --> 
<h3><%=title %></h3>
<!-- EL -->
<h3>${subject}</h3>
<hr />

<!-- fruitArr 출력 -->
<c:forEach var="str" items="${arr}" varStatus="stat">
	<h5>${str}</h5>
</c:forEach>
<hr />

<!-- likeList 출력 -->
<c:forEach var="like" items="${list}" varStatus="stat2">
	<h5>${like}</h5>
</c:forEach>
<hr />

<!-- mapList 출력 -->
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>종류</th>
	</tr>
<c:forEach var="map" items="${mapList}" varStatus="stat3">
	<tr>
		<td>${stat3.count}</td>
		<td>${map.name}</td>
		<td>${map.age}</td>
		<td>${map.animal}</td>
	<!-- 
		mapList : List<Map>
		하나 꺼내면 : map
		
		stat3.index : 0부터 시작
		stat3.count : 1부터 시작
	 -->
	</tr>
</c:forEach>
</table>
<hr />

<!-- 구구단 -->
<%for(int k=1; k<=9; k++){} %>
<c:forEach var="k" begin="1" end="9" step="1">
	<c:set var="o" value="${10-k}"/>	<!-- 자바변수 뿐만이 아니라 JSP변수 재정의도 가능하다 -->
	<h2>${o}단</h2>
	<c:forEach var="n" begin="1" end="9" step="1">
	<h4>${o} X ${n} = ${o*n}</h4>
	</c:forEach>
</c:forEach>
</body>
</html>