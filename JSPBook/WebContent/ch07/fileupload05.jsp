<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
	$('input:file').on('input',handleImg);
})

// e 이벤트 객체
function handleImg(e){
	let files = e.target.files; // 파일에 접근
	let fileArr = Array.prototype.slice.call(files); // 붙어있는 파일을 배열로 정렬
	$.each(fileArr, function(){
		// 이미지 여부 체크
		if(!this.type.match("image.*")){
			console.log("이미지가 아닙니다")
			return;
		}
		
		// 이미지 
		let reader = new FileReader();
		
		// e : reader가 이미지 객체를 읽는 이벤트
		reader.onload = function(e){
			let img_html = "<img src='"+e.target.result+"' style='width:50%;' />";
			// 요소.append : 누적, 요소.html : 새로고침,
			// 요소.innerHTML : JavaScript에서 새로고침
			$('#pImg').html(img_html);
		}
		reader.readAsDataURL(this);
	});
}
</script>
<title>File Upload</title>
</head>
<body>
<!-- 1. form태그 2. post 3.multipart/form-data 4. file 
   요청URI : fileupload04_process.jsp
   요청파라미터 : {filename=파일객체}
   요청방식 : post
   -->
	<form action="fileupload05_process.jsp" method="post" enctype="multipart/form-data">
		<p>이름 : <input type="text" name="name" /></p><!-- FileItem, isFormField(o) -->
		<p>제목 : <input type="text" name="subject" /></p><!-- FileItem, isFormField(o) -->
		<p id="pImg"></p>
		<p>파일 : <input type="file" name="filename" /></p>
		<p><input type="submit" value="파일올리기" /></p>
	</form>
</body>
</html>