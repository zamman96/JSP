package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CustVO;

@Mapper
public interface CustMapper {

	public List<CustVO> list(Map<String, Object> map);

	public int getListTotal(Map<String,Object> map);

	public CustVO detail(int custNum);

	public int registPost(CustVO custVO);

	public int editPost(CustVO custVO);

	public int deletePost(int custNum);
}
