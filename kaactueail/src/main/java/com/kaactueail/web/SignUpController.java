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
		
		System.out.println("여기는 왔따.");
		signupcheckController check = new signupcheckController(); // 회원번호 중복확인 후 중복되지 않을 때까지 값을 얻어 값 가져오기
		
		
		int m_num = check.duplicateCheckMNum();
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		System.out.println(m_pwd);
		String m_name = request.getParameter("m_name");
		String m_birth = request.getParameter("years")
				+ request.getParameter("month")  + request.getParameter("day");
		String m_tel = request.getParameter("m_tel");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(m_num,m_id, m_pwd, m_name, m_birth, m_tel); // 회원 정보들 세팅
		
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
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(m_id, m_pwd);  //회원 id와 pwd를 세팅
		
		boolean check = dao.checkMember(dto);
		
		//로그인이 되면
		if(check == true) {
			HttpSession session;
			String m_role = dao.memberRole(m_id);
			int m_num = dao.memberNum(m_id); 
			session = request.getSession();
			
			//로그인 세션값 설정
			session.setAttribute("m_id", m_id);
			session.setAttribute("m_role", m_role);
			session.setAttribute("m_num", m_num);
			System.out.println("login m_id 확인: " + session.getAttribute("m_id"));
			System.out.println("login m_pwd 확인: " +  session.getAttribute("m_role"));
			System.out.println("login m_num 확인: " +  session.getAttribute("m_num"));
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
