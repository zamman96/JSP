package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

public interface LprodService {

	public int createPost(LprodVO lvo);

	public List<LprodVO> list(Map<String, Object> map);

	public LprodVO detail(LprodVO vo);

	public int update(LprodVO vo);

	public int delete(LprodVO vo);

	public int getTotal(Map<String,Object> map);

	public List<BuyerVO> getProdList(ProdVO vo);

}