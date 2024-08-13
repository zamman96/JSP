package kr.or.ddit.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.service.ItemService;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/item")
@Slf4j
@Controller
public class ItemController {
	//DI(의존성 주입), IoC(제어의 역전)
	// root-context에 있는 value값 c:\\upload
	@Autowired
	String uploadPath;
	
	@Autowired
	String uploadFolder;
	
	@Autowired
	ItemService service;
	
	// 파일 등록 폼
	@GetMapping("/register")
	public String register() {
		return "item/register";
	}
	
//	// 파일 등록 폼
//	@GetMapping("/register2")
//	public String register2(Model model) {
//		MemberVO mem = new MemberVO();
//		mem.setMemName("오리");
//		mem.setMemId("a001");
//		model.addAttribute("memberVo", mem);
//		return "item/register2";
//	}
	
	// 컨트롤러는 기본적으로 자바빈즈 규칙에 맞는 객체 VO는 
	// 다시 화면으로 폼객체를 전달함
	
	// 폼 객체의 속성명은 직접 지정하지 않으면 폼 객체의 클래스명의
	// 맨처음 문자를 소문자로 변환하여 처리함 (memberVO)
	
	// 속성명 지정 @ModelAttribute("이름")
	@GetMapping("/register2")
	public String register2(@ModelAttribute("memberVO") MemberVO memberVO) {
		memberVO.setMemName("오리");
		memberVO.setMemId("a001");
		memberVO.setMemRegno1("123123");
		return "item/register2";
	}
	
	@ResponseBody
	@PostMapping("/registerPost")
//	public String registerPost(@RequestParam("uploadFile") MultipartFile uploadFile) {
											// name 값이 그대로 와야함
	public String registerPost(MultipartFile uploadFile) {
		//MultipartFile : 스프링에서 제공해주는 타입
		/*
			--잘 씀
			String getOriginalFileName() : 업로드 되는 파일의 이름(실제 파일명)
			boolean isEmpty() : 파일이 없다면 true
			long getSize() : 업로드되는 파일의 크기
			transferTo(File file) : 파일을 저장
			--잘 안씀..
			String getName() : <input type="file" name="uploadFile" 에서 uploadFile을 가져옴
			byte[] getBytes() : byte[]로 파일 데이터 반환
			inputStream getInputStream() : 파일데이터와 연결된 InputStream을 반환
		*/

		log.info("filename : "+uploadFile.getOriginalFilename());
		log.info("contentType : "+uploadFile.getContentType());
		log.info("size : "+uploadFile.getSize());
		
		// 계획 ( 경로와 파일이름 )
		File uploadPath = new File(this.uploadPath, uploadFile.getOriginalFilename());
		log.info("uploadPath : "+uploadPath);
		
		// 파일 복사 실행
		// 파일객체.transferTo(계획)
		try {
			uploadFile.transferTo(uploadPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uploadFile.getOriginalFilename();
	}

	/*
	// disabled한 파라미터의 값은 전달되지않음
	@PostMapping("/registerPost2")
	public String registerPost2(@ModelAttribute("memberVO") MemberVO memberVO) {
		MultipartFile fileImage = memberVO.getFileImage();
		// 계획 ( 경로와 파일이름 )
		log.info("memName : "+ memberVO.getMemName());
		log.info("memId : "+memberVO.getMemId());
		log.info("mem "+memberVO);
		
		//MIME(Multipurpose Internet Mail Extensions)타입

//	      Multipurpose Internet Mail Extensions의 약자로 간단히 말하면 
//	      파일 변환을 의미한다.현재는 웹을 통해 여러 형태의 파일을 전달하는데 사용하고 있지만 
//	      이 용어가 생길 땐 이메일과 함께 동봉할 파일을 텍스트 문자로 전환해서 이메일 시스템을 
//	      통해 전달하기 위해 개발되어 Internet Mail Extensions라고 불리기 시작했다고 한다.
	
		
		log.info("filename : "+fileImage.getOriginalFilename());
		log.info("contentType : "+fileImage.getContentType());
		log.info("size : "+fileImage.getSize());
		long size = fileImage.getSize();
		
		File uploadFolder = new File(this.uploadFolder, getFolder());
		if(!uploadFolder.exists()) {
			uploadFolder.mkdirs();
		}
		
		// 같은날 같은 이미지 업로드 시 파일 중복 방지!!
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString()+"_"+fileImage.getOriginalFilename();
		File upload = new File(uploadFolder, fileName);
		
		// 파일 복사 실행
		// 파일객체.transferTo(계획)
		try {
			fileImage.transferTo(upload);
			
			// 썸네일 처리
			if(checkImageType(upload)) { // 이미지인 경우
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_"+fileName));
				
				// 라이브러리 사용 (파일 객체, 계획, 가로크기, 세로크기)
				Thumbnailator.createThumbnail(fileImage.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
			}
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "item/register2";
	}
	
	*/
	
	// disabled한 파라미터의 값은 전달되지않음
		@PostMapping("/registerPost2")
		public String registerPost2(Model model, @ModelAttribute("memberVO") MemberVO memberVO) {
			// 계획 ( 경로와 파일이름 )
			int result = this.service.registerPost2(memberVO);
			log.info("result >> "+result);
			
			memberVO = this.service.getMemberFile(memberVO);
			model.addAttribute("memberVO", memberVO);
			return "item/register2";
		}
	
}
