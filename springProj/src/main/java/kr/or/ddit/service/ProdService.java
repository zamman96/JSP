package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.TblUserVO;

public interface ProdService{

	public List<ProdVO> list(Map<String, Object> map);

	public int getTotal();

	public List<ProdVO> cartlist(ProdVO vo);

	public MemberVO memDetail(MemberVO vo);

	public int cardFormPost(TblUserVO vo);

	public List<LprodVO> lprodList();

	public List<BuyerVO> buyerList(BuyerVO bvo);

	public String createProdId(ProdVO vo);

	public int registPost(ProdVO vo);

	public BuyerVO detail(ProdVO prodVo);
}
