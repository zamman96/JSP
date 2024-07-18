<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
//윈도우 경로 : 역슬러시 두 개
// 해당 경로는 가져오는 과정이 있기 때문에  redirect로 페이지를 이동했을 때 해당 이미지가 바로 표시되지 않는다 cash폴더를 이용해야 빠르게 접근이 가능하다
// 	String path = "D:\\A_TeachingMaterial\\06_JSP\\workspace\\JSPBook\\WebContent\\images";
	// 캐시파일로 저장할 경우 바로 이미지가 나옴 org.eclipse.wst.server.core\\tmp0\\wtpwebapps 의 경로로 들어갈 것
	String path = "D:\\A_TeachingMaterial\\06_JSP\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JSPBook\\images";
	
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
	
	ProductVO vo = new ProductVO();
	
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
			vo.setFilename(fileName);

		} else{
			String key = item.getFieldName();
			String value = item.getString("UTF-8"); // 한글 처리
			// if문으로 비교해서 넣기..
			if(key.equals("productId")){
				vo.setProductId(value);
			} else if(key.equals("pname")){
				vo.setPname(value);
			} else if(key.equals("unitPrice")){
				vo.setUnitPrice(Long.parseLong(value));
			} else if(key.equals("description")){
				vo.setDescription(value);
			} else if(key.equals("manufacturer")){
				vo.setManufacturer(value);
			} else if(key.equals("category")){
				vo.setCategory(value);
			} else if(key.equals("unitsInStock")){
				vo.setUnitsInStock(Integer.parseInt(value));
			} else if(key.equals("condition")){
				vo.setCondition(value);
			} 
		}
	}

	ProductRepository dao = ProductRepository.getInstance();
	// 새로운 상품 등록
	dao.addProduct(vo);
	// 목록이동 (redirect : url)
	response.sendRedirect("/products.jsp");
	
%>