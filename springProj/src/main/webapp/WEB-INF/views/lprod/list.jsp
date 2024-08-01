<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<div class="col-md-12 card">
	<div class="card-header">
		<h3>상품 목록</h3>
		<a href="/lprod/create">상품 등록</a>
		<form action="/lprod/list" class="row"
			style="justify-content: space-between;">
			<select name="gubun" class="form-control" style="width: 300px;">
				<option value="" selected>선택</option>
				<option value="lprodGu"
					<c:if test="${param.gubun=='lprodGu'}">selected</c:if>>상품분류번호</option>
				<option value="lprodNm"
					<c:if test="${param.gubun=='lprodNm'}">selected</c:if>>상품분류명</option>
			</select>
			<div class="input-group input-group-sm" style="width: 150px;">
				<input type="text" name="keyword" class="form-control float-right"
					placeholder="Search"
					value="<c:if test="${param.keyword!=null}">${param.keyword}</c:if>">
				<div class="input-group-append">
					<button type="submit" class="btn btn-default" style="height: 31px;">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
</div>
<div class="card-body row" style="justify-content: space-between;">
	<div  style="width: 45%; margin-right: 20px;">
		<table class="table table-bordered" id="prodTable">
		<thead>
			<tr>
				<th>순번</th>
				<th>상품코드</th>
				<th>상품분류명</th>
				<th>수량</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${fn:length(data.content)==0}">
				<tr>
					<td colspan="4">해당하는 조건의 상품이 없습니다</td>
				</tr>
			</c:if>
			<c:forEach items="${data.content}" var="vo">
				<tr data-lprod-gu="${vo.lprodGu}" class="click">
					<td>${vo.rnum}</td>
					<td><a href="/lprod/detail?lprodId=${vo.lprodId}">${vo.lprodGu}</a></td>
					<td>${vo.lprodNm}</td>
					<td>${vo.cnt}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="card-footer clearfix">${data.pagingArea}</div>
	</div>
	<!-- 
   [가로]행=로우=튜플=레코드
   [세로]열=필드=컬럼=애트리뷰트=속성 
   -->
	<div  style="width: 45%; overflow: scroll; height: 550px;" id="prod">
	</div>
</div>
</div>

<div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Large Modal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>One fine body&hellip;</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
<script>
$('#prod').hide();
$('.click').on('click',function(){
	let gu = $(this).data("lprodGu");
// 	console.log($(this));
	$('#prodTable tr').css({"background": "white"});
	$(this).css({"background": "#007bff"});
// 	console.log(gu);
	//AJAX(Asynchronous JavaScript and Xml,에이잭스)
    /*
    - Asynchronous Javascript And Xml(비동기식 자바스크립트와 xml)의 약자
    - 자바스크립트를 이용해 서버와 브라우저가 비동기 방식으로 데이터를 교환할 수 있는 
       통신 기능
    - 브라우저가 가지고있는 XMLHttpRequest 객체를 이용해서 전체 페이지를 새로 
       고치지 않고도 페이지의 일부만을 위한 데이터를 로드하는 기법
    - 즉, 쉽게 말하자면 자바스크립트를 통해서 서버에 데이터를 비동기 방식으로 
       요청하는 것이다.
    */
    //달러.ajax() : 비동기 AJAX 요청을 수행
     //달러.ajaxSetup() : 향후 AJAX 요청에 대한 기본 값을 설정
     //달러.ajax() 메서드를 사용하면 AJAX의 다양한 설정을 미리 할 수 있고,
     //   응답이 성공했을 때의 처리, 응답이 실패했을 때츼 처리를 단락 형태로
     //   구분하여 처리할 수 있음.
     //   이들 작업이 완료된 후에 처리해야 할 것이 있으면 추가로 작업할 수 있도록 구분함
	$.ajax({
		url : "/lprod/prodListAjax",
		type : "Post",
		data : JSON.stringify({"prodLgu":gu}),
		dataType : "json",
        contentType : 'application/json; charset=utf-8',
		success : function(res){
// 			console.log(res);
			$('#prod').show();
	        let str = "<table class='table table-striped'>";
	        str += "<thead>";
	        str += "<tr>";
	        str += "<th>상품코드</th>";
	        str += "<th>상품명</th>";
	        str += "<th>거래처</th>";
	        str += "<th>판매가</th>";
	        str += "</tr>";
	        str += "</thead>";
	        str += "<tbody>";
			if(res.length==0){
				str+="<td colspan='4'>상품이 없습니다</td>";
			};
	        // res의 리스트를 순회하며 테이블의 행을 생성합니다.
	        res.forEach(function(buyer, index) {
	        	buyer.prodVoList.forEach(function(prod, id){
	        		
	        	let prodSale = prod.prodSale;
	        	// /\B		(?=		(\d{3})+	(?!\d))/g
	        				// 전방 탐색 기호(lookahead) (?=)
	        						// + : 1개 이상 => ,를 붙이려면  (\d{3}) 무조건 숫자가 3개가 있어야 붙일 수 있음
	        									// (?!\d) => \d : 숫자, (?!) : 부정형 전방 탐색
	        	// 그 외 
	        	// (?<=) 긍정형 후방탐색
	        	// (?<!) 부정형 후방탐색
	        	prodSale = prodSale.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        	
	            str += "<tr>";
	            str += "<td>" + prod.prodId + "</td>";  // 상품코드
	            str += "<td>" + prod.prodName + "</td>"; // 상품분류명
	            str += "<td>" + buyer.buyerName + "</td>"; 
	            str += "<td>" + prodSale + "</td>"; 
	            str += "</tr>";
	        	})
	        });

	        str += "</tbody>";
	        str += "</table>";
			$('#prod').html(str);
		}
	})
	
})
</script>
