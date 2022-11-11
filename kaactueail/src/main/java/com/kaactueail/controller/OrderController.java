package com.kaactueail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaactueail.dao.OrderDAO;
import com.kaactueail.dto.OrderDTO;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderDAO dao;
	
	@GetMapping("list")
	public String GetOrder(OrderDTO order, Model model) {
		
		System.out.println("order:"+order.getOrder());
				
		model.addAttribute("orderlist", dao.getItemInfo(order.getOrder()));
		
		return "/order/list";
		 
	}

}
