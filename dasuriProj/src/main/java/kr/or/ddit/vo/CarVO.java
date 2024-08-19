package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class CarVO {
	private String carNum;
	private String mfr;
	private int myr;
	private int drvDst;
	private int custNum;
	
	private List<PerSerVO> perSerVOList;
}
