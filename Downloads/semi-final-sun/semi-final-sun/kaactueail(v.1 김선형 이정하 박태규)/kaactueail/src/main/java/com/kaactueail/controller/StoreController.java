package com.kaactueail.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kaactueail.dao.StoreDAO;
import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.PageMakerDTO;
import com.kaactueail.dto.StoreDTO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/store/*")
public class StoreController {
	private static final Logger log = LoggerFactory.getLogger(StoreController.class);
	
	@Autowired
	private StoreDAO dao;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("Store List 페이지 진입");
		log.info("cri : " + cri);
		
		model.addAttribute("list", dao.selectAll(cri));
		
		int total = dao.getTotal();
		
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);		
		
	}
	
	@GetMapping("get")
	public void getDetail(int cNum, Model model, Criteria cri) {
		log.info("/get");
		System.out.println(cNum);
//		dao.updateReadcount(cNum);
		model.addAttribute("pageInfo", dao.getDetail(cNum));
		model.addAttribute("cri", cri);
	}
	@PostMapping("cart")
	public String cartPost(@RequestParam("bucketlistAmount") int bucketlistAmount ,StoreDTO dto, HttpSession session, Model model) {
		System.out.println("장바구니 담기 POST 진입");
//		System.out.println(session.getAttribute("mNum"));
		System.out.println(dto.getselectAmt());
		int mNum = (int)session.getAttribute("mNum");
		System.out.println("로그인한 회원번호는 " + mNum);
		dto.setMNum(mNum);
		//model.addAttribute("mId", mId);
		//dao.selectMemeberId(mId);
		dao.addCart(dto);
		return "cart/list";
	}
	  
	@PostMapping("payment")
	public String paymentPost(StoreDTO dto, HttpSession session, Model model) {
		log.info("GetCart 페이지 진입");		
		
		model.addAttribute("mNum", session.getAttribute("mNum"));
		dao.payment(dto);
		
		return "redirect:/payment";
	}
	
	
	
}
