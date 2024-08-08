package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

// 자바 빈 클래스
@Data
public class TblUserVO {
	private String userId;
	private String password;
	private String name;
	private String email;
	private String bir;
	private String zipcode;
	private String addr;
	private String addrdet;
	private String[] hobby; // hobby = [music, game]
	private String hobbyStr; // hobby = music,game
	private String[] cars;
	
	private List<CardVO> cardVoList;
	
	private List<TblHobbyVO> hobbyVoList;

	private List<CarsVO> carsVoList;
}
