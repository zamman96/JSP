package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PerSerVO {
	private int empNum;
	private int custNum;
	private String carNum;
	private int amt;
	private int perTme;
	private int serNum;
	private String perDet;
	private long fileGroupNo; 
	
	private String nm;
	private String custNm;
	
	//이미지 파일객체(multiple)
   //<input type="file"name="uploadFile".. 
   private MultipartFile[] uploadFile;
}
