package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CarVO;

@Mapper
public interface CarMapper {

	public List<CarVO> list(Map<String, Object> map);

	public int getListTotal(Map<String,Object> map);

	public CarVO detail(String carNum);

	public int registPost(CarVO carVO);

	public int editPost(CarVO carVO);

	public int deletePost(String carNum);
}
