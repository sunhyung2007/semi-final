package com.kaactueail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		OrderItemDTO dto = new OrderItemDTO();
		dto.setORderMemberNum((Integer)session.getAttribute("mNum"));
		
		System.out.println("order:"+order.getOrder());
				
		model.addAttribute("orderlist", dao.getItemInfo(order.getOrder()));

		dao.insertOrder(order.getOrder());
		
		return "/order/list";
		 
	}
	
	

	@PostMapping("list")
	public void PostOrder(OrderDTO order, Model model, HttpServletRequest request) {		
		String cNum = request.getParameter("cNum");
		String bucketlistAmount = request.getParameter("bucketlistAmount");
		int tprice = Integer.parseInt(request.getParameter("tprice"));
//		List<String> list = new ArrayList<String>();
//		list.add(cNum);
//		list.add(bucketlistAmount);
//		list.add(Integer.toString(tprice));
//		List<OrderDTO>orderList = new ArrayList<OrderDTO>();
//		orderList.add((OrderDTO) list);
//		dto.setOrder(orderList);
//		
//		System.out.println(order);
//		System.out.println("get으로 이동");
//		dto = order;
//		staticModel = model;
//		GetOrder(dto, staticModel);
	}	

}
