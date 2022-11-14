package com.kaactueail.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDTO {
	
	private List<OrderItemDTO> order;
	private int OrderMemberNum;
	
//	public void setOrder(List<OrderDTO> orderList) {
//		// TODO Auto-generated method stub
//	}
//	public void setOneOrder(List<String>oneorderList) {
//		
//	}

}
