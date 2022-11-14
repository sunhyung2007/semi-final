package com.kaactueail.mappers;

import com.kaactueail.dto.OrderItemDTO;

public interface OrderMapper {
	
	// 주문 아이템 정보
	public OrderItemDTO getItemInfo(int cNum);

}
