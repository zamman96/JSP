<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script>
let text = '{"name":"아잠만", "type":"먹보", "bir":"2020-06-30"}'
console.log(text);

// JSON.parse : JSON형 text를 JSON Object로 변환
let obj = JSON.parse(text);
console.log(obj);

// JSON.stringify : JSON Object를 JSON형 text로 변환
text = JSON.stringify(obj);
console.log(text);
window.onload = function(){
	let dd = document.querySelector('#demo');
	dd.innerHTML = obj.name;
}
</script>
</head>
<body>
	<div id="demo"></div>
	<h2>Convert a JavaScript object into a JSON string, and send it to
		the server.</h2>
	<h5>
		<p>JSON은 JavaScript Object Notation의 약자.</p>
		<p>JSON은 텍스트에 기반을 둔 데이터 저장 및 교환을 위한 구문임</p>
		<p>JSON은 자바스크립트 객체 표기법으로 작성된 텍스트임</p>
		<p>JSON은 브라우저와 서버 간에 데이터를 교환할 때 데이터는 텍스트일 뿐임</p>
		<p>모든 자바스크립트 객체를 JSON으로 변환하고 JSON을 서버로 보낼 수 있음</p>
		<p>서버에서 받은 JSON을 자바스크립트 객체로 변환할 수 있음</p>
	</h5>
		<!-- 
   client -> server (string 형식으로 전달)
   server -> client (string 형식으로 전달)
   string으로 받아온 데이터를 다시 Object로 변환하여 브라우저에 표기!
   object -> string 으로 변환하는 방식을 serialize 라고 한다!
   string -> object로 다시 변환하는 방식을 deserialize라고 함!
    -->
</body>
</html>