<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="row">
<div class="col-md-12 card">
	<div class="card-header">
		<h3>유저 카드 등록</h3>
	</div>
	<div class="card-body row" style="justify-content: space-between;">
			 <div class="card-body p-0">
			 <form method="post" action="/prod/cardFormPost">
				<p><input value="a001" placeholder="아이디" type="text" name="userId" id="userId"></p>
				<p><input value="java" placeholder="비밀번호" type="password" name="password" id="password"></p>
				<p><input value="오리" placeholder="이름" type="text" name="name" id="name"></p>
				<p><input value="duckduck@duck.com" placeholder="이메일" type="text" name="email" id="email"></p>
				<p><input value="2020-06-30" placeholder="생년월일" type="date" name="bir" id="bir "></p>
				<p><input value="12345" placeholder="우편번호" type="text" name="zipcode" id="zipcode">
					<input type="button" value="우편번호 검색" onclick="openHomeSearch()">
				</p>
				<p><input value="대전" placeholder="주소" type="text" name="addr" id="addr"></p>
				<p><input value="건물" placeholder="상세주소" type="text" name="addrdet" id="addrdet"></p>
              
              	<hr/>
              	<c:forEach var="num" items="${cardList}" varStatus="st">
              	<p>
	              	<input value="${num}" type="text" name="cardVoList[${st.index}].cardNo" id="cardNo${st.index}" placeholder="카드 번호">
	              	<input value="251008" type="text" name="cardVoList[${st.index}].cardYm" id="cardYm${st.index}" placeholder="유효 연월">
              	</p>
              	</c:forEach>
              	<hr/>
              	<div class="row">
					<p style="place-self: center; margin: 5%;">취미(hobby)</p>
					
					<div style="display: flex; flex-direction: column;">
						<p><input type="checkbox" id="hobby1" name="hobby" value="sport" multiple> <label for="hobby1">Sports</label></p>
						<p><input type="checkbox" id="hobby2" name="hobby" value="music" multiple> <label for="hobby2">Music </label></p>
						<p><input type="checkbox" id="hobby3" name="hobby" value="movie" multiple> <label for="hobby3">Movie </label></p>
						 <p><input type="checkbox" id="hobby4" name="hobby" value="game" multiple> <label for="hobby4">Game </label></p>
					</div>
				</div>
              	<div class="row">
					<p style="place-self: center; margin: 5%;">취미(hobbyStr)</p>
					<div style="display: flex; flex-direction: column;">
						<p><input type="checkbox" id="hobbyStr1" name="hobbyStr" value="sport" multiple> <label for="hobbyStr1">Sports</label></p>
						<p><input type="checkbox" id="hobbyStr2" name="hobbyStr" value="music" multiple> <label for="hobbyStr2">Music </label></p>
						<p><input type="checkbox" id="hobbyStr3" name="hobbyStr" value="movie" multiple> <label for="hobbyStr3">Movie </label></p>
						 <p><input type="checkbox" id="hobbyStr4" name="hobbyStr" value="game" multiple> <label for="hobbyStr4">Game </label></p>
					</div>
				</div>
              	<div class="row">
					<p style="place-self: center; margin: 5%;">보유 자동차</p>
					<div style="display: flex; flex-direction: column;">
						<select name="cars" multiple>
						<optgroup label="현대">
							<option value="grandeur">그랜저</option>
							<option value="GV80">제네시스 GV80</option>
							<option value="DN8">쏘나타 디 엣지</option>
							<option value="K9">K9</option>
							<option value="soul">쏘울 부스터</option>
						</optgroup>
						<optgroup label="KG모빌리티(쌍용)">
							<option value="G4">렉스턴 G4</option>
							<option value="CW700">뉴체어맨 W</option>
						</optgroup>
						<optgroup label="람보르기니">
							<option value="LP640">우라칸 LP640</option>
						</optgroup>
						</select>
					</div>
				</div>
              	<input type="submit" value="저장">
			 </form>
              </div> 
              <!-- /.card-body -->
	</div>
</div>
</div>
<script>
function openHomeSearch(){
	new daum.Postcode({
	    oncomplete: function(data) {
	    	// json 형태로 데이터가 전달
	    	console.log(data);
	    	$('#zipcode').val(data.zonecode);
	    	$('#addr').val(data.address);
	    	$('#addrdet').val(data.buildingName);
	    	$('#addrdet').focus();
	    }
	}).open();
}
</script>