package com.kaactueail.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyCocktailBoardDTO {
	//게시판 번호
	private int mycocktailNum;
	// 게시판 타이틀
	private String mycocktailTitle, mycocktailContent, mycocktailRecipe;
	private Date mycocktailDate;
	private String mycocktailWriter;
	private int mycocktailReadcount, mycocktailMemberNum;
	private String mycocktailImgName;
	
	
}
