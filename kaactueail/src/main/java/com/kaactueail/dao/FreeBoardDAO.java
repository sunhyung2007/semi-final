package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardDAO {
	
	public List<FreeBoardDTO> getAllList();
	
	public FreeBoardDTO getByfreeboardNum(int freeboardNum);
	
	public boolean modify(FreeBoardDTO FBoard);
	
	public boolean remove(int freeboardNum);
	
	public void write(FreeBoardDTO FBboard);
	


}
