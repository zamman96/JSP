package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProdVO {        
	private int rnum;
	private String prodId;
	private String prodName;
	private String prodLgu;
	private String prodBuyer;
	private int prodCost;
	private int prodPrice;
	private int prodSale;
	private String prodOu;
	private String prodDetail;
	private String prodImg;
	private int prodTotalstock;
	private Date prodInsdate;
	private String prodOutline;
	private int prodProperstock;
	private String prodSize;
	private String prodColor;
	private String prodDelivery;
	private String prodUnit;
	private int prodQtyin;
	private int prodQtysale;
	private int prodMileage;
	
	private List<CartVO> cartVoList;
}
