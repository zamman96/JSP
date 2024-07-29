package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BookVO;

public interface BookService {

	public int createPost(BookVO vo);
	
	public List<BookVO> list(Map<String, Object> map);

	public List<Map<String, Object>> getCategories();
	
	public BookVO detail(BookVO vo);

	public int update(BookVO vo);

	public int delete(BookVO vo);

	public int getTotal(Map<String, Object> map);
}
