package com.kaactueail.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kaactueail.dto.MyCocktailBoardDTO;
import com.kaactueail.dto.OrderDTO;
import com.kaactueail.dto.OrderItemDTO;
import com.kaactueail.dto.PurchaseHistoryDTO;

public interface OrderDAO {
	
	public List<OrderItemDTO> getItemInfo(List<OrderItemDTO> order);

	public void payMent();

	
	public void pushToOrders(List<OrderItemDTO> order);
	 
	public List<OrderItemDTO> getOrderDetail();

	public List<PurchaseHistoryDTO> getPurchaseHistory(Integer mNum);


}
