package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.OrderItemDTO;

public interface OrderMapper {
	
	// 주문 아이템 정보
	public OrderItemDTO getItemInfo(int cNum);
	
	public void insertOrder(List<OrderItemDTO> order);
	
	public void pushToPurchaseHistory(OrderItemDTO oid);

	public void popFromBucketlist(OrderItemDTO oid);

	public void pushToOrders(OrderItemDTO oid);

	public List<OrderItemDTO> getOrderList();

	public void deleteOrder();

}
