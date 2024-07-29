package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.LprodVO;
@Repository
public class LprodDao {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public int createPost(LprodVO lvo) {
		return this.sst.insert("lprod.createPost", lvo);
	}

	public List<LprodVO> list(Map<String, Object> map) {
		return this.sst.selectList("lprod.list", map);
	}

	public LprodVO detail(LprodVO vo) {
		return this.sst.selectOne("lprod.detail", vo);
	}

	public int update(LprodVO vo) {
		return this.sst.update("lprod.update", vo);
	}

	public int delete(LprodVO vo) {
		return this.sst.delete("lprod.delete", vo);
	}

	public int getTotal(Map<String, Object> map) {
		return this.sst.selectOne("lprod.getTotal", map);
	}

}