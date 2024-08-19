package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class EmpVO {
	private int empNum;
	private String nm;
	private String addr;
	private String pne;
	private int sal;
	private String pnum;
	private String detAddr;
	
	private List<PerSerVO> PerSerVOList;
}
