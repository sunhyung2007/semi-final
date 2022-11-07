package com.kaactueail.dao;

import java.util.List;
import com.kaactueail.dto.MyCocktailBoardDTO;

public interface MyCocktailBoardDAO {
	// 전체 게시판 글 조회
	public List<MyCocktailBoardDTO> getAllMycocktailboardList();
	// 상세 게시판 조회(게시판 번호 받아 정보 반환)
	public MyCocktailBoardDTO getBymycockNum(int mycockNum);
	
	public boolean modifyMycocktailboard(MyCocktailBoardDTO mycocktaildto);
	
	public boolean removeMycocktailboard(int mycockNum);
	


}
