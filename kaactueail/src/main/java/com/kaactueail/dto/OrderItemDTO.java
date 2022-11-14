package com.kaactueail.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderItemDTO {
	
	// 이전 페이지에서 넘겨 받을 값
	private int CNum, AMount;
	
	// DB에서 꺼내 올 값 
	private String CName;
	private int CPrice;
	private int ORderMemberNum;
	private int TOtalPrice;
	
	
	public void Total() {
		 this.TOtalPrice = this.CPrice * this.AMount;
	}
}
