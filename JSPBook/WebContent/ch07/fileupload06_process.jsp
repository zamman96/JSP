<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload"%>
<!-- 1. form태그 2. post 3.multipart/form-data 4. file 
   요청URI : fileupload04_process.jsp
   요청파라미터 : {filename=파일객체}
   요청방식 : post
 -->
 <%
 	//윈도우 경로 : 역슬러시 두 개
 	String path = "c:\\upload";
 	String path2 = "c:\\upload2";
 	
 	//commons-fileupload.jar 안에 해당 클래스가 있음
 	DiskFileUpload upload = new DiskFileUpload();
 	
 	// 업로드 할 파일 크기의 최대 크기
 	upload.setSizeMax(5000000); //5Mbyte
 	
 	// 메모리에 저장할 최대 크기
 	upload.setSizeThreshold(5*4096); // 5 * 1024 * 1024
 	
 	// 업로드할 파일을 임시로 저장할 경로(폴더가 없으면 자동으로 폴더가 생성됨 mkdir()으로 생성하지 않아도됨)
 	upload.setRepositoryPath(path);
 	
 	// 요청 파라미터 : {filename=파일객체}
 	// parse : 구문분석(오류체크), 의미분석, 변환
 	List items = upload.parseRequest(request);
 	
 	// 요청 파라미터 들을 Iterator(열거) 클래스로 변환
 	Iterator params = items.iterator();
 	
 	// 요청 파라미터가 없어질 때 까지 반복
 	while(params.hasNext()){
 		// FileItem : 일반데이터(text, radio, checkbox)
 		//            파일(file)
 		FileItem item = (FileItem) params.next();
 	
 		//isFormField() > true > 일반데이터
 		if(!item.isFormField()){// 파일(input type="file")
 			// 요청 파라미터 : {filename=파일객체} => item
 			
 			String fileFieldName = item.getFieldName(); // filename
 			
 			String fileName = item.getName(); // 업로드 될 파일 명(경로 포함)
 			fileName = fileName.substring(fileName.lastIndexOf("\\")+1); // 경로 삭제
 			
 			// 이미지파일이라면 MIME TYPE : image/jpg
 			String contentType = item.getContentType(); 
 			
 			long fileSize = item.getSize(); //파일의 크기
 			
 			// 파일이 이미 있으면 already exists: 오류 발생
 			//파일명 중복 방지 시작
 			UUID uuid = UUID.randomUUID();	
 			fileName = uuid.toString() + "_" +fileName;
 			
 			// c:\\upload\\사진.jpg로 복사
 			File file = new File(path, fileName);
 			
 			// 복사 실행
 			item.write(file);
 			
 			out.print("================<br />");
 			out.print("요청 파라미터 이름 : "+fileFieldName+"<br />");
 			out.print("저장 파일 이름 : "+fileName+"<br />");
 			out.print("파일 콘텐트 유형 : "+contentType+"<br />");
 			out.print("파일 크기 : "+fileSize+"<br />");
 		} else{
 			String name = item.getFieldName();
 			String value = item.getString("UTF-8"); // 한글 처리
 			out.print(name+ " : "+value+"<br/>");
 		}
 	}
 %>