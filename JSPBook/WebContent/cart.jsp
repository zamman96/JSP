<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="kr.or.ddit.vo.ProductVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script>
window.onload = function(){
	const qu = document.querySelectorAll('.num');
	qu.forEach(function(qq){
		qq.addEventListener("change", function(e) {
			let price = e.target.getAttribute("idx");
			let q = e.target.value;
			let sumt = e.target.parentNode.nextSibling.nextSibling;
			var sum = price*q;
			sum = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			sumt.innerText = sum;
			
			let sumsum = document.querySelector('#sumsum');
			let sums = 0;
			qu.forEach(function(a){
				let pp = a.getAttribute("idx");
				let qq = a.value;
				sums+= pp*qq;
			})
			sums = sums.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			sumsum.innerText=sums;
			
			let productId = e.target.getAttribute("pId"); // 상품 ID 추가
			let data = {"productId" : productId, "quantity" : q}
			// 서버로 변경된 수량과 상품 ID 전송
			fetch('/updateCartQuantity.jsp', {
			    method: 'POST',
			    headers: {
			        'Content-Type': 'application/json',
			    },
			    body: JSON.stringify(data),
			});		})
	})
}
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="menu.jsp" %>
	<%
		// 세션의 고유 아이디(장바구니 번호). 하나의 웹브라우저
		String cartId = session.getId();
	
		// 장바구니 세션 가져오기
		List<ProductVO> list = (List<ProductVO>)session.getAttribute("cartlist");
	%>
	<c:set var="cartId" value="<%=cartId %>"/>
	<c:set var="list" value="<%=list %>"/>
	<!-- 표현문 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
         		<tr>
         		<c:if test="${fn:length(list)!=0}">
	            	<td align="left">
	               	<!-- cart=장바구니=session=웹브라우저=sessionId -->
	               		<a href="deleteCart.jsp?cartId=${cartId}" class="btn btn-danger">삭제하기</a>
	            	</td>
	            	<td align="right">
	               		<a href="shippingInfo.jsp?cartId=${cartId}" class="btn btn-success">주문하기</a>
	            	</td>
            	</c:if>
         		<c:if test="${fn:length(list)==0}">
	            	<td align="left">
	               	<!-- cart=장바구니=session=웹브라우저=sessionId -->
	               		<a href="#" class="btn btn-secondary" onclick="javascript:alert('카트에 상품이 없습니다')">삭제하기</a>
	            	</td>
	            	<td align="right">
	               		<a href="#" class="btn btn-secondary" onclick="javascript:alert('카트에 상품이 없습니다')">주문하기</a>
	            	</td>
            	</c:if>
         </tr>
      </table>
		</div>
	<!-- 장바구니 출력 시작 -->
		<div style="padding-top:50px;">
			<p></p>
			<table class="table table-hover">
				<tr style="text-align:center;">
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>금액</th>
					<th>비고</th>
				</tr>
				<!-- 장바구니가 비어있다면 -->
				<c:if test="${fn:length(list)==0}">
					<tr>
						<td colspan="6" style="text-align:center;">
							장바구니에 상품이 없습니다.
						</td>
					</tr>
				</c:if>
				<!-- 장바구니가 있다면 -->
				<!-- 
         forEach 태그? 배열(String[], int[][]), Collection(List, Set) 또는 
         Map(HashTable, HashMap, SortedMap)에 저장되어 있는 값들을 
         	순차적으로 처리할 때 사용함. 자바의 for, do~while을 대신해서 사용함
         var : 변수
         items : 아이템(배열, Collection, Map)
         varStatus : 루프 정보를 담은 객체 활용
            - index : 루프 실행 시 현재 인덱스(0부터 시작)
            - count : 실행 회수(1부터 시작. 보통 행번호 출력)
          -->
          <!-- list : List<ProductVO> -->
				<c:forEach var="vo" items="${list}">
					<c:set var="amt" value="${amt + vo.unitPrice * vo.quantity}"/>
					<tr>
						<td style="vertical-align: middle; display:flex; align-item:center;">
							<span><img src="/images/${vo.filename}" style='width:100px; margin-right:60px;' /></span>
							<span><span class="badge badge-danger">${vo.condition}</span> ${vo.productId}<br>${vo.pname}</span></td>
						<td style="vertical-align: middle; text-align:center;"><fmt:formatNumber value="${vo.unitPrice}" type="number" pattern="#,###" /></td>
						<td style="vertical-align: middle; text-align:center;"><input class="num" idx="${vo.unitPrice}" pId="${vo.productId}" type="number" value="${vo.quantity}" min="1" style="width:50px"></td>
						<td style="vertical-align: middle; text-align:center;"><fmt:formatNumber value="${vo.unitPrice * vo.quantity}" type="number" pattern="#,###" /></td>
						<td style="vertical-align: middle; text-align:center;">
						<a href="/removeCart.jsp?pId=${vo.productId}" class="badge badge-danger">삭제</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<th></th>
					<th></th>
					<th>총 액</th>
					<th id="sumsum"><fmt:formatNumber value="${amt}" type="number" pattern="#,###" /></th>
					<th></th>
				</tr>
			</table>
			<a href="/products.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
		</div>
	<!-- 장바구니 출력 끝 -->
	</div>
	<!-- footer -->
	<%@ include file="footer.jsp" %>
</body>
</html>