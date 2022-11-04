package com.kaactueail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaactueail.dao.FreeBoardDAO;
import com.kaactueail.dto.FreeBoardDTO;

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
	
	// 글쓰기 진입 - get 방식으로 들어올시
	@GetMapping("write")
	public void Getwirte() {
		
	}
	
	// 글쓰기 버튼 누르면 post 방식으로 데이터 숨겨서 리스트로 넘김
	@PostMapping("write")
	public String Postwrite(FreeBoardDTO dto) {
		
		dao.write(dto);
		return "redirect:/freeboard/list";
	}
	
	
	// 게시판 클릭 시 해당 게시글 상세 페이지 출력
	@GetMapping("detail")
	public void Getdetail(int freeBoardNum, Model model) {
		
		model.addAttribute("pageDetail", dao.getByfreeBoardNum(freeBoardNum));
	}
	
	// 수정 페이지로 이동하며 상세 페이지처럼 데이터 가지고 옴
	@GetMapping("modify")
	public void Getmodify(int freeBoardNum, Model model) {
		
		model.addAttribute("pageDetail", dao.getByfreeBoardNum(freeBoardNum));
	}


}
