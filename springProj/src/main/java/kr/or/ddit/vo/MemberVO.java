package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memId;
	private String memPass;
	private String memName;
	private String memRegno1;
	private String memRegno2;
	private Date memBir;
	private String memBirStr;
	private String memZip;
	private String memAdd1;
	private String memAdd2;
	private String memHometel;
	private String memComtel;
	private String memHp;
	private String memMail;
	private String memJob;
	private String memLike;
	private String memMemorial;
	private Date memMemorialday;
	private int memMileage;
	private String memDelete;
}
