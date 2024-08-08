package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.CarsVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.TblHobbyVO;
import kr.or.ddit.vo.TblUserVO;

@Repository
public class ProdDao {

	@Autowired
	SqlSessionTemplate sst;
	
	public List<ProdVO> list(Map<String, Object> map) {
		return this.sst.selectList("prod.prodList", map);
	}

	public int getTotal() {
		return this.sst.selectOne("prod.prodListTotal");
	}

	public List<ProdVO> cartlist(ProdVO vo) {
		return this.sst.selectList("prod.cartlist", vo);
	}

	public MemberVO memDetail(MemberVO vo) {
		return this.sst.selectOne("prod.memDetail",vo);
	}

	public int insertTblUser(TblUserVO vo) {
		return this.sst.insert("prod.insertTblUser", vo);
	}

	public int insertCard(CardVO v) {
		return this.sst.insert("prod.insertCard", v);
	}

	public int insertHobby(TblHobbyVO hvo) {
		return this.sst.insert("prod.insertHobby", hvo);
	}
	
	public int insertCars(List<CarsVO> carsVoList) {
		return this.sst.insert("prod.insertCars", carsVoList);
	}

}
