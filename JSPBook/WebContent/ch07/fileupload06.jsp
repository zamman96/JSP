<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script src="/js/jquery.min.js"></script>
<script>
$(function(){
	$('#uploadFile').on('input',handleImg);
})

// e 이벤트 객체
function handleImg(e){
	let files = e.target.files; // 파일에 접근
	let fileArr = Array.prototype.slice.call(files); // 붙어있는 파일을 배열로 정렬
	$.each(fileArr, function(){
		$('.custom-file-label').text(this.name);
	});
}
</script>
<title>File Upload</title>
</head>
<body>
<div class="card card-primary">
      <div class="card-header">
         <h3 class="card-title">로그인</h3>
      </div>
      <!-- 
      요청URI : fileupload06_process.jsp
      요청파라미터 : {memMail=test@test.com,password=java,uploadFile=파일객체,remember-me=on}
      요청방식 : post
       -->
      <form name="frm" action="fileupload06_process.jsp" method="post"
         enctype="multipart/form-data">
         <div class="card-body">
            <div class="form-group">
               <label for="exampleInputEmail1">Email address</label> 
               <input type="email" class="form-control" id="memMail" name="memMail" 
                  placeholder="Enter email" required />
            </div>
            <div class="form-group">
               <label for="exampleInputPassword1">Password</label> 
               <input type="password" class="form-control" id="password" name="password" placeholder="Password"
                  required />
            </div>
            <div class="form-group">
               <label for="exampleInputFile">File input</label>
               <div class="input-group">
                  <div class="custom-file">
                     <input type="file" class="custom-file-input" id="uploadFile" name="uploadFile" /> 
                     <label class="custom-file-label"
                        for="uploadFile">Choose file</label>
                  </div>
               </div>
            </div>
            <div class="form-check">
               <input type="checkbox" class="form-check-input" id="remember-me"
                name="remember-me" />
               <label class="form-check-label" for="remember-me">
               Check me out</label>
            </div>
         </div>

         <div class="card-footer">
            <button type="submit" class="btn btn-primary">Submit</button>
         </div>
      </form>
   </div>
</body>
</html>