package com.kaactueail.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaactueail.dao.FreeBoardDAO;
import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.FreeBoardDTO;
import com.kaactueail.dto.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/freeboard")
public class freeBoardController {
	
	@Autowired
	private FreeBoardDAO dao;
	
	// 게시판 리스트 출력 - 페이징 처리
	@GetMapping("list")
	public void GetlistPaging(Model model, Criteria cri, HttpSession session) {
		String mRole = (String)session.getAttribute("mRole");
		
		model.addAttribute("list", dao.getListPaging(cri));
		int total = dao.getTotal();
		PageDTO page = new PageDTO(cri, total);
		
		System.out.println(cri);
		
		model.addAttribute("paging", page);
		
	}
	
	
	// 글쓰기 진입 - get 방식으로 들어올시
	@GetMapping("write")
	public void Getwirte() {
		
	}
	
	// post방식(글 작성 후 글쓰기 버튼 클릭)으로 오면 리스트로 리다이렉트
	@PostMapping("write")
	public String Postwrite(FreeBoardDTO dto, HttpSession session) {
		String mId = (String)session.getAttribute("mId");
		int mNum = (Integer)session.getAttribute("mNum");
		dto.setFreeboardMemberNum(mNum);
		dto.setFreeboardWriter(mId);
		
		dao.write(dto);
		return "redirect:/freeboard/list";
	}
	
	
	// 게시판 클릭 시 해당 게시글 상세 페이지 출력
	@GetMapping("detail")
	public void Getdetail(int freeboardNum, Model model, HttpSession session, Criteria cri) {
		String mRole = (String)session.getAttribute("mRole");
		String mId = (String)session.getAttribute("mId");
		
		System.out.println(cri);
		model.addAttribute("cri", cri);
		
		dao.updateReadcount(freeboardNum);
		model.addAttribute("pageDetail", dao.getByfreeboardNum(freeboardNum));
	}
	
	// 수정 페이지로 이동하며 상세 페이지처럼 데이터 가지고 옴
	@GetMapping("modify")
	public void Getmodify(int freeboardNum, Model model) {
		
		model.addAttribute("pagemodify", dao.getByfreeboardNum(freeboardNum));
	}
	
	
	// post방식(글 수정 후 수정버튼 클릭)으로 오면
	@PostMapping("modify")
	public String Postmodify(FreeBoardDTO dto) {
		
		dao.modify(dto);
		return "redirect:/freeboard/list";
	}
	
	
	// 삭제버튼 클릭시
	@PostMapping("delete")
	public String Postdelete(int freeboardNum) {
		dao.remove(freeboardNum);
		
		System.out.println(freeboardNum);
		return "redirect:/freeboard/list";
	}
}
