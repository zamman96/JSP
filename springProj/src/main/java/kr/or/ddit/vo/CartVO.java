package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CartVO {
	private String cartProd;
	private int cartQty;
	private String cartMember;
	private String cartNo;
	
	private MemberVO memVo;
}
