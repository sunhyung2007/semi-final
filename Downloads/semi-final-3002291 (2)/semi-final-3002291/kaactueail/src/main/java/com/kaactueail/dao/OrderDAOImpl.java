package com.kaactueail.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.OrderDTO;
import com.kaactueail.dto.OrderItemDTO;
import com.kaactueail.mappers.OrderMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	private OrderMapper mapper;

	@Override
	public List<OrderItemDTO> getItemInfo(List<OrderItemDTO> order) {
		
		List<OrderItemDTO> result = new ArrayList<OrderItemDTO>();
		
		for(OrderItemDTO oid : order){
			
			mapper.getItemInfo(oid.getCNum());
			OrderItemDTO iteminfo = mapper.getItemInfo(oid.getCNum()); // 칵키트 번호 기준으로 상품 조회하며 주문 리스트에 저장
			iteminfo.setAMount(oid.getAMount()); // view에서 전달받은 amount 값 대입
			iteminfo.Total(); // 상품가격*상품개수 값 계산
			
			result.add(iteminfo); // 상품정보 세팅해서 리스트에 저장
		}
		return result;
	}
	   @Override
	   public void payMent() {
	      List<OrderItemDTO> orderItem = new ArrayList<OrderItemDTO>();
	      orderItem = mapper.getOrderList();
	      for (OrderItemDTO oid : orderItem) {
	         // 주문에 들어간 주문 목록의 물품 하나당 구매내역으로 추가
	         mapper.pushToPurchaseHistory(oid);
	         // 구매내역으로 추가된 후에 장바구니에서 삭제
	         mapper.popFromBucketlist(oid);
	         mapper.deleteOrder();
	         System.out.println("popfrombucketlist");
	      }
	   }


	   @Override
	   public void pushToOrders(OrderDTO order) {
	      System.out.println("Push to Orders : " + order);
	      for (OrderItemDTO oid : order.getOrder()) {
	         // 주문에 들어간 주문 목록의 물품 하나당 주문내역에 추가
	         mapper.pushToOrders(oid);

	         System.out.println("pushtorders");
	      }
	   }


	   @Override
	   public List<OrderItemDTO> getOrderDetail() {
	      return mapper.getOrderList();
	   }

}
