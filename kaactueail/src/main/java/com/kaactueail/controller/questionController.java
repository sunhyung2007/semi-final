package com.kaactueail.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaactueail.dao.AnswerDAO;
import com.kaactueail.dao.QuestionDAO;
import com.kaactueail.dto.AnswerDTO;
import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.PageDTO;
import com.kaactueail.dto.QuestionDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/question")
public class questionController {
	
	@Autowired
	private QuestionDAO dao;
	
	@Autowired
	private AnswerDAO answerdao;
	
	@GetMapping("list")
	public void GetListPaging(Model model, Criteria cri) {
		model.addAttribute("answer", answerdao.getAnswer());
		model.addAttribute("list", dao.getListPaging(cri));
		
		int total = dao.getTotal();
		PageDTO page = new PageDTO(cri, total);
		
		
		model.addAttribute("paging", page);
	}
	
	@GetMapping("write")
	public void Getwrite() {
		
	}
	
	@PostMapping("write")
	public String Postwrite(QuestionDTO dto, HttpSession session) {
		String mId = (String)session.getAttribute("mId");
		int mNum = (Integer)session.getAttribute("mNum");
		dto.setQuestionMemberNum(mNum);
		dto.setQuestionWriter(mId);
		dao.write(dto);
		return "redirect:/question/list";
	}
	
	@GetMapping("detail")
	public void Getdetail(int questionNum, Model model, Criteria cri, HttpSession session) {
		String mRole = (String)session.getAttribute("mRole");
		
		model.addAttribute("pagedetail", dao.getByquestionNum(questionNum));
		model.addAttribute("answer", answerdao.getByQuestionNum(questionNum));
		model.addAttribute("cri", cri);
		System.out.println(cri);
	}
	
	@GetMapping("answer")
	public String Getanswer(AnswerDTO answer) {
		
		
		answerdao.write(answer);
		return "redirect:/question/list";
	}

}
