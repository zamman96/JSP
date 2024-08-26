package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CustVO;

public interface CustService {
	
	/**
	 * 고객 목록 리스트 출력
	 * @param 페이징, 검색 조건
	 * @return 고객 Cust List
	 */
	public List<CustVO> list(Map<String, Object> map);
	
	/**
	 * 고객 목록 전체 갯수
	 * @param 검색 조건
	 * @return 페이지 전체 갯수
	 */
	public int getListTotal(Map<String,Object> map);
	
	/**
	 * 고객 상세 내역
	 * @param custNum
	 * @return 고객 cust리스트
	 */
	public CustVO detail(int custNum);

	/**
	 * 고객 새로 등록하는 메서드
	 * @param custVO 고객 정보 전체
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int registPost(CustVO custVO);
	
	/**
	 * 고객 정보 변경
	 * @param custVO 고객 변경할 정보
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int editPost(CustVO custVO);
	
	/**
	 * 직업 정보 삭제
	 * @param custNum
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int deletePost(int custNum);
}
