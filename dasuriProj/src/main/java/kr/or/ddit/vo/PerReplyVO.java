package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PerReplyVO {
	private int repNo;
	private int serNum;
	private String repContent;
	private String repWriter;
	private String repMail;
	private String repPass;
	private Date repDate;
	private int repParent;
	
	private String nm;
}
