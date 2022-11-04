package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardMapper {
	
	public List<FreeBoardDTO> getAllList();
	
	public FreeBoardDTO getByfreeBoardNum(int num);
	
	// 게시물 등록
	public void insertfreeBoard(FreeBoardDTO FBoard);
	
	public int deleteByfreeBoardNum(int freeBoardNum);
	
	public int updateByfreeBoardNum(FreeBoardDTO FBoard);
	
}
