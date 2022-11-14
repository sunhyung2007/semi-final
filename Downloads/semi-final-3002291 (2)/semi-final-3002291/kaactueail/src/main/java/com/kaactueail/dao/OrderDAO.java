package com.kaactueail.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kaactueail.dto.OrderDTO;
import com.kaactueail.dto.OrderItemDTO;

public interface OrderDAO {
	
	public List<OrderItemDTO> getItemInfo(List<OrderItemDTO> order);
	
	public void payMent();

	public void pushToOrders(OrderDTO order);

	public List<OrderItemDTO> getOrderDetail();

}
