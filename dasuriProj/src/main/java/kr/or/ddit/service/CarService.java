package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CarVO;

public interface CarService {
	
	/**
	 * 자동차 목록 리스트 출력
	 * @param 페이징, 검색 조건
	 * @return 자동차 Car List
	 */
	public List<CarVO> list(Map<String, Object> map);
	
	/**
	 * 자동차 목록 전체 갯수
	 * @param 검색 조건
	 * @return 페이지 전체 갯수
	 */
	public int getListTotal(Map<String,Object> map);
	
	/**
	 * 자동차 상세 내역
	 * @param carNum
	 * @return 자동차 car리스트
	 */
	public CarVO detail(String carNum);

	/**
	 * 자동차 새로 등록하는 메서드
	 * @param carVO 자동차 정보 전체
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int registPost(CarVO carVO);
	
	/**
	 * 자동차 정보 변경
	 * @param carVO 자동차 변경할 정보
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int editPost(CarVO carVO);
	
	/**
	 * 직업 정보 삭제
	 * @param carNum
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int deletePost(String carNum);
}
