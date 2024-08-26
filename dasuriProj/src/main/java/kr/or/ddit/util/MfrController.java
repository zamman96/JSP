package kr.or.ddit.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;

import kr.or.ddit.vo.MfrVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MfrController {

	private List<MfrVO> mfrVOList;
	
	public List<MfrVO> getMfrVOList(){
		List<MfrVO> list = new ArrayList<MfrVO>();
		
		// 제조사 목록
		MfrVO mfrVO = new MfrVO();
		mfrVO.setMfrCode("hyundai");
		mfrVO.setMfrNm("현대");
		list.add(mfrVO);
		
		
		mfrVO = new MfrVO();
		mfrVO.setMfrCode("genesis");
		mfrVO.setMfrNm("제네시스");
		list.add(mfrVO);
		
		mfrVO = new MfrVO();
		mfrVO.setMfrCode("kia");
		mfrVO.setMfrNm("기아");
		list.add(mfrVO);
		this.mfrVOList = list;
		
		return list;
	}
}
