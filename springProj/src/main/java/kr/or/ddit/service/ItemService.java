package kr.or.ddit.service;

import kr.or.ddit.vo.MemberVO;

public interface ItemService {

	public int registerPost2(MemberVO memberVO);

	public MemberVO getMemberFile(MemberVO memberVO);
}
