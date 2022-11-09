package com.kaactueail.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaactueail.dao.MemberDAO;
import com.kaactueail.dto.MemberDTO;

@Controller
public class formController {

	//@Inject
	@Autowired
	MemberDAO Dao;
	
	
	private int authNumber = 0;
	
	
	public void setAuthNumber(int authNumber) {
		this.authNumber = authNumber;
	}
	public int getAuthNumber() {
		return authNumber;
	}
	
//	@Autowired
//	MemberDTO dto;
	
	//아이디 중복체크
	@RequestMapping(value = "/checkid", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int idCheck(String mId) {
		if(mId == null || mId == "")
			return -1;
		else
		return Dao.checkId(mId);
	}
	
	//권한에 따라서 보는 페이지 바뀜
	@RequestMapping("/main")
	public String mainPage(HttpSession session) {
		try {
		if(session.getAttribute("mRole").equals("ROLE_ADMIN")) return "admin/main";
		else if(session.getAttribute("mRole").equals("ROLE_USER")) return "user/main";
		else return "sign/no";
		}
		catch (Exception e){
			return "error";
		}
	}
	
	
	@RequestMapping("/signupform")
	public String signupForm() {
		return "sign/signupform";
	}
	
	@RequestMapping("/loginform")
	public String loginForm() {
		return "sign/loginform";
	}
	@RequestMapping("/Ioginform")
	public String IoginForm(Model model) {
		model.addAttribute("Message", "<font size = '3px' color = 'red'>아이디 혹은 비밀번호가 잘못입력되었습니다.</font><br/> ");
		model.addAttribute("css", "border-color:red");
		return "sign/loginform";
	}
	
	
	//아이디/비밀번호찾기 선택지 폼
	@RequestMapping("/findform")
	public String findForm() throws IOException {
		return "sign/findform";
	}
	
	//아이디 찾기 폼
	@RequestMapping("/findidform")
	public String findidForm() throws IOException {
		return "sign/findidform";
	}
	@RequestMapping("/findpwdform")
	public String findpwdForm() {
		return "sign/findpwdform";
	}
	
	//6자리 인증코드 발송
	@RequestMapping(value = "sendMessage" , method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody void send(HttpServletRequest request) {
	
		int randomNumber = (int)(Math.random() * 899999) + 100000;
		setAuthNumber(randomNumber);
		System.out.println(getAuthNumber());
		MessageService ms = new MessageService();
		ms.sendMessage(request, Integer.toString(randomNumber));
	}
	//인증코드가 맞는지 확인
			@RequestMapping(value = "/checkMessage", method = {RequestMethod.GET, RequestMethod.POST})
			public @ResponseBody int checkMessage(HttpServletRequest request) {
				int result = 0;
				
				String authNum = request.getParameter("authNum");
				
				System.out.println(getAuthNumber());

				if(authNum.equals(Integer.toString(getAuthNumber()))) {
					result = 1;
				}
				return result;
			}
			
			
					
	//에러페이지
	@RequestMapping("/error")
	public String errorPage() {
		return "error";
	}
	
	//아이디 에러페이지
	@RequestMapping("/findiderror")
	public String findiderrorPage() {
		return "error/findiderror";
	}
	
	@RequestMapping("/successfindid")
	public String find() {
		return "sign/successfindid";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "user/mypage";
	}
	
	
	@RequestMapping("/updatemyinfo")
	public String updatemyinfoform(HttpSession session, Model model) {
		MemberDTO dto = new MemberDTO();
		dto = Dao.selectMinfo((String) session.getAttribute("mId"));
		String mTel = "010-" + dto.getMTel().charAt(4)
								+ dto.getMTel().charAt(5) + "**-****";
		model.addAttribute("mId" , dto.getMId());
		model.addAttribute("mBirth",dto.getMBirth());
		model.addAttribute("mName",dto.getMName());
		model.addAttribute("mTel", mTel);
		return "user/updatemyinfoform";
	}
}
