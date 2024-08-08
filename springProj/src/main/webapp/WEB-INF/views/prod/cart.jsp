<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<div class="row">
<div class="col-md-4 card">
	<div class="card-header">
		<h3>상품 목록</h3>
	</div>
	<div class="card-body row" style="justify-content: space-between;">
			 <div class="card-body p-0">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 15%">번호</th>
                      <th>상품명</th>
                      <th>거래처</th>
                      <th style="width: 20%">판매가</th>
                    </tr>
                  </thead>
                  <tbody id="prodList">
                    <tr>
                      <td>1.</td>
                      <td>Update software</td>
                      <td>
                        <div class="progress progress-xs">
                          <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                        </div>
                      </td>
                      <td><span class="badge bg-danger">55%</span></td>
                    </tr>
                  </tbody>
                </table>
                <div class="card-footer clearfix" style="width: 100%" id="prodPage"></div>
              </div>
              <!-- /.card-body -->
	</div>
</div>

<!-- 장바구니 -->
<div class="col-md-3 card card-warning" style="padding:0; margin-left: 10px; margin-right: 10px;">
  <div class="card-header">
    <h3 class="card-title">장바구니</h3>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
    <form>
      <div class="row">
        <div class="col-sm-6">
          <!-- text input -->
          <div class="form-group">
            <label for="prodName">상품명</label>
            <input type="text" class="form-control" id="cartProd" hidden name="cartProd" placeholder="Enter ...">
            <input type="text" class="form-control" id="prodName" name="prodName" placeholder="Enter ...">
          </div>
        </div>
        <div class="col-sm-6">
          <!-- text input -->
          <div class="form-group">
            <label for="cartQty">구매 수량</label>
           <input type="number" class="form-control" id="cartQty" name="cartQty" placeholder="Enter ...">
          </div>
        </div>
        <div class="col-sm-12">
          <!-- text input -->
          <div class="form-group">
            <label for="memName">회원명</label>
            <input type="text" class="form-control" id="memId" hidden name="memId" placeholder="Enter ...">
            <input type="text" class="form-control" id="memName" name="memName" placeholder="Enter ...">
          </div>
         </div>
       </div>
       <input type="submit" value="제출" class="btn btn-warning">
    </form>
  </div>
  <!-- /.card-body -->
</div>
<!-- /.card -->


<div class="col-md-4 card">
	<div class="card-header">
		<h3>회원 목록</h3>
	</div>
	<div class="card-body">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th style="width: 15%">번호</th>
                      <th style="width: 20%">회원명</th>
                      <th>주소</th>
                      <th>연락처</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1.</td>
                      <td>Update software</td>
                      <td>
                        <div class="progress progress-xs">
                          <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                        </div>
                      </td>
                      <td><span class="badge bg-danger">55%</span></td>
                    </tr>
                  </tbody>
                </table>
              <!-- /.card-body -->
	</div>
</div>
</div>
<script>
let prodPage = 1;
let memberPage = 1;

$(function(){
	prodList();
})

function prodList(prodPage){

	$.ajax({
		url : "/prod/prodlist",
		data : { currentPage: prodPage },
		dataType : "json",
		type : "get",
		success : function(res){
			let str = "";
			console.log(res);
			$.each(res.content, function(i, buyer){
				$.each(buyer.prodVoList, function(j, prod){
				str += "<tr> <td>"+ prod.rnum +"</td>";
				str += "<td>"+ prod.prodName +"</td>";
				str += "<td>"+ buyer.buyerName +"</td>";
				str += "<td>"+ prod.prodSale +"</td> </tr>";
				})
			})
			let pagingArea = "";
			pagingArea += "<div class='dataTables_paginate paging_simple_numbers' id='example2_paginate'>";
			pagingArea += "<ul class='pagination justify-content-center'>";
			pagingArea += "<li class='paginate_button page-item previous' "; 
			if(res.startPage<6) {
				pagingArea += "style='display:none;'";
			}
			pagingArea += "id='example2_previous'>";
			console.log(res.startPage);
			pagingArea += "<a href='javascript:prodList("+(parseInt(res.startPage)-5)+")' aria-controls='example2' data-dt-idx='0' tabindex='0' class='page-link'>이전</a></li>";
		
			for(let pNo=res.startPage;pNo<=res.endPage;pNo++) {		
			pagingArea += "<li class='paginate_button page-item ";
				if(res.currentPage == pNo) {
					pagingArea += "active";
			}
			pagingArea += "'>";
			pagingArea += "<a href='javascript:prodList("+pNo+")' aria-controls='example2' data-dt-idx='1' tabindex='0' ";
			pagingArea += "class='page-link'>"+pNo+"</a>";
			pagingArea += "</li>";
			}
			pagingArea += "<li class='paginate_button page-item next' "; 
			if(res.endPage>=res.totalPages) {
				pagingArea += "style='display:none;'";
			}
			pagingArea += "id='example2_next'><a href='javascript:prodList("+(parseInt(res.startPage)+5)+")' aria-controls='example2' data-dt-idx='7' ";
			pagingArea += "tabindex='0' class='page-link'>다음</a></li>";
			pagingArea += "</ul>";
			pagingArea += "</div>";
			
			$('#prodList').html(str);
			$('#prodPage').html(pagingArea);
		}
	})
}
</script>