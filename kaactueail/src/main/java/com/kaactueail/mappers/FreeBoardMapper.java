package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardMapper {
	
	public List<FreeBoardDTO> getAllList();
	
	public FreeBoardDTO getByfreeboardNum(int num);
	
	public void insertfreeBoard(FreeBoardDTO FBoard);
	
	public int deleteByfreeboardNum(int freeboardNum);
	
	public int updateByfreeboardNum(FreeBoardDTO FBoard);
	
}
