package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.CarMapper;
import kr.or.ddit.service.CarService;
import kr.or.ddit.vo.CarVO;

@Service
public class CarServiceImpl implements CarService{

	@Autowired
	CarMapper carMapper;
	
	@Override
	public List<CarVO> list(Map<String, Object> map) {
		return this.carMapper.list(map);
	}

	@Override
	public int getListTotal(Map<String, Object> map) {
		return this.carMapper.getListTotal(map);
	}

	@Override
	public CarVO detail(String carNum) {
		return this.carMapper.detail(carNum);
	}

	@Override
	public int registPost(CarVO carVO) {
		return this.carMapper.registPost(carVO);
	}

	@Override
	public int editPost(CarVO carVO) {
		return this.carMapper.editPost(carVO);
	}

	@Override
	public int deletePost(String carNum) {
		return this.carMapper.deletePost(carNum);
	}

}
