package com.kaactueail.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderItemDTO {
	
	// 이전 페이지에서 넘겨 받을 값
	private int cnum, amount;
	
	// DB에서 꺼내 올 값 
	private String cname;
	private int cprice;
	
	private int totalPrice;
	
	
	public void Total() {
		 this.totalPrice = this.cprice * this.amount;
	}
}
