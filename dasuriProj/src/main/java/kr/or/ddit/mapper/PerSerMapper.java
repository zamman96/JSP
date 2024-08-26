package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PerReplyVO;
import kr.or.ddit.vo.PerSerVO;

@Mapper
public interface PerSerMapper {

	public List<PerSerVO> list(Map<String, Object> map);

	public int getListTotal(Map<String,Object> map);

	public PerSerVO detail(int serNum);

	public int registPost(PerSerVO perSerVO);

	public int editPost(PerSerVO perSerVO);

	public int deletePost(int serNum);

	public int registReplyPost(PerReplyVO perReplyVO);

	public List<PerReplyVO> replyList(int serNum);
}
