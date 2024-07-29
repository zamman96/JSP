package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.JdbcBoardVO;

public interface JdbcBoardService {
	public List<JdbcBoardVO> list(Map<String, Object> map);
	
	public JdbcBoardVO detail(JdbcBoardVO bvo);
	
	public int createPost(JdbcBoardVO bvo);
	
	public int cntChange(JdbcBoardVO bvo);

	public int update(JdbcBoardVO bvo);

	public int delete(JdbcBoardVO bvo);

	public int getTotal(Map<String, Object> map);
}
