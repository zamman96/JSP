<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script>
let myObj, myJSON, text, obj;

window.onload = function(){
	// JSON Object
	myObj = {"name":"아잠만", "type":"먹보", "bir":"2020-06-30"}
	myJSON = JSON.stringify(myObj);
	//웹 브라우저(크롬)에 데이터를 저장
	// 사용자가 브라우저를 닫아도 저장한 데이터를 계속해서 유지할 수 있음
	// key-value 쌍으로 데이터를 저장(setItem(key, value)), 가져오기(getItem(key))
	// key : 저장된 값에 대한 이름
	// value : 실제로 저장될 값
	localStorage.setItem("testJSON", myJSON);
	localStorage.setItem("myObj", myObj);
	text = localStorage.getItem("testJSON");
	obj = JSON.parse(text);
	console.log(obj);
	let str = "<tr>";
		str+="<td>"+obj.name+"</td>";
		str+="<td>"+obj.type+"</td>";
		str+="<td>"+obj.bir+"</td>";
		str+="</tr>";
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
				<th>bir</th>
			</tr>
		</thead>
		<tbody id="tbody">
			
		</tbody>
	</table>
	<div id="demo"></div>
</body>
</html>