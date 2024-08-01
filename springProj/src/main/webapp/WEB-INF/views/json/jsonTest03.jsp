<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script>
/*
- JSON은 간단한 데이터 교환 형식임
- JSON은 자체 설명하고 이해하기 쉬움
- JSON은 언어와 무관함
- JSON은 자바스크립트 구문을 사용하지만 형식은 텍스트만 사용함
- 텍스트는 모든 프로그래밍 언어에서 데이터 형식으로 읽고 사용할 수 있음
- 데이터는 이름/값 쌍임
- 데이터는 쉼표로 구분됨
- 중괄호는 객체를 유지함
- 대괄호는 배열을 유지함
- JSON 형식은 자바스크립트 객체와 거의 비슷하며, 단지, JSON에서 키는 문자열이어야
-   하며, 큰 따옴표로 작성해야 하지만, 자바스크립트에서 키는 문자열, 숫자 또는
-   식별자 이름이 될 수 있음
- JSON에서 문자열 값은 큰 따옴표로 작성해야 하지만, 자바스크립트에서는 큰
-   따옴표나 작은 따옴표로 작성할 수 있음
*/
let myObj, x;
window.onload = function(){
	myObj = [
		{"name":"아잠만", "type":"먹보", "species":"오리"},
		{"name":"뽀야미", "type":"친절", "species":"햄스터"},
		{"name":"쭈니", "type":"느끼", "species":"다람쥐"}
		];
	x = myObj.name;
	let str = "";
	myObj.forEach(function(a){
	str+="<tr>";
	str+="<td>"+a.name+"</td>";
	str+="<td>"+a.type+"</td>";
	str+="<td>"+a.species+"</td>";
	str+="</tr>";
	})
document.querySelector('#tbody').innerHTML = str;
}
</script>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>name</th>
				<th>type</th>
				<th>species</th>
			</tr>
		</thead>
		<tbody id="tbody">
			
		</tbody>
	</table>
	<div id="demo"></div>
</body>
</html>
