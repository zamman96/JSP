package kr.or.ddit.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.FileDetailVO;
import kr.or.ddit.vo.FileGroupVO;

@Mapper
public interface FileGroupMapper {
	public int insertFileGroup(FileGroupVO fgvo);
	
	public int insertFileDetail(FileDetailVO fdvo);
	
	public int fileGroupDelete(FileGroupVO fgvo);
	
	public int fileDetailDelete(FileGroupVO fgvo);
}
