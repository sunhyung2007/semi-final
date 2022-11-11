package com.kaactueail.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kaactueail.dao.MemberDAO;
import com.kaactueail.dto.MemberDTO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserController {
	
	@Autowired
	MemberDAO dao;
	
	@PostMapping("updateminfo")
	public void updateMemberInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		String mPwd = request.getParameter("mPwd");
		String mId = (String)session.getAttribute("mId");
		
		MemberDTO dto = new MemberDTO();
		dto.setMId(mId);
		dto.setMPwd(mPwd);
		
		dao.updateminfo(dto);
		
		response.sendRedirect("updateminfo");
	}
	@GetMapping("updateminfo")
	public String successupdate() {
		return "user/successupdate";
	}
}
