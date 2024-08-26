package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.EmpVO;

@Mapper
public interface EmpMapper {

	/**
	 * 직원 목록 리스트 출력
	 * @param 페이징, 검색 조건
	 * @return 직원 Emp List
	 */
	public List<EmpVO> list(Map<String, Object> map);
	
	/**
	 * 직원 목록 전체 갯수
	 * @param 검색 조건
	 * @return 페이지 전체 갯수
	 */
	public int getListTotal(Map<String,Object> map);
	
	/**
	 * 직원 상세 내역
	 * @param empNum
	 * @return 직원 emp리스트
	 */
	public EmpVO detail(int empNum);

	/**
	 * 직원 새로 등록하는 메서드
	 * @param empVO 직원 정보 전체
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int registPost(EmpVO empVO);
	
	/**
	 * 직원 정보 변경
	 * @param empVO 직원 변경할 정보
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int editPost(EmpVO empVO);
	
	/**
	 * 직업 정보 삭제
	 * @param empNum
	 * @return 작업성공 : 1, 실패 : 0
	 */
	public int deletePost(int empNum);

	public EmpVO getLogin(String username);
}
