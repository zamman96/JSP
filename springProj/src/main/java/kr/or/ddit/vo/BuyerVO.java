package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class BuyerVO {
	private String buyerId  ;
	private String buyerName;
	private String buyerLgu ;
	private String buyerBank;
	private String buyerBankno;
	private String buyerBankname;
	private String buyerZip    ;
	private String buyerAdd1   ;
	private String buyerAdd2   ;
	private String buyerComtel ;
	private String buyerFax    ;
	private String buyerMail   ;
	private String buyerCharger;
	private String buyerTelext ;
	
	// 거래처 : 상품 = 1 : N
	// resultMap으로 설정
	private List<ProdVO> prodVoList;
}                                 
