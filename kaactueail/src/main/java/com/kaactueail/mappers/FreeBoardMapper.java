package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardMapper {
	
	public List<FreeBoardDTO> getAllList();
	
	public FreeBoardDTO getByfreeBoardNum(int num);
	
	public void freeBoardinsert(FreeBoardDTO FBoard);
	
	public int deleteByfreeBoardNum(int freeBoardNum);
	
	public int updateByfreeBoardNum(FreeBoardDTO FBoard);
	
}
