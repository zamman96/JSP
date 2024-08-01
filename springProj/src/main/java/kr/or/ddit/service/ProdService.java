package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

public interface ProdService{

	public List<ProdVO> list(Map<String, Object> map);

	public int getTotal();

	public List<ProdVO> cartlist(ProdVO vo);

	public MemberVO memDetail(MemberVO vo);

}
