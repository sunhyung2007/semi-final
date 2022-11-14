package com.kaactueail.dao;

import java.util.HashMap;

import com.kaactueail.dto.MemberDTO;
//로그인 및 회원가입
public interface MemberDAO {
	

	// 회원가입
	public int insertmember(MemberDTO dto);

	// 회원번호 중복체크
	public int selectmNum(int mNum);

	// 로그인
	public boolean checkMember(MemberDTO dto);

	// 로그인한 사용자 권한 얻어오기
	public String memberRole(String mId);

	// 로그인한 사용자 번호 얻어오기
	public int memberNum(String mId);

	// 로그인 중복처리
	public int checkId(String mId);
	
	//아이디 찾기
	public String findmyId(MemberDTO dto);
	
	//비밀번호 찾기
	public int findmypwd(MemberDTO dto);
	
	//임시키 발급
	public void tkIssued(HashMap<String,Object> map);
	
	//로그인한 사용자 정보 얻어오기 (내정보수정)
	public MemberDTO selectMinfo(String mId);
	
	//사용자 비밀번호 수정
	public void updateminfo(MemberDTO dto);
}