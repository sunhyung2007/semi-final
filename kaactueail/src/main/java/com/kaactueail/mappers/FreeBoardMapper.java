package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardMapper {
	
	public List<FreeBoardDTO> getAllList();
	
	public FreeBoardDTO getByFB_num(int num);
	
	public void insert(FreeBoardDTO FBoard);
	
	public int deleteByFBnum(int FB_num);
	
	public int updateByFBnum(FreeBoardDTO FBoard);
	
}
