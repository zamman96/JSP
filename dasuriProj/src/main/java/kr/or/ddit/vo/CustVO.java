package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class CustVO {
	private int custNum;
	private String custNm;
	private String addr;
	private String pne;
	private String pnum;
	private String detAddr;
	
	private List<CarVO> carVOList;
	
	private List<PerSerVO> perSerVOList;
}
