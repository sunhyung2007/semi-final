package com.kaactueail.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaactueail.dao.MemberDAO;

@Controller
public class formController {
	

	
	@Inject
	MemberDAO Dao;
	
	@RequestMapping(value = "/checkid", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int idCheck(String m_id) {
		if(m_id == null || m_id == "")
			return -1;
		else
		return Dao.membercheck(m_id);
		
	}
	@RequestMapping("/main")
	public String mainPage(HttpSession session) {
		if(session.getAttribute("m_role").equals("ROLE_ADMIN")) return "admin/main";
		else if(session.getAttribute("m_role").equals("ROLE_USER")) return "main";
		else return "loginform";
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
	public String loginForm(HttpSession session) {
		return "loginform";
	}
}
