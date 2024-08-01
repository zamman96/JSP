package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BuyprodVO {
	private int rnum;
	private Date buyDate;
	private String buyDateStr;
	private String buyProd;
	private int buyQty;
	private int buyCost;
	private String prodName;

	private int year;
	private int buyDateMonth;
	private int amt;
}
