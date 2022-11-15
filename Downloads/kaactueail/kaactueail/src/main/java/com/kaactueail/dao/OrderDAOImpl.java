package com.kaactueail.dao;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.MyCocktailBoardDTO;
import com.kaactueail.dto.OrderDTO;
import com.kaactueail.dto.OrderItemDTO;
import com.kaactueail.dto.PurchaseHistoryDTO;
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
		for (OrderItemDTO oid : order) {

			mapper.getItemInfo(oid.getCNum());
			OrderItemDTO iteminfo = mapper.getItemInfo(oid.getCNum()); // 移듯궎�듃 踰덊샇 湲곗��쑝濡� �긽�뭹 議고쉶�븯硫� 二쇰Ц 由ъ뒪�듃�뿉 ���옣
			iteminfo.setAMount(oid.getAMount()); // view�뿉�꽌 �쟾�떖諛쏆� amount 媛� ���엯
			iteminfo.Total(); // �긽�뭹媛�寃�*�긽�뭹媛쒖닔 媛� 怨꾩궛
			result.add(iteminfo); // �긽�뭹�젙蹂� �꽭�똿�빐�꽌 由ъ뒪�듃�뿉 ���옣
		}
		System.out.println("result : " + result);
		return result;
	}

	// �럹�씠吏��뿉�꽌 援щℓ �떆
	@Override
	public void payMent() {
		List<OrderItemDTO> orderItem = new ArrayList<OrderItemDTO>();
		orderItem = mapper.getOrderList();
		System.out.println("this is payMent");
		for (OrderItemDTO oid : orderItem) {
			// 二쇰Ц�뿉 �뱾�뼱媛� 二쇰Ц 紐⑸줉�쓽 臾쇳뭹 �븯�굹�떦 援щℓ�궡�뿭�쑝濡� 異붽�
			mapper.pushToPurchaseHistory(oid);
			// 援щℓ�궡�뿭�쑝濡� 異붽��맂 �썑�뿉 �옣諛붽뎄�땲�뿉�꽌 �궘�젣
			mapper.popFromBucketlist(oid);
			mapper.deleteOrder();
			mapper.removeCAmount(oid);
			System.out.println("popfrombucketlist");
		}

	}

	@Override
	public void pushToOrders(List<OrderItemDTO> order) {
		System.out.println("Push to Orders : " + order);
		for (OrderItemDTO oid : order) {
			// 二쇰Ц�뿉 �뱾�뼱媛� 二쇰Ц 紐⑸줉�쓽 臾쇳뭹 �븯�굹�떦 二쇰Ц�궡�뿭�뿉 異붽�
			mapper.pushToOrders(oid);
			System.out.println("pushtorders");
		}
	}

	@Override
	public List<OrderItemDTO> getOrderDetail() {
		System.out.println("getorderdetail");
		return mapper.getOrderList();
	}

	@Override
	public List<PurchaseHistoryDTO> getPurchaseHistory(Integer mNum) {
		return mapper.getPurchaseHistory(mNum);
	}

}
