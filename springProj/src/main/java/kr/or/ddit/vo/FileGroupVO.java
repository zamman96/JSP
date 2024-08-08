package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FileGroupVO {
	private long fileGroupNo;
	private Date fileRegdate;
	private List<FileDetailVO> fileDetailVoList;
}
