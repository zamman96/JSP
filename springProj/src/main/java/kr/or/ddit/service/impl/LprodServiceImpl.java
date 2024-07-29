package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.LprodDao;
import kr.or.ddit.service.LprodService;
import kr.or.ddit.vo.LprodVO;

@Service
public class LprodServiceImpl implements LprodService {

	@Autowired
	LprodDao dao;
	
	@Override
	public int createPost(LprodVO lvo) {
		return this.dao.createPost(lvo);
	}

	@Override
	public List<LprodVO> list(Map<String, Object> map) {
		return this.dao.list(map);
	}

	@Override
	public LprodVO detail(LprodVO vo) {
		return this.dao.detail(vo);
	}

	@Override
	public int update(LprodVO vo) {
		return this.dao.update(vo);
	}

	@Override
	public int delete(LprodVO vo) {
		return this.dao.delete(vo);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.dao.getTotal(map);
	}

}