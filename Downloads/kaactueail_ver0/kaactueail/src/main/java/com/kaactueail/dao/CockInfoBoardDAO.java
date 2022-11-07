package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.CockInfoBoardDTO;

public interface CockInfoBoardDAO {
	// 칵테일 정보 목록
	public List<CockInfoBoardDTO> selectAll();
	
	// 게시판 목록(페이징 적용)
	//public List<CockInfoBoardDTO> getListPaging();
	
//	public List<CockInfoBoardDTO> detailList();
	public int getTotal();	
	
	// 칵테일 정보 세부조회
	public CockInfoBoardDTO getDetail(int infoBoardNum)throws Exception;
	
	// 칵테일 정보 등록
	public void write(CockInfoBoardDTO board);
}
