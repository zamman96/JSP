package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.CarsVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.TblHobbyVO;
import kr.or.ddit.vo.TblUserVO;

@Mapper
public interface ProdMapper {

	public List<ProdVO> prodList(Map<String, Object> map);

	public int prodListTotal();

	public List<ProdVO> cartlist(ProdVO vo);

	public MemberVO memDetail(MemberVO vo);

	public int insertTblUser(TblUserVO vo);

	public int insertCard(CardVO v);

	public int insertHobby(TblHobbyVO hvo);
	
	public int insertCars(List<CarsVO> carsVoList);

	public List<LprodVO> lprodList();

	public List<BuyerVO> buyerList(BuyerVO bvo);

	public String createProdId(ProdVO vo);

	public int registPost(ProdVO vo);
	
	public BuyerVO detail(ProdVO vo);

	public int updatePost(ProdVO prodVo);

	public int delete(String prodId);
	
	public ProdVO fileInfo(ProdVO pvo);
}
