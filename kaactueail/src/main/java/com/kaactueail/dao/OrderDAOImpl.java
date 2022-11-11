package com.kaactueail.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		for(OrderItemDTO oid : order) {
			
			mapper.getItemInfo(oid.getCNum());
			OrderItemDTO iteminfo = mapper.getItemInfo(oid.getCNum()); // 칵키트 번호 기준으로 상품 조회하며 주문 리스트에 저장
			iteminfo.setBucketlistAmount(oid.getBucketlistAmount()); // view에서 전달받은 amount 값 대입
			iteminfo.Total(); // 상품가격*상품개수 값 계산
			
			result.add(iteminfo); // 상품정보 세팅해서 리스트에 저장
		}
		return result;
	}

}
