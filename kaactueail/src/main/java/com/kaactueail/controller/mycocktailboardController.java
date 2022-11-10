package com.kaactueail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaactueail.dao.MyCocktailBoardDAO;
import com.kaactueail.dto.LikeDTO;
import com.kaactueail.dto.MyCocktailBoardDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/mycocktailboard")
public class mycocktailboardController {

	@Autowired
	private MyCocktailBoardDAO dao;
	
	@GetMapping("list")
	public void Getlist(Model model, HttpServletRequest request, HttpSession session) {
		dao.updatelikenum();
		model.addAttribute("mycocktailboardlist", dao.getAllMycocktailboardList());
		String url = request.getRequestURL().toString();
		session.setAttribute("url", url);
	}

	@GetMapping("detail")
	public void Getdetail(int mycocktailNum, Model model, HttpSession session, HttpServletRequest request) {
		String url = request.getRequestURL().toString();
		session.setAttribute("url", url);
		System.out.println(session.getAttribute("url"));
		model.addAttribute("pageDetail", dao.getBymycockNum(mycocktailNum));
		LikeDTO like = new LikeDTO();
		like.setLikeboardMyCocktailNum(mycocktailNum);
		if(session.getAttribute("mNum")==(null))
			like.setLikeboardMemberNum(0);
		else
			like.setLikeboardMemberNum((Integer)session.getAttribute("mNum"));
		System.out.println(like);
		model.addAttribute("like", dao.findLike(like));
		model.addAttribute("member", like.getLikeboardMemberNum());
	}

	@RequestMapping(value = "/makeolike", method = { RequestMethod.POST })
	@ResponseBody
	public void makeolike(LikeDTO dto) throws Exception {

		System.out.println(dto.getLikeboardNum());
		System.out.println(dto.getLikeboardMyCocktailNum());
		System.out.println(dto.getLikeboardMemberNum());
		dao.makeolike(dto);

	}

	@RequestMapping(value = "/makeunlike", method = { RequestMethod.POST })
	@ResponseBody
	public void makeunlike(LikeDTO dto) throws Exception {
		dao.makeunlike(dto);
	}

	@GetMapping("write")
	public void Getwirte(HttpSession session, Model model) {
		int mNum;
		if(session.getAttribute("mNum")==(null))
			mNum = 0;
		else
			mNum = (Integer)session.getAttribute("mNum");
		model.addAttribute("member", mNum);
	}

	@PostMapping("write")
	public String Postwrite(MyCocktailBoardDTO dto) {
		System.out.println(dto);
		dao.write(dto);
		System.out.println(dto);
		return "redirect:/mycocktailboard/mycocktailboardlist";
	}
}
