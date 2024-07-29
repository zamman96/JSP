package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BookVO;

@Repository
public class BookDao {

	@Autowired
	SqlSessionTemplate sst;
	
	//book_SQL.xml 파일의 namespace가 book이고, id가 insert인
    //태그를 찾아 그 안에 들어있는 sql을 실행함
    //bookVO=>{"bookId":"","title":"총알탄 개똥이","category":"소설","price":10000,"insertDate":""}
    //insert,update,delete는 반영된 건수가 return됨
    //insert성공 : 1이상, 실패면 0
	public int createPost(BookVO vo) {
		return this.sst.insert("book.createPost", vo);
	}

	// 도서 목록
	public List<BookVO> list(Map<String, Object> map){
		return this.sst.selectList("book.list",map);
	}
	
	// 카테고리 목록
	//<select id="getCategories" resultType="hashMap">
	public List<Map<String,Object>> getCategories(){
		return this.sst.selectList("book.getCategories");
	}

	public BookVO detail(BookVO vo) {
		return this.sst.selectOne("book.detail", vo);
	}

	public int delete(BookVO vo) {
		return this.sst.delete("book.delete", vo);
	}

	public int update(BookVO vo) {
		return this.sst.update("book.update", vo);
	}

	public int getTotal(Map<String, Object> map) {
		return this.sst.selectOne("book.getTotal", map);
	}

}
