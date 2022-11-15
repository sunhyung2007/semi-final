package com.kaactueail.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kaactueail.dto.LikeDTO;
import com.kaactueail.dto.MyCocktailBoardDTO;

public interface MyCocktailBoardMapper {

	public List<MyCocktailBoardDTO> getAllMycocktailboardList();

	public MyCocktailBoardDTO getBymycocktailNum(int mycocktailNum);

	public void updatelikenum();

	// 게시글 쓰기
	public void write(MyCocktailBoardDTO mycocktaildto);

	public int deleteBymycocktailNum(int mycocktailNum);

	public int updateBymycocktailNum(MyCocktailBoardDTO mycocktaildto);

	public int findLike(LikeDTO like);

	public void makeolike(LikeDTO like);

	public void makeunlike(LikeDTO like);
	
	public List<MyCocktailBoardDTO> mainSelect();

}