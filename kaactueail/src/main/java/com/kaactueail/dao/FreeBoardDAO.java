package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardDAO {
	// 전체 게시판 글 조회
	public List<FreeBoardDTO> getAllList();
	// 상세 게시판 조회(게시판 번호 받아 정보 반환)
	public FreeBoardDTO getByFB_num(int FB_num);
	
	public boolean modify(FreeBoardDTO FBoard);
	
	public boolean remove(int FB_num);
	


}
