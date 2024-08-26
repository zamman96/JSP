package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.PerReplyVO;
import kr.or.ddit.vo.PerSerVO;

public interface PerSerService {
	
	/**
	 * 수리 내역 목록 리스트 출력
	 * @param 페이징, 검색 조건
	 * @return 수리 내역 PerSer List
	 */
	public List<PerSerVO> list(Map<String, Object> map);
	
	/**
	 * 수리 내역 목록 전체 갯수
	 * @param 검색 조건
	 * @return 페이지 전체 갯수
	 */
	public int getListTotal(Map<String,Object> map);
	
	/**
	 * 수리 내역 상세 내역
	 * @param serNum
	 * @return 수리 내역 perSer리스트
	 */
	public PerSerVO detail(int serNum);

	/**
	 * 수리 내역 새로 등록하는 메서드
	 * @param perSerVO 수리 내역 정보 전체
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int registPost(PerSerVO perSerVO);
	
	/**
	 * 수리 내역 정보 변경
	 * @param perSerVO 수리 내역 변경할 정보
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int editPost(PerSerVO perSerVO);
	
	/**
	 * 직업 정보 삭제
	 * @param serNum
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int deletePost(int serNum);

	public int registReplyPost(PerReplyVO perReplyVO);

	public List<PerReplyVO> replyList(int serNum);
}
