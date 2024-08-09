package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProdVO {        
	private int rnum;
	private String prodId;
	// message는 내가 지정하고 싶은 오류 메세지
	// 기본값 : 반드시 값이 존재하고 공백 문자를 제외한 길이가 0보다 커야 합니다.
	@NotBlank(message = "상품명은 필수 입력 항목입니다.")
	private String prodName;
	private String prodLgu;
	private String prodBuyer;
	private int prodCost;
	private int prodPrice;
	@NotNull(message = "판매가는 필수 입력 항목입니다.")
	private int prodSale;
	private String prodOu;
	private String prodDetail;
	private String prodImg;
	private int prodTotalstock;
	//String 타입인 "2024-08-09" -> Date타입으로 변환
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date prodInsdate; // 최근 입고일자
	private String prodOutline;
	private int prodProperstock;
	private String prodSize;
	private String prodColor;
	private String prodDelivery;
	private String prodUnit;
	private int prodQtyin;
	private int prodQtysale;
	private int prodMileage;
	private long fileGroupNo;
	private String prodDelYn; 
	
	private MultipartFile[] uploadFile;
	
	private List<CartVO> cartVoList;
	private FileGroupVO fgvo;
}
