package kr.or.ddit.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.FileGroupMapper;
import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.service.ItemService;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FileGroupVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	String uploadPath;
	
	// 매퍼 xml이 inject됨
	@Autowired
	FileGroupMapper mapper; 

	@Autowired
	MemberMapper memMapper;
	
	@Override
	public int registerPost2(MemberVO memberVO) {
		int result = 0;
		// memberVO 객체로부터 파일객체를 꺼내보자
		MultipartFile multipartFile = memberVO.getFileImage();
		// 파일명
		String fileName = multipartFile.getOriginalFilename();
		// MIME(Multipurpose Internet Mail Extensions)타입
		/*
		 * Multipurpose Internet Mail Extensions의 약자로 간단히 말하면 파일 변환을 의미한다.현재는 웹을 통해 여러
		 * 형태의 파일을 전달하는데 사용하고 있지만 이 용어가 생길 땐 이메일과 함께 동봉할 파일을 텍스트 문자로 전환해서 이메일 시스템을 통해
		 * 전달하기 위해 개발되어 Internet Mail Extensions라고 불리기 시작했다고 한다.
		 */
		String contentType = multipartFile.getContentType();
		// 파일 크기. byte(1) short(2) int(4) long(8)
		long size = multipartFile.getSize();
		log.info("====================");
		log.info("fileName : " + fileName);
		log.info("contentType : " + contentType);
		log.info("size : " + size);
		log.info("====================");

		// 서버의 어디로 파일을 복사할것인지?
		// 연월일 폴더 생성
		// C:\\upload
		// , : + \\ +
		// 2024\\08\\06
		File uploadFolder = new File(this.uploadPath, getFolder());
		if (!uploadFolder.exists()) {
			uploadFolder.mkdirs();
		}

		// 같은날 같은 이미지 업로드 시 파일 중복 방지 시작 /////
		// java.util.UUID => 랜덤값 생성
		UUID uuid = UUID.randomUUID();
		// 원래의 파일 이름과 구분하기 위해 _를 붙임(asdfasdfsdfa_개똥이.jpg)
		fileName = uuid.toString() + "_" + fileName;
		// 같은날 같은 이미지 업로드 시 파일 중복 방지 끝 /////

		// File객체 설계(복사할 대상 경로, 파일명)
		// C:\\upload\\2024\\08\\06 + "\\" + asdfafds_개똥이.jpg
		File saveFile = new File(uploadFolder, fileName);

		try {
			// 파일객체.transferTo(설계)
			multipartFile.transferTo(saveFile);

			// 썸네일 처리
			// 이미지인지 체킹
			// C:\\upload\\2024\\08\\06 + "\\" + s_asffasd_개똥이.jpg
			if (checkImageType(saveFile)) {// 이미지라면
				// 계획
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_" + fileName));
				// 썸네일 생성(파일객체,계획,가로크기,세로크기)
				Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				thumbnail.close();
			}
			
			FileGroupVO fgvo = new FileGroupVO();
			// File_group 테이블에 insert
			// selectkey에서 받은 fileGroupNo가 fgvo값에 들어옴
			result += this.mapper.insertFileGroup(fgvo);
			
			FileDetailVO fdvo = new FileDetailVO();
			int i = 1;
			fdvo.setFileSn(i++);
			fdvo.setFileGroupNo(fgvo.getFileGroupNo());
			fdvo.setFileOriginalName(multipartFile.getOriginalFilename());
			fdvo.setFileSaveName(fileName);
			fdvo.setFileSaveLocate("/upload/"+getFolder().replace("\\", "/")+"/"+fileName); // 웹경로+uuid_파일명
			fdvo.setFileSize(size);
			fdvo.setFileExt(fileName.substring(fileName.lastIndexOf(".")+1));
			fdvo.setFileMime(contentType);
			// 팬시 크기
			fdvo.setFileFancysize("0");
			result+= this.mapper.insertFileDetail(fdvo);
			
			// member테이블 업데이트
			memberVO.setFileGroupNo(fgvo.getFileGroupNo());
			result+=this.memMapper.updateMember(memberVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 연 / 월 / 일 폴더 생성
	public String getFolder() {
		// 2024-08-06 형식(format)지정
		// 간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String str = sdf.format(today);
		// 2024-08-06 > 2024\\08\\06
		return str.replace("-", File.separator);
	}

	public boolean checkImageType(File file) {
		// MIME(Multipurpose Internet Mail Extensions) : 문서, 파일 또는 바이트 집합의 성격과 형식. 표준화
		// MIME 타입 알아냄. .jpeg / .jpg의 MIME타입 : image/jpeg
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			// image로 시작
			return contentType.startsWith("image");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return false;
	}

	@Override
	public MemberVO getMemberFile(MemberVO memberVO) {
		return this.memMapper.getMemberFile(memberVO);
	}
}
