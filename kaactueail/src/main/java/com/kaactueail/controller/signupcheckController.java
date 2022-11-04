package com.kaactueail.controller;

import org.springframework.stereotype.Controller;

import com.kaactueail.dao.MemberDAO;

@Controller
public class signupcheckController {
	
	public int duplicateCheckMNum() {
		
		int mNum = (int) (Math.random() * 89999999 + 10000000);  //10000000번부터 값이 들어감
		
		MemberDAO dao = new MemberDAO();
		int result = dao.selectmNum(mNum);
		if(result != 0) {
			return mNum;
		}
		else {
			duplicateCheckMNum();
			return 0;
		}
	}
}