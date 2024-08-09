package kr.or.ddit.service.impl;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.ProdDao;
import kr.or.ddit.mapper.FileGroupMapper;
import kr.or.ddit.mapper.ProdMapper;
import kr.or.ddit.service.ProdService;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.CarsVO;
import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FileGroupVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.TblHobbyVO;
import kr.or.ddit.vo.TblUserVO;

@Service
public class ProdServiceImpl implements ProdService{

	@Autowired
	ProdMapper mapper;
	
	@Autowired
	String uploadPath;
	
	@Autowired
	FileGroupMapper fileMapper;
	
	@Autowired
	UploadController upload;
	
	@Override
	public List<ProdVO> list(Map<String,Object> map) {
		return this.mapper.prodList(map);
	}

	@Override
	public int getTotal() {
		return this.mapper.prodListTotal();
	}

	@Override
	public List<ProdVO> cartlist(ProdVO vo) {
		return this.mapper.cartlist(vo);
	}

	@Override
	public MemberVO memDetail(MemberVO vo) {
		return this.mapper.memDetail(vo);
	}

	// 회원 정보를 저장하다가 실패하거나 카드 등록 실패하면 모두 취소
	// 모두 저장에 성공해야 성공하도록 처리
	@Override
	@Transactional
	public int cardFormPost(TblUserVO vo) {
//		1) tbl_user 테이블 insert
		int result = this.mapper.insertTblUser(vo);
		
//		2) card 테이블에 insert
		List<CardVO> cardvo = vo.getCardVoList();
		String userId = vo.getUserId();
		for(CardVO v : cardvo) {
			v.setUserId(userId);
			result+= this.mapper.insertCard(v);
		}
//		3) hobby에 insert
		List<TblHobbyVO> hobbyvo = new ArrayList<TblHobbyVO>();
		String[] hobby = vo.getHobby();	// hobby 배열을 사용
//		String[] hobby = vo.getHobbyStr().split(","); // hobbyStr을 활용
		if(hobby!=null) {
			for(String h: hobby) {
				TblHobbyVO hvo = new TblHobbyVO();
				hvo.setUserId(userId);
				hvo.setHobby(h);
				hobbyvo.add(hvo);
				result+= this.mapper.insertHobby(hvo);
			}
		}
//		4) cars에 insert
		List<CarsVO> carsVoList = new ArrayList<CarsVO>();
		String[] cars = vo.getCars();
		for(String car: cars) {
			CarsVO cvo = new CarsVO();
			cvo.setUserId(userId);
			cvo.setCar(car);
			carsVoList.add(cvo);
		}
		result+=this.mapper.insertCars(carsVoList);
		return result;
	}

	@Override
	public List<LprodVO> lprodList() {
		return this.mapper.lprodList();
	}

	@Override
	public List<BuyerVO> buyerList(BuyerVO bvo) {
		return this.mapper.buyerList(bvo);
	}

	@Override
	public String createProdId(ProdVO vo) {
		return this.mapper.createProdId(vo);
	}

	@Override
	@Transactional
	public int registPost(ProdVO vo) {
		long groupNo = upload.multiImageUpload(vo.getUploadFile());
		vo.setFileGroupNo(groupNo);
		return this.mapper.registPost(vo);
	}

	@Override
	public BuyerVO detail(ProdVO prodVo) {
		return this.mapper.detail(prodVo);
	}

	@Override
	@Transactional
	public int updatePost(ProdVO prodVo) {
		MultipartFile[] multipartFiles = prodVo.getUploadFile();
		if(multipartFiles[0].getOriginalFilename().length()>0) {
			ProdVO vo = this.mapper.fileInfo(prodVo);
			int result = 0;
			long fileGroupNo = this.upload.multiImageUpload(multipartFiles);
			prodVo.setFileGroupNo(fileGroupNo);
			if(vo!=null) {
				FileGroupVO fg = vo.getFgvo();
				result = this.mapper.updatePost(prodVo);
				result = this.upload.deleteFile(fg);
			}else {
				result = this.mapper.updatePost(prodVo);
			}
			return result;
		} else {
			return this.mapper.updatePost(prodVo);
		}
	}

	@Override
	@Transactional
	public int delete(String prodId) {
		int result = 0;
		ProdVO prodVo = new ProdVO();
		prodVo.setProdId(prodId);
		ProdVO vo = this.mapper.fileInfo(prodVo);
		if(vo!=null) {
			FileGroupVO fg = vo.getFgvo();
			result += this.upload.deleteFile(fg);
			result += this.mapper.delete(prodId);
		}else {
			result = this.mapper.delete(prodId);
		}
		return result;
	}

}
