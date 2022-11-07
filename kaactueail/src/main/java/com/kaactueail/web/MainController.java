package com.kaactueail.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {
	
	@RequestMapping(value = "/main", method=RequestMethod.GET)
	public void mainPage() {
		log.info("메인페이지 진입");
	}

}
