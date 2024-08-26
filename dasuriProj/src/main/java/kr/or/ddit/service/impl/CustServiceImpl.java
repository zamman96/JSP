package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.CustMapper;
import kr.or.ddit.service.CustService;
import kr.or.ddit.vo.CustVO;

@Service
public class CustServiceImpl implements CustService {

	@Autowired
	CustMapper custMapper;
	
	@Override
	public List<CustVO> list(Map<String, Object> map) {
		return this.custMapper.list(map);
	}

	@Override
	public int getListTotal(Map<String, Object> map) {
		return this.custMapper.getListTotal(map);
	}

	@Override
	public CustVO detail(int custNum) {
		return this.custMapper.detail(custNum);
	}

	@Override
	public int registPost(CustVO custVO) {
		return this.custMapper.registPost(custVO);
	}

	@Override
	public int editPost(CustVO custVO) {
		return this.custMapper.editPost(custVO);
	}

	@Override
	public int deletePost(int custNum) {
		return this.custMapper.deletePost(custNum);
	}

}
