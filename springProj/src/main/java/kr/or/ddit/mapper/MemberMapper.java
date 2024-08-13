package kr.or.ddit.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MemberVO;

@Mapper
public interface MemberMapper {
	public int updateMember(MemberVO memVo);
	
	public MemberVO getMemberFile(MemberVO memVo);
	
	public MemberVO detail(String memId);
}
