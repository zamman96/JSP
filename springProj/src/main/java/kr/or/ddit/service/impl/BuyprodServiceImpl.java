package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.BuyprodDao;
import kr.or.ddit.service.BuyprodService;
import kr.or.ddit.vo.BuyprodVO;

@Service
public class BuyprodServiceImpl implements BuyprodService{

	@Autowired
	BuyprodDao dao;
	
	@Override
	public List<BuyprodVO> list(Map<String, Object> map) {
		return this.dao.list(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.dao.getTotal(map);
	}

	@Override
	public int getDetailTotal(Map<String, Object> map) {
		return this.dao.getDetailTotal(map);
	}

	@Override
	public List<BuyprodVO> detail(Map<String, Object> map) {
		return this.dao.detail(map);
	}

	@Override
	public BuyprodVO detailAjax(BuyprodVO vo) {
		return this.dao.detailAjax(vo) ;
	}

}
