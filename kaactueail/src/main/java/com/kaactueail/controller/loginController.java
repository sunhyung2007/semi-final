package com.kaactueail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/login")
public class loginController {
	
	@GetMapping("list")
	public void getlogin() {
		log.info("로그인 페이지 진입");
		
	}

}
