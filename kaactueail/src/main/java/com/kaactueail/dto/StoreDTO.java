package com.kaactueail.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class StoreDTO {
	private int cNum, cAmount;
	private String bucketlistAmount;
	private String cName, cTitle, cContent, cRecipe, cPrice;
	private int mNum;
	
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcPrice() {
		return cPrice;
	}
	public void setcPrice(String cPrice) {
		this.cPrice = cPrice;
	}
	public int getcAmount() {
		return cAmount;
	}
	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
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
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcRecipe() {
		return cRecipe;
	}
	public void setcRecipe(String cRecipe) {
		this.cRecipe = cRecipe;
	}
	
	public String getselectAmt() {
		return bucketlistAmount;
	}
	public void setselectAmt(String bucketlistAmount) {
		this.bucketlistAmount = bucketlistAmount;
	}
	public int getmId() {
		return mNum;
	}
	public void setmId(int mNum) {
		this.mNum = mNum;
	} 
	
}
