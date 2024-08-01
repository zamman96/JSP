package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.ProdDao;
import kr.or.ddit.service.ProdService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

@Service
public class ProdServiceImpl implements ProdService{

	@Autowired
	ProdDao dao;
	
	@Override
	public List<ProdVO> list(Map<String,Object> map) {
		return this.dao.list(map);
	}

	@Override
	public int getTotal() {
		return this.dao.getTotal();
	}

	@Override
	public List<ProdVO> cartlist(ProdVO vo) {
		return this.dao.cartlist(vo);
	}

	@Override
	public MemberVO memDetail(MemberVO vo) {
		return this.dao.memDetail(vo);
	}

}
