package com.kaactueail.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BucketDTO {
	
	private int bucketlistNum, bucketlistAmount, bucketlistMemberNum, bucketlistCockitNum;
	
	// 칵키트 테이블 - 조인 위해서 필요
	private int cNum, cPrice;
	private String cName;
	
	
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
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
	


}
