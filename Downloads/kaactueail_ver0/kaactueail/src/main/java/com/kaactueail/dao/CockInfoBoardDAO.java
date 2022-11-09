package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.CockInfoBoardDTO;
import com.kaactueail.dto.Criteria;

public interface CockInfoBoardDAO {
	// 칵테일 정보 목록
	public List<CockInfoBoardDTO> selectAll(Criteria cri);
	
	// 게시판 목록(페이징 적용)
	//public List<CockInfoBoardDTO> getListPaging();
	
//	public List<CockInfoBoardDTO> detailList();
	public int getTotal();	
	
	// 칵테일 정보 세부조회
	public CockInfoBoardDTO getDetail(int infoboardNum)throws Exception;
	
	// 칵테일 정보 등록
	public void write(CockInfoBoardDTO board);
	
	// 게시글 조회(게시글번호로)
	public CockInfoBoardDTO getByinfoboardNum(int infoboardNum);
	
	// 게시글 수정
	public boolean modify(CockInfoBoardDTO dto);
	
	// 게시글 조회수
	public int updateReadcount(int infoboardNum);
}
