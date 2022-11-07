package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardMapper {
	// 그냥 게시판 목록
	public List<FreeBoardDTO> getAllList();
	
	// 게시판 목록(페이징 처리 된) - pageNun, amount정보 db에 전달 위해 criteria 파라미터 부여
	public List<FreeBoardDTO> getListPaing(Criteria cri);
	
	// 게시글 조회(게시글 번호로)
	public FreeBoardDTO getByfreeboardNum(int num);
	
	// 게시글 쓰기
	public void insertfreeBoard(FreeBoardDTO FBoard);
	
	// 게시글 삭제
	public int deleteByfreeboardNum(int freeboardNum);
	
	// 게시글 수정
	public int updateByfreeboardNum(FreeBoardDTO FBoard);
	
	// 게시판 총 개수 - 페이징처리
	public int getTotal();
	
	// 게시판 조회 수
	public int updateReadcount(int freeboardNum);
}
