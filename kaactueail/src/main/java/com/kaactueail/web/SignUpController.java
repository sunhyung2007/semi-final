package com.kaactueail.web;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaactueail.controller.signupcheckController;
import com.kaactueail.dao.MemberDAO;
import com.kaactueail.model.MemberDTO;


@WebServlet("/member")
public class SignUpController extends HttpServlet{
	

	
	public void service(HttpServletRequest request, 
												HttpServletResponse response)
														throws IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		if(cmd.equals("signup")) insertMember(request,response);
		else if(cmd.equals("login")) authenticationMember(request,response);
		else if(cmd.equals("logout")) sessionOut(request, response);
	}
	

	
	
	
	//회원가입
	public void insertMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		signupcheckController check = new signupcheckController(); // 회원번호 중복확인 후 중복되지 않을 때까지 값을 얻어 값 가져오기
		
		
		int mNum = check.duplicateCheckMNum();
		String mId = request.getParameter("mId");
		String mPwd = request.getParameter("mPwd");
		System.out.println(mPwd);
		String mName = request.getParameter("mName");
		String mBirth = request.getParameter("years")
				+ request.getParameter("month")  + request.getParameter("day");
		String mTel = request.getParameter("mTel");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(mNum,mId, mPwd, mName, mBirth, mTel); // 회원 정보들 세팅
		
		int rowcount = dao.insertmember(dto);
		
//	    System.out.println(rowcount);
		if(rowcount > 0) {
			System.out.println("회원가입 제대로 됨");
			response.sendRedirect("/web/loginform");
		}
		else {
			System.out.println("회원가입 에러");
			response.sendRedirect("error");
		}
	}
	
	//로그인
	public void authenticationMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String mId = request.getParameter("mId");
		String mPwd = request.getParameter("mPwd");
		
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(mId, mPwd);  //회원 id와 pwd를 세팅
		
		boolean check = dao.checkMember(dto);
		
		//로그인이 되면
		if(check == true) {
			HttpSession session;
			String mRole = dao.memberRole(mId);
			int mNum = dao.memberNum(mId); 
			session = request.getSession();
			
			//로그인 세션값 설정
			session.setAttribute("mId", mId);
			session.setAttribute("mRole", mRole);
			session.setAttribute("mNum", mNum);
			System.out.println("login mId 확인: " + session.getAttribute("mId"));
			System.out.println("login mRole 확인: " +  session.getAttribute("mRole"));
			System.out.println("login mNum 확인: " +  session.getAttribute("mNum"));
			//세션 유지시간 설정(초단위) 20분
			session.setMaxInactiveInterval(20*60);
			
			response.sendRedirect("/web/main");
		} else {
			response.sendRedirect("/web/member?cmd=login");
		}
	}
	
	//로그아웃
	public void sessionOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session;
		session = request.getSession();
		session.invalidate();
		response.sendRedirect("/web/loginform");
	}
}
