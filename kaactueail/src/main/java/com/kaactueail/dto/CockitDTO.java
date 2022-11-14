package com.kaactueail.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
   //이 파일에서만 lombok인식이 안됨
public class CockitDTO {
	private int cNum, cAmount, cPrice;
	private String cName, cTitle, cRecipe, cContent, cIngredient;
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public int getcAmount() {
		return cAmount;
	}
	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
	}
	public int getcPrice() {
		return cPrice;
	}
	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcTitle() {
		return cTitle;
	}
	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}
	public String getcRecipe() {
		return cRecipe;
	}
	public void setcRecipe(String cRecipe) {
		this.cRecipe = cRecipe;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcIngredient() {
		return cIngredient;
	}
	public void setcIngredient(String cIngredient) {
		this.cIngredient = cIngredient;
	}
	
	//cNumseq.nextval
	
	
}
