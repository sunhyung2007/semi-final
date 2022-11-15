
package com.kaactueail.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaactueail.dao.OrderDAO;
import com.kaactueail.dto.OrderDTO;
import com.kaactueail.dto.OrderItemDTO;

@Controller

@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderDAO dao;

	@GetMapping("list")
	public String GetOrder(OrderDTO order, Model model, HttpSession session) {

		System.out.println("this is list get order");
		System.out.println("order : " + order.getOrder());
		order.setOrder(dao.getOrderDetail());
		
		order.setOrderMemberNum((Integer) session.getAttribute("mNum"));
		
		
		
		/* dao.pushToOrders(order); */
		/* model.addAttribute("orderlist", dao.getItemInfo(order.getOrder())); */
		model.addAttribute("orderDetail", dao.getOrderDetail());
		model.addAttribute("member", session.getAttribute("mId"));
		
		return "/order/list";
	}

	@GetMapping("makeOrder")
	public String GetOrderBucket(OrderDTO order, Model model, HttpSession session) {

		System.out.println("this is list make order");
		System.out.println("order : " + order.getOrder());
		List<OrderItemDTO> result = new ArrayList<OrderItemDTO>();
		for(OrderItemDTO oid : order.getOrder())
			result.add(oid);
		
		System.out.println("result : " + result);
		
		dao.pushToOrders(result);
		
		order.setOrderMemberNum((Integer) session.getAttribute("mNum"));
		
		
		
		/* dao.pushToOrders(order); */
		/* model.addAttribute("orderlist", dao.getItemInfo(order.getOrder())); */
		model.addAttribute("orderDetail", dao.getOrderDetail());
		model.addAttribute("member", session.getAttribute("mId"));
		
		return "/order/list";
	}
	
	/*
	 * @RequestMapping(value = "/payment", method = { RequestMethod.POST ,
	 * RequestMethod.GET})
	 * 
	 * @ResponseBody public Map<Integer, Object> payMent(@RequestParam
	 * Map<Integer,List<OrderItemDTO>> OrderItemDTO,
	 * 
	 * @RequestParam(value = "OrderMemberNum") int mNum, HttpSession session) {
	 * OrderDTO order = new OrderDTO(); // order.setOrder(OrderItemDTO);
	 * System.out.println(OrderItemDTO.values());
	 * order.setOrder(OrderItemDTO.get(mNum)); order.setOrderMemberNum((Integer)
	 * session.getAttribute("mNum")); System.out.println("order = " + order);
	 * dao.payMent(order); System.out.println("hi"); return payMent(null, 0, null);
	 * }
	 */

	@GetMapping("payment")
	public void payMent(Model model, HttpSession session) {
		
		model.addAttribute("orderDetail", dao.getOrderDetail());
		//dao.payMent(order);
	}

	
	@GetMapping("paymentFinish")
	public void paymentFinish(Model model, HttpSession session) {
		System.out.println("paymentfinish");
		dao.payMent();
		model.addAttribute("orderDetail", dao.getOrderDetail());
	}
	
	
	
	@GetMapping("purchaseHistory")
	public void getPurchaseHistory(Model model,HttpSession session) {
		System.out.println("purchasehistory");
		model.addAttribute("purchaseHistory", dao.getPurchaseHistory((Integer) session.getAttribute("mNum")));
		
	}

}
