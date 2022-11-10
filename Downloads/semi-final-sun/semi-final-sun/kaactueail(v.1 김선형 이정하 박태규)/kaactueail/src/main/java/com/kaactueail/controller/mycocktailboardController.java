package com.kaactueail.controller;

import java.util.HashMap;
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

import com.kaactueail.dao.MyCocktailBoardDAO;
import com.kaactueail.dto.FreeBoardDTO;
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
	public void Getlist(Model model) {
		dao.updatelikenum();
		model.addAttribute("mycocktailboardlist", dao.getAllMycocktailboardList());
	}

	@GetMapping("detail")
	public void Getdetail(int mycocktailNum, Model model, HttpSession session) {
		model.addAttribute("pageDetail", dao.getBymycockNum(mycocktailNum));

		LikeDTO like = new LikeDTO();
		like.setLikeboardMyCocktailNum(mycocktailNum);
		like.setLikeboardMemberNum((Integer)session.getAttribute("mNum"));
		System.out.println(like);
		model.addAttribute("like", dao.findLike(like));
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
	public void Getwirte() {
		System.out.println("this is getwrite controller");
	}

	@PostMapping("write")
	public String Postwrite(MyCocktailBoardDTO dto) {
		System.out.println(dto);
		dao.write(dto);
		System.out.println(dto);
		return "redirect:/mycocktailboard/mycocktailboardlist";
	}
}
