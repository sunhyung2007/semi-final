package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.LikeDTO;
import com.kaactueail.dto.MyCocktailBoardDTO;

public interface MyCocktailBoardDAO {
	// 전체 게시판 글 조회
	public List<MyCocktailBoardDTO> getAllMycocktailboardList();

	// 게시판 좋아요 업데이트
	public void updatelikenum();

	// 상세 게시판 조회(게시판 번호 받아 정보 반환)
	public MyCocktailBoardDTO getBymycocktailNum(int mycockNum);

	public boolean modifyMycocktailboard(MyCocktailBoardDTO mycocktaildto);

	public boolean removeMycocktailboard(int mycockNum);

	// 게시글 쓰기
	public void write(MyCocktailBoardDTO mycocktaildto);

	public int findLike(LikeDTO like);

	public void makeolike(LikeDTO like);

	public void makeunlike(LikeDTO like);
	
	public List<MyCocktailBoardDTO> mainSelect();

}