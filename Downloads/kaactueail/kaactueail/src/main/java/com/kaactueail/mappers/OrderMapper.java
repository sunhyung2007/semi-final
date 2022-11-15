package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.OrderItemDTO;
import com.kaactueail.dto.PurchaseHistoryDTO;

public interface OrderMapper {
	
	// 주문 아이템 정보
	public OrderItemDTO getItemInfo(int cNum);

	public void pushToPurchaseHistory(OrderItemDTO oid);

	public void popFromBucketlist(OrderItemDTO oid);

	
	 public void pushToOrders(OrderItemDTO oid);
	 
	public List<OrderItemDTO> getOrderList();

	public void deleteOrder();

	public void removeCAmount(OrderItemDTO oid);

	public List<PurchaseHistoryDTO> getPurchaseHistory(Integer mNum);

}
