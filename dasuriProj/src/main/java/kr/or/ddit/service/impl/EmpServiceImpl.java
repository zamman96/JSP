package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.EmpMapper;
import kr.or.ddit.service.EmpService;
import kr.or.ddit.vo.EmpVO;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	EmpMapper empMapper;
	
	@Override
	public List<EmpVO> list(Map<String, Object> map) {
		return this.empMapper.list(map);
	}

	@Override
	public int getListTotal(Map<String, Object> map) {
		return this.empMapper.getListTotal(map);
	}

	@Override
	public EmpVO detail(int empNum) {
		return this.empMapper.detail(empNum);
	}

	@Override
	public int registPost(EmpVO empVO) {
		return this.empMapper.registPost(empVO);
	}

	@Override
	public int editPost(EmpVO empVO) {
		return this.empMapper.editPost(empVO);
	}

	@Override
	public int deletePost(int empNum) {
		return this.empMapper.deletePost(empNum);
	}

}
