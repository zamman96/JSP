package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.PerSerMapper;
import kr.or.ddit.service.PerSerService;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.FileGroupVO;
import kr.or.ddit.vo.PerReplyVO;
import kr.or.ddit.vo.PerSerVO;

@Service
public class PerSerServiceImpl implements PerSerService{

	@Autowired
	PerSerMapper perSerMapper;
	
	
	@Autowired
	UploadController uploadController;
	
	@Override
	public List<PerSerVO> list(Map<String, Object> map) {
		return this.perSerMapper.list(map);
	}

	@Override
	public int getListTotal(Map<String, Object> map) {
		return this.perSerMapper.getListTotal(map);
	}

	@Override
	public PerSerVO detail(int serNum) {
		return this.perSerMapper.detail(serNum);
	}

	@Override
	public int registPost(PerSerVO perSerVO) {
		int result = 0;
		MultipartFile[] multipartFiles = perSerVO.getUploadFile();
		
		long fileGroupNo = this.uploadController.multiImageUpload(multipartFiles);
		perSerVO.setFileGroupNo(fileGroupNo);
		return this.perSerMapper.registPost(perSerVO);
	}

	@Override
	public int editPost(PerSerVO perSerVO) {
		return this.perSerMapper.editPost(perSerVO);
	}

	@Override
	public int deletePost(int serNum) {
		return this.perSerMapper.deletePost(serNum);
	}

	@Override
	public int registReplyPost(PerReplyVO perReplyVO) {
		return this.perSerMapper.registReplyPost(perReplyVO);
	}

	@Override
	public List<PerReplyVO> replyList(int serNum) {
		return this.perSerMapper.replyList(serNum);
	}

}
