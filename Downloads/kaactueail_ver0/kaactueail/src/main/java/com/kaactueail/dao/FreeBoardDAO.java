   package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardDAO {
	
	public FreeBoardDTO getByFB_num(int FB_num);
	
	public boolean modify(FreeBoardDTO FBoard);
	
	public boolean remove(int FB_num);
	
	public List<FreeBoardDTO> getAllList();

}
