package com.kaactueail.web;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.kaactueail.controller.ShaEncoder;
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
	}
	

	
	
	
	//회원가입
	public void insertMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		signupcheckController check = new signupcheckController(); // 회원번호 중복확인 후 중복되지 않을 때까지 값을 얻어 값 가져오기
		
//		ShaEncoder encoder = new ShaEncoder();
		
		int m_num = check.duplicateCheckMNum();
		
		String m_id = request.getParameter("m_id");
//		String m_pwdpara = request.getParameter("m_pwd");
//		String m_pwd = encoder.saltEncoding(m_pwdpara);
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
	
	public void authenticationMember(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		
		System.out.println("login m_id 확인: " + m_id);
		System.out.println("login m_pwd 확인: " + m_pwd);
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(m_id, m_pwd);  //회원 id와 pwd를 세팅
		
		boolean check = dao.checkMember(dto);
		
		//고쳐야함
		if(check == true) {
			System.out.println("로그인 제대로 됨");
			response.sendRedirect("/web/loginSuccess"); // 테스트용
		} else {
			System.out.println("로그인 실패");
			response.sendRedirect("/from");  
		}
	}
	
}
