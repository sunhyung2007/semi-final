package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardDAO {
	// 전체 게시판 글 조회
	public List<FreeBoardDTO> getAllList();
	
	public FreeBoardDTO getByfreeBoardNum(int freeBoardNum);
	
	public boolean modify(FreeBoardDTO FBoard);
	
	public boolean remove(int FB_num);
	
	public void write(FreeBoardDTO FBboard);
	


}
