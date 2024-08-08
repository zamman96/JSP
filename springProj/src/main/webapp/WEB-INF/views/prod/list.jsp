<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<div class="row">
<div class="col-md-6 card" style="width: 45%">
	<div class="card-header row" style="justify-content: space-between;">
		<div>
			<h3>상품 목록</h3>
		</div>
		<button type="button" class="btn btn-success" onclick="javascript:location.href='/prod/regist'">상품 등록</button>
	</div>
	<div class="card-body row" style="justify-content: space-between;">
				<table class="table table-bordered">
			<thead>
				<tr>
					<th>순번</th>
					<th>상품명</th>
					<th>판매가</th>
					<th>거래처</th>
				</tr>
			</thead>
			<c:choose>
			    <c:when test="${param.currentPage == null || param.currentPage == '1'}">
			        <c:set var="rowNumber" value="0"/>
			    </c:when>
			    <c:otherwise>
			        <c:set var="rowNumber" value="${(param.currentPage-1) * 10}"/> <!-- 다른 페이지에 대한 로직 -->
			    </c:otherwise>
			</c:choose>			
			<tbody id="prodTable">
				<c:forEach var="buyer" items="${data.content}">
					<c:forEach var="prod" items="${buyer.prodVoList}">
						<tr class="click" data-prod-id="${prod.prodId}">
							<td>${rowNumber + 1}</td>
							<td><a href="/prod/detail?prodId=${prod.prodId}">${prod.prodName}</a></td>
							<td><fmt:formatNumber value="${prod.prodSale}" pattern="#,###" type="number"/></td>
							<td>${buyer.buyerName}</td>
						</tr>
						 <c:set var="rowNumber" value="${rowNumber + 1}"/>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
		<div class="card-footer clearfix" style="width: 100%">${data.pagingArea}</div>
	</div>
</div>

<div class="col-md-6 card" style="width: 45%">
	<div class="card-header">
		<h3>상품 별 장바구니 목록 현황</h3>
	</div>
	<div class="card-body">
				<table class="table table-bordered">
			<thead>
				<tr>
					<th>순번</th>
					<th>일자</th>
					<th>수량</th>
					<th>회원 아이디</th>
					<th>회원명</th>
				</tr>
			</thead>
			<tbody id="cartlist">
				<tr>
					<td colspan="5">상품을 선택해주세요</td>
				</tr>
			</tbody>
		</table>
		<div class="right">
			<input type="button" class="btn btn-primary" value="장바구니 관리" id="cart" onclick="javascript:location.href='/prod/cart'">
		</div>
	</div>
</div>
</div>
<div class="modal fade" id="modal-mem">
        <div class="modal-dialog modal-mem">
          <div class="modal-content">
          <!-- Horizontal Form -->
           <form class="form-horizontal">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">회원 정보</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
                <div class="card-body">
                  <div class="form-group row">
                    <label for="memId" class="col-sm-2 col-form-label">아이디</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="memId" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="memName" class="col-sm-2 col-form-label">이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="memName" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                  <label for="exampleInputPassword1" class="col-sm-2 col-form-label">생일</label>
                    <div class="col-sm-10">
    	              <input type="date" class="form-control" id="memBir" name="memBir" readonly />
                    </div>
               </div>
               <div class="form-group row">
                  <label for="exampleInputPassword1" class="col-sm-2 col-form-label">우편</label>
                    <div class="col-sm-10">
	                  <input type="text" class="form-control" id="memZip" name="memZip" readonly />
                    </div>
               </div>
                  
                  <div class="form-group row">
                    <label for="memAdd" class="col-sm-2 col-form-label">주소</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="memAdd" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="memHp" class="col-sm-2 col-form-label">핸드폰</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="memHp" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="memMail" class="col-sm-2 col-form-label">이메일</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="memMail" readonly>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-info">확인</button>
                  <button type="submit" class="btn btn-default float-right">취소</button>
                </div>
                <!-- /.card-footer -->
            </div>
            <!-- /.card -->
              </form>
            </div>
          <!-- /.modal-content -->
          </div>
        <!-- /.modal-dialog -->
        </div>
      <!-- /.modal -->
<script>
$(function(){
	$('.click').on('click',function(){
		$('#prodTable tr').css({"background": "white", "color":"black"});
		$(this).css({"background": "#007bff", "color":"white"});
		let prodId = $(this).data("prodId");
		$.ajax({
			url : "/prod/listAjax",
			data : JSON.stringify({"prodId" : prodId}),
			contentType : 'application/json',
			dataType : "json",
			type : "post",
			success : function(res){
				let str = "";
				if(typeof res[0] == "undefined"){
					str="<tr><td colspan='5'>장바구니 담은 회원이 없습니다<td></tr>";
					$('#cartlist').html(str);
					return false;
				}
				console.log(res[0]);
				let indx = 1;
				$.each(res[0].cartVoList, function(i, vo){
					str += "<tr class='member' data-toggle='modal' data-target='#modal-mem' data-mem-id='"+vo.cartMember+"'> <td>"+ indx++ +"</td>";
					str += "<td>"+ vo.cartNo.substring(0,4)+"-"+vo.cartNo.substring(4,6)+"-"+vo.cartNo.substring(6,8) +"</td>";
					str += "<td>"+ vo.cartQty +"</td>";
					str += "<td>"+ vo.cartMember +"</td>";
					str += "<td>"+ vo.memVo.memName +"</td></tr>";
				})
				$('#cartlist').html(str);
			}
		})
	})
	
	$(document).on('click','.member',function(){
		let memId = $(this).data("memId");
		$.ajax({
			url : "/prod/memInfo",
			data : JSON.stringify({"memId" : memId}),
			contentType : 'application/json',
			dataType : "json",
			type : "post",
			success : function(res){
				console.log(res);
				let str = "";
				$('#memId').val(res.memId);
				$('#memName').val(res.memName);
				$('#memZip').val(res.memZip);
				$('#memBir').val(res.memBirStr);
				$('#memHp').val(res.memHp);
				$('#memAdd').val(res.memAdd1+" "+res.memAdd2);
				$('#memMail').val(res.memMail);
			}
		})
	})
})
</script>