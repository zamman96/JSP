package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class JdbcBoardVO {
	private int rnum;
	private int boardNo; 			// 번호
	private String boardTitle;		// 제목
	private String boardWriter;	// 작성자
	private Date boardDate;		// 작성일
	private int boardCnt;			// 조회수
	private String boardContent;	// 내용
}                               
