package com.kaactueail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mycocktailboard")
public class mycocktailboardController {
	
	@GetMapping("list")
	public void getmycocktailboard() {
		log.info("나만의칵테일 페이지 진입");
		
	}


}
