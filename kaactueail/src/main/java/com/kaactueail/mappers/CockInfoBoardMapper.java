package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.CockInfoBoardDTO;
import com.kaactueail.dto.Criteria;


public interface CockInfoBoardMapper {
	// 칵테일 정보 목록 보기
	public List<CockInfoBoardDTO> selectAll(Criteria cri);
	
	//칵테일 제목 중복 체크
	public int selectTitle(String infoboradTitle);
	
	// 칵테일 정보 등록
	public void write(CockInfoBoardDTO board);
	
	// 게시판 목록(페이징 적용)
//	/public List<CockInfoBoardDTO> getListPaging(Criteria cri);
	
	public int getTotal();	
	
	// 칵테일 정보 상세 보기
	public CockInfoBoardDTO getDetail(int infoboardNum);
	
//	// 게시글 조회(게시글번호로)
//	public CockInfoBoardDTO getByinfoboardNum(int infoboardNum);
	
//	// 게시글 수정
//	public boolean modify(CockInfoBoardDTO dto);
	
	// 게시글 조회수
	public int updateReadcount(int infoboardNum);
	
	// 게시글 삭제
	public int deleteByinfoboardNum(int infoboardNum);
	
	// 게시글 수정
	public int updateByinfoboardNum(CockInfoBoardDTO dto);
}