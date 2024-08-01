package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

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

}
