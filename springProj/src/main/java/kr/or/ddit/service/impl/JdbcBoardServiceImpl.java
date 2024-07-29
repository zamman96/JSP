package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.JdbcBoardDao;
import kr.or.ddit.service.JdbcBoardService;
import kr.or.ddit.vo.JdbcBoardVO;

@Service
public class JdbcBoardServiceImpl implements JdbcBoardService {
	@Autowired
	JdbcBoardDao dao;
	
	@Override
	public List<JdbcBoardVO> list(Map<String, Object> map) {
		return this.dao.list(map);
	}

	@Override
	public JdbcBoardVO detail(JdbcBoardVO bvo) {
		return this.dao.detail(bvo);
	}

	@Override
	public int createPost(JdbcBoardVO bvo) {
		return this.dao.createPost(bvo);
	}

	@Override
	public int cntChange(JdbcBoardVO bvo) {
		return this.dao.cntChange(bvo);
	}

	@Override
	public int update(JdbcBoardVO bvo) {
		return this.dao.update(bvo);
	}

	@Override
	public int delete(JdbcBoardVO bvo) {
		return this.dao.delete(bvo);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.dao.getTotal(map);
	}

}
