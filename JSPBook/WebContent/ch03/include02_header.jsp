<%@ page language="java" contentType="text/html; charset=UTF-8"%>
	<div id="time"></div>
	<!-- 2024-06-26 14:09:39 -->
<script>
fnCt();
function fnCt(){
	let today = new Date();
	// 	console.log(today);
	// 연도
	let year = today.getFullYear();
	// 월
	let month = ('0' + (today.getMonth() + 1)).slice(-2);

	// 일
	let day = ('0' + today.getDate()).slice(-2);
	// 	console.log(today.getTime());
	let ampm = "오전"
	let hour = today.getHours();
	if(hour>=12){
		ampm = "오후";
		hour=hour-12;
	}
	hour = ('0' + hour).slice(-2);
	let min = ('0' + today.getMinutes()).slice(-2);
	let sec = ('0' + today.getSeconds()).slice(-2);
	let str = "<p>"+year + "-" + month + "-" + day + " " + hour + ":" + min 
		+ ":" + sec + " " + ampm+"</p>";
	document.querySelector('#time').innerHTML = str;
}
	setInterval(fnCt, 1000); // 1초마다 fnCt 함수를 호출
</script>
