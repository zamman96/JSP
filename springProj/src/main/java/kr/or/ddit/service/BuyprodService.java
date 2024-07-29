package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyprodVO;

public interface BuyprodService {

	public List<BuyprodVO> list(Map<String, Object> map);

	public int getTotal(Map<String, Object> map);

}
