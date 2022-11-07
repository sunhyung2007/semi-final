package com.kaactueail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaactueail.dao.MyCocktailBoardDAO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mycocktailboard")
public class mycocktailboardController {
	
	@Autowired
	private MyCocktailBoardDAO dao;
	@GetMapping("mycocktailboardlist")
	public void Getlist(Model model) {
		model.addAttribute("mycocktailboardlist", dao.getAllMycocktailboardList());
	}

	@GetMapping("detail")
	public void Getdetail(int mycocktailNum, Model model) {
		
		model.addAttribute("pageDetail", dao.getBymycockNum(mycocktailNum));
	}
}
