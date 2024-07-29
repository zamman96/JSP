package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

//자바빈 클래스
//1) 멤버변수(프로퍼티) 2) 기본생성자 3) getter/setter메소드
// lombok -> POJO(Plain Oriented Java Object)가 약해짐
@Data
public class BookVO {  
	private int rnum;
	private int bookId;
	private String title;
	private String category;
	private int price;
	private Date insertDate;
}
