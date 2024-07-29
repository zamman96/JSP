package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.JdbcBoardVO;

@Repository
public class JdbcBoardDao {
	@Autowired
	SqlSessionTemplate sst;

	public int createPost(JdbcBoardVO bvo) {
		return this.sst.insert("board.createPost", bvo);
	}

	public JdbcBoardVO detail(JdbcBoardVO bvo) {
		return this.sst.selectOne("board.detail", bvo);
	}

	public List<JdbcBoardVO> list(Map<String, Object> map) {
		return this.sst.selectList("board.list", map);
	}

	public int cntChange(JdbcBoardVO bvo) {
		return this.sst.update("board.cnt", bvo);
	}

	public int update(JdbcBoardVO bvo) {
		return this.sst.update("board.update", bvo);
	}

	public int delete(JdbcBoardVO bvo) {
		return this.sst.delete("board.delete", bvo);
	}

	public int getTotal(Map<String, Object> map) {
		return this.sst.selectOne("board.getTotal", map);
	}

}
