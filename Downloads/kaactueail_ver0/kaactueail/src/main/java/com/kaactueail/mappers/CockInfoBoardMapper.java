package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.CockInfoBoardDTO;

public interface CockInfoBoardMapper {
	// 칵테일 정보 목록 보기
	public List<CockInfoBoardDTO> selectAll();
	
	// 칵테일 정보 등록
	public void write(CockInfoBoardDTO board);
	
	// 게시판 목록(페이징 적용)
	public List<CockInfoBoardDTO> getListPaging();
	
	public int getTotal();	
	
	// 칵테일 정보 상세 보기
	public CockInfoBoardDTO getDetail(int infoBoardNum);

}
