package com.kaactueail.controller;

import org.springframework.stereotype.Controller;

import com.kaactueail.dao.MemberDAO;

@Controller
public class signupcheckController {
	
	public int duplicateCheckMNum() {
		
		int m_num = (int) (Math.random() * 89999999 + 10000000);  //10000000번부터 값이 들어감
		
		MemberDAO dao = new MemberDAO();
		int result = dao.selectmNum(m_num);
		if(result != 0) {
			return m_num;
		}
		else {
			duplicateCheckMNum();
			return 0;
		}
	}
}