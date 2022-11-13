package com.kaactueail.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kaactueail.dao.MemberDAO;
import com.kaactueail.dto.MemberDTO;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
public class SignUpController extends HttpServlet{
	
	@Autowired
	MemberDAO dao;
	
	
	
	//회원가입
	@PostMapping("signup")
	public void insertMember(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int mNum = 0, result = 0;
		
		//회원번호 중첩되지 않게 중복되면 다시 돌리기
		while(true) {
		mNum = (int) (Math.random() * 89999999 + 10000000);  //10000000번부터 값이 들어감
		
		result = dao.selectmNum(mNum);
		if(result != 0) break;  
		}
		
		//생년월일 구하기 ( 10보다 작으면 앞에 0 붙이기)
		String years = request.getParameter("years");
		String month =request.getParameter("month");
		String	day = request.getParameter("day");
		if(Integer.parseInt(month) < 10)
			month = "0" + month;
		if(Integer.parseInt(day) < 10) 
			day = "0" + day;
		
		//현재 연도 구하기
		LocalDate now = LocalDate.now();
		int nowGetYear = now.getYear();
		
		//권한 부여 ( 19살 미만이면 비회원처럼 주기 )
		String mRole = "";
		if((nowGetYear - Integer.parseInt(years)) > 19)
			mRole = "ROLE_USER";
		else mRole = "ROLE_NOTUSER";
		
		String mId = request.getParameter("mId");
		String mPwd = request.getParameter("mPwd");
		System.out.println(mPwd);
		String mName = request.getParameter("mName");
		String mBirth = years + month + day;
		String mTel = request.getParameter("mTel");
		
		MemberDTO dto = new MemberDTO(mNum,mId, mPwd, mName, mBirth, mTel, mRole); // 회원 정보들 세팅
		
		int rowcount = dao.insertmember(dto);
		

		if(rowcount > 0) {
			System.out.println("회원가입 제대로 됨");
			response.sendRedirect("/loginform");
		}
		else {
			System.out.println("회원가입 에러");
			response.sendRedirect("error");
		}
	}
	
	//로그인
	@PostMapping("login")
	public void authenticationMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String mId = request.getParameter("mId");
		String mPwd = request.getParameter("mPwd");
		
		
		MemberDTO dto = new MemberDTO(mId,mPwd);
		boolean check = dao.checkMember(dto);
		
		//로그인이 되면
		if(check == true) {
			HttpSession session;
			String mRole = dao.memberRole(mId);
			int mNum = dao.memberNum(mId); 
			session = request.getSession();
			System.out.println(dto);
			
			//로그인 세션값 설정
			session.setAttribute("mId", mId);
			session.setAttribute("mRole", mRole);
			session.setAttribute("mNum", mNum);
			System.out.println("login mId 확인: " + session.getAttribute("mId"));
			System.out.println("login mRole 확인: " +  session.getAttribute("mRole"));
			System.out.println("login mNum 확인: " +  session.getAttribute("mNum"));
			//세션 유지시간 설정(초단위) 20분
			session.setMaxInactiveInterval(20*60);
			
			response.sendRedirect("/main");
		} else {
			System.out.println("실패");
			response.sendRedirect("/Ioginform");
		}
	}
	
	//로그아웃
	@GetMapping("logout")
	public void sessionOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session;
		session = request.getSession();
		session.invalidate();
		response.sendRedirect("/main");
	}
	
	
	
	//아이디 찾기
	@PostMapping("findid") 
	public String findId(HttpServletRequest request,HttpServletResponse response, Model model) throws IOException {
		
		String mName = request.getParameter("mName");
		String mTel = request.getParameter("mTel");
		mTel = "010-" +
					mTel.charAt(3) + mTel.charAt(4) + mTel.charAt(5) + mTel.charAt(6) + "-"
					+ mTel.charAt(7) + mTel.charAt(8) + mTel.charAt(9) + mTel.charAt(10);
	
		MemberDTO dto = new MemberDTO();
		dto.setMName(mName);
		dto.setMTel(mTel);
		
		String result = dao.findmyId(dto);
		if(result == null) return "error/findiderror";
		else {
			model.addAttribute("mId",result);
			
			return "find/successfindid";
		}
	}
	
	//비밀번호 찾기
	@PostMapping("findpwd")
	public String findpwd(HttpServletRequest request, HttpServletResponse response, Model model) {
		String mName = request.getParameter("mName");
		String mTel = request.getParameter("mTel");
		String mId = request.getParameter("mId");
		mTel = "010-" +
				mTel.charAt(3) + mTel.charAt(4) + mTel.charAt(5) + mTel.charAt(6) + "-"
				+ mTel.charAt(7) + mTel.charAt(8) + mTel.charAt(9) + mTel.charAt(10);
		MemberDTO dto = new MemberDTO();
		
		dto.setMName(mName);
		dto.setMTel(mTel);
		dto.setMId(mId);
		
		int result = dao.findmypwd(dto);
		
		//맞으면 임시키 발급
		if(result == 1) {
			int random = (int)(Math.random() * 89999) + 10000;
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("mName", dto.getMName());
			map.put("mId", dto.getMId());
			map.put("mTel", dto.getMTel());
			map.put("random", "kata" + Integer.toString(random));
			System.out.println(map);
			dao.tkIssued(map);
			
			model.addAttribute("tkkey", map.get("random"));
			
			return "find/successfindpwd";
		}
		else 
		return "error/errorfindpwd";
	}
	
}
