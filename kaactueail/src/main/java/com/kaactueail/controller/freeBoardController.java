package com.kaactueail.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
	private FreeBoardDAO dao;
	
	// 자유게시판 접속 시 게시판 전체 리스트 출력
	@GetMapping("list")
	public void Getlist(Model model) {
		
		model.addAttribute("list", dao.getAllList());
	}
	
	// 게시판 클릭 시 해당 게시글 상세 페이지 출력
	@GetMapping("detail")
	public void Getdetail(int FB_num, Model model) {
		
		model.addAttribute("pageDetail", dao.getByFB_num(FB_num));
	}
	


}
