<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen"/>
<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script>
$(function(){
	$(document).on('click','.edit',function(){
// 		let content = $(this).parent().parent().html();
		let repNo = $(this).parent().parent().data("num");
		let cont = $(this).parent().parent().children('.repContent').html();
		let data = {
				"repNo":repNo,
				"repContent":cont
		};
		console.log(data);
		//modal에 반영
		$("#modalRepNo").val(repNo);
		$("#modalRepContent").val(cont);
	})
})
</script>
<div class="card card-info">
	<div class="card-header">
		<h2>수리 서비스 상세</h2>
	</div>

<!-- 로그인 정보 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.empVO" var="user"/>
</sec:authorize>

	<form action="/perSer/deletePost" method="post">
		<div class="card-body">
			<div class="row">
				<div class="col-sm-12">
					<!-- text input -->
					<input value="${vo.serNum}" type="text" name="serNum" hidden>
					<div class="form-group" id="emp">
						<label for="empNum">사원</label> 
						<input value="${vo.empNum}" readonly required type="text" class="form-control" placeholder="사원번호" name="empNum" id="empNum">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group"id="cust">
						<label for="custNum">고객</label>
						<input value="${vo.custNum}" readonly required="required" type="text" class="form-control" placeholder="고객" name="custNum" id="custNum">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="carNum">자동차</label>
						<select readonly name="carNum" id="carNum" class="form-control">
							<option value="${vo.carNum}">${vo.carNum}</option>
						</select>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group" onclick="openHomeSearch()">
						<label for="amt">수리비용</label>
						<input  value="${vo.amt}" readonly required="required" type="number" class="form-control" placeholder="수리비용" name="amt" id="amt">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="perTme">수리시간</label>
						<input value="${vo.perTme}" readonly  required="required" type="text" class="form-control" placeholder="수리시간" name="perTme" id="perTme">
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">${vo.perDet}</div>
				</div>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer row" style="justify-content: space-between;">
			<sec:csrfInput/>
			<div>
				<a href="/perSer/list" class="btn btn-info">목록</a>
			</div>
			<div>
				<a href="/perSer/edit?serNum=${vo.empNum}" class="btn btn-warning">수정</a>
			</div>
			<div>
				<button type="submit" class="btn btn-danger">삭제</button>
			</div>
		</div>
	</form>
</div>
<div class="card bg-light">
   <div class="card-body">
      <form class="form-horizontal" action="/perSer/registReplyPost" method="post" style="margin-bottom:20px">
         <div class="input-group input-group-sm mb-0">
         	<input hidden type="text" name="serNum" id="serNum" value="${vo.serNum}">
         	<input hidden type="text" name="repWriter" id="repWriter" value="${user.empNum}">
            <input class="form-control form-control-sm" name="repContent" required="required" type="text" placeholder="댓글을 작성해주세요">
            <div class="input-group-append">
               <button type="submit" class="btn btn-danger">Send</button>
            </div>
         </div>
         <sec:csrfInput/>
      </form>
      <c:forEach items="${reply}" var="reply">
      <div class="d-flex mb-4">
       <!-- Parent comment-->
       <div class="flex-shrink-0" style="margin-right:10px;"><img class="img-circle elevation-2" style="width: 50px;" src="/resources/images/NpcNmlDuk11.png" alt="..."></div>
       <div class="ms-3" data-num="${reply.repNo}">
       <div style="display: flex; flex-direction: row;">
			<div class="fw-bold" style="font-weight: bold;">${reply.nm}</div>
			<c:if test="${reply.repWriter==user.empNum}">
				<button type="button"  data-toggle="modal" data-target="#modalUpdateReply" class="btn btn-warning btn-sm edit">수정</button>
				<button type="button" class="btn btn-danger btn-sm">삭제</button>
			</c:if> 
       </div>
			<div style="font-size:0.7rem; color: gray;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${reply.repDate}"/></div>
			<div class="repContent">${reply.repContent}</div>
   		</div>
      </div>
	</c:forEach>
   </div>
</div>

<!-- /// 댓글 수정 모달 시작 /// -->
<div class="modal fade" id="modalUpdateReply">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>
        	<input type="text" id="modalRepNo" />
        	<input type="text" id="modalRepContent" 
        		class="form-control form-control-sm" placeholder="댓글 등록" required />
        </p>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="idUpdate" class="btn btn-primary">저장</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /// 댓글 수정 모달 끝 /// -->
