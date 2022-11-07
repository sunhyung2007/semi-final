package com.kaactueail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaactueail.dao.FreeBoardDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/freeboard")
public class freeBoardController {
	
	//private FreeBoardDAO dao;
	
	@GetMapping("list")
	public void list() {//Model model) {
		
		log.info("Freeboard List 페이지 진입");
		
		//model.addAttribute("list", dao.getAllList());
		
	}

}
