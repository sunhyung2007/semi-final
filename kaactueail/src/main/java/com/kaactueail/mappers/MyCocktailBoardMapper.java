package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.MyCocktailBoardDTO;

public interface MyCocktailBoardMapper {
	
	public List<MyCocktailBoardDTO> getAllMycocktailboardList();
	
	public MyCocktailBoardDTO getBymycocktailNum(int mycocktailNum);
	
	public void insert(MyCocktailBoardDTO mycocktaildto);
	
	public int deleteBymycocktailNum(int mycocktailNum);
	
	public int updateBymycocktailNum(MyCocktailBoardDTO mycocktaildto);
	
}
