<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<div class="col-md-12 card">
	<div class="card-header">
		<h3>월별 매입 현황</h3>
		<div class="row" style="justify-content: space-between;">
			<div class="row" style="width: 50%;">
				<select id="year" name="year"
					style="width: 100px; margin-right: 20px;" class="form-control">
					<c:forEach var="yr" begin="2020" end="2024">
						<option value="${yr}">${yr}</option>
					</c:forEach>
				</select> <select name="month" id="month" class="form-control"
					style="width: 80px;">
					<c:forEach var="mn" begin="1" end="12">
						<option value="${mn}">${mn}월</option>
					</c:forEach>
				</select>
			</div>
			<form>
				<div class="card-tools">
					<div class="input-group input-group-sm" style="width: 150px;">
						<input type="text" name="amt" class="form-control float-right"
							placeholder="검색할 매입금액의 합계"
							value="<c:if test="${param.amt!=null}">${param.amt}</c:if>">
						<div class="input-group-append">
							<button type="submit" class="btn btn-default">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="card-body">
		<!-- items : 배열, Collection(list, Set), Map(hashTable, hashMap, sortedMap) -->
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>순번</th>
					<th>매입 날짜</th>
					<!-- 				<th>매입 번호</th> -->
					<th>상품명</th>
					<th>재고 수량</th>
					<th>가격</th>
					<th>총합</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${data.content}">
					<tr class="click" data-toggle="modal" data-target="#modalProd"
						style="cursor: pointer;"
						data-buy-prod="${data.buyProd}"
						data-buy-date="<fmt:formatDate value='${data.buyDate}' pattern='yyyy-MM-dd'/>">
						<td>${data.rnum}</td>
						<td><fmt:formatDate value="${data.buyDate}"
								pattern="yyyy-MM-dd" /></td>
						<%-- 					<td>${data.buyProd}</td> --%>
						<td>${data.prodName}</td>
						<td><fmt:formatNumber value="${data.buyQty}" type="number"
								pattern="#,###" /></td>
						<td><fmt:formatNumber value="${data.buyCost}" type="number"
								pattern="#,###" /></td>
						<td><fmt:formatNumber value="${data.buyCost*data.buyQty}"
								type="number" pattern="#,###" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="card-footer clearfix">
			<!-- startPage가 5보다 클 때에만 [이전] 활성화 -->
			${data.pagingArea}
		</div>
	</div>
</div>
<div class="modal fade" id="modalProd">
	<div class="modal-dialog modal-lg">
		<div class="card card-primary">
			<div class="card-header">
				<h3 class="card-title">상세 보기</h3>
			</div>
			<!-- /.card-header -->
			<!-- form start -->
			<form>
				<div class="card-body">
					<div class="form-group">
						<label for="exampleInputEmail1">입고 일자</label> <input name="buyDate" readonly="readonly" type="date" class="form-control" id="mdate">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">상품코드</label> <input name="buyProd" readonly="readonly" type="text" class="form-control" id="mbp">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">상품명</label> <input name="prodName" type="text" class="form-control" id="mname">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">재고</label> <input name="buyQty" type="number" class="form-control" id="mqty">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">가격</label> <input name="buyCost" type="number" class="form-control" id="mcost">
					</div>
				</div>
				<!-- /.card-body -->

				<div class="card-footer">
				<div class="row"  style="justify-content: space-between;">
					<button type="button" id="del" class="btn btn-danger">삭제</button>
					<button type="submit" id="edit" class="btn btn-primary">변경</button>
				</div>
				</div>
			</form>
		</div>
		<!-- /.card -->
	</div>
	<!-- /.card-body -->
</div>
<!-- /.card -->
<script>
let yeari = document.querySelector('#year');
let monthi = document.querySelector('#month');
const url = window.location.href;
getYearAndMonth(url);
yeari.addEventListener("change", (event) => {
	let year = yeari.value;
	let month = monthi.value;
	location.href = "/buyprod/detail/"+year+"/"+month;
})
monthi.addEventListener("change", (event) => {
	let year = yeari.value;
	let month = monthi.value;
	location.href = "/buyprod/detail/"+year+"/"+month;
})
function getYearAndMonth(url) {
    const urlObj = new URL(url);
    const parts = urlObj.pathname.split('/').filter(part => part !== '');
    let yearu = parts[2]
    if(parts[2]==0){
    	yearu = 2020
    } 
    document.querySelector('#year').value = yearu;
   	document.querySelector('#month').value = parts[3];
};

$(function(){
	$('.click').on('click', function(){
		// data-buy-date, data-buy-prod
		let keyd = $(this).data("buyDate");
		let keyb = $(this).data("buyProd");
		const obj = {"buyProd" : keyb, "buyDate" : keyd};
		console.log(obj);
		$.ajax({
			url : "/buyprod/detailAjax",
			type : "POST",
			data: JSON.stringify(obj),
			dataType : "json",
	        contentType : 'application/json; charset=utf-8',
			success : function(res){
				console.table(res);
				$('#mdate').val(res.buyDateStr);
				$('#mbp').val(res.buyProd);
				$('#mname').val(res.prodName);
				$('#mqty').val(res.buyQty);
				$('#mcost').val(res.buyCost);
				$('#mamt').val(res.buyQty * res.buyCost);
			}
		});
	});
	
	$('#del').on('click',function(){
		location.href = "/buyprod/delete";
	});
	
	$('#edit').on('click', function(){
		location.href = "/buyprod/update";
	});
})
</script>