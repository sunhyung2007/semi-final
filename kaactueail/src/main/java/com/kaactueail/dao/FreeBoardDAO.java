package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.FreeBoardDTO;

public interface FreeBoardDAO {
	
	// 게시판 목록
	public List<FreeBoardDTO> getAllList();
	
	// 게시판 목록 페이징
	public List<FreeBoardDTO> getListPaging(Criteria cri);
	
	// 게시글 조회(게시글번호로)
	public FreeBoardDTO getByfreeboardNum(int freeboardNum);
	
	// 게시글 수정
	public boolean modify(FreeBoardDTO FBoard);
	
	// 게시글 삭제
	public boolean remove(int freeboardNum);
	
	// 게시글 쓰기
	public void write(FreeBoardDTO FBboard);
	
	// 게시판 총 개수 - 페이징처리
	public int getTotal();
	


}
