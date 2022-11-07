package com.kaactueail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/join")
public class joinController {
	
	@GetMapping("list")
	public void getjoin() {
		log.info("회원가입 페이지 진입");
		
	}

}
