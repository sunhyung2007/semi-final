package com.kaactueail.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaactueail.dao.MemberDAO;

@Controller
public class formController {
	

	
	@Inject
	MemberDAO Dao;
	
	//관리자 영역 페이지 (테스트용)
	@RequestMapping("/admin")
	public String admin() {
		return "admin/main";
	}
	
	
	//테스트용
	@RequestMapping("/loginSuccess")
	public String loginSuccess() {
		return "loginSuccess";
	} //테스트용
	
	
	@RequestMapping("/signupform")
	public String signupForm() {
		return "signupform";
	}
	
	@RequestMapping("/loginform")
	public String loginForm() {
		return "loginform";
	}
}
