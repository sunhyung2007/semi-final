package com.kaactueail.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kaactueail.dto.MemberDTO;
import com.kaactueail.mappers.signmapper;

@Component
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private signmapper mapper;
	
	//회원가입
	public int insertmember(MemberDTO dto) {
		try {
			int result = mapper.insertmember(dto);
			return result;	
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//회원번호 중복체크
	public int selectmNum(int mNum) {
		try {
		int result = mapper.selectmNum(mNum); // 회원 번호가 중복됐는지 count로 처리
		if(result == 0) return mNum;
		else return 0;
		}catch (Exception e) {
			return 0;
		}
	}
	
	//로그인
	public boolean checkMember(MemberDTO dto) {
		try {
			System.out.println(dto.getMId());
			System.out.println(dto.getMPwd());
			String result = mapper.checkMember(dto);
			
			if(result.equals("1"))  return true;
			else return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//로그인한 사용자 권한 얻어오기
	public String memberRole(String mId) {
		try {
			String result = mapper.memberRole(mId);
			return result;
		} catch (Exception e) {
			return null;
		}
	}
	
	//로그인한 사용자 번호 얻어오기
	public int memberNum(String mId) {
		try {
			int  result = mapper.memberNum(mId);
			return result;
		} catch (Exception e) {
			return 0;
		}
	}
	
	//로그인 중복처리
	public int checkId(String mId) {
			int result = mapper.checkId(mId);
			return result;
	}

	@Override
	public String findmyId(MemberDTO dto) {
		return mapper.findmyId(dto);
	}

	@Override
	public int findmypwd(MemberDTO dto) {
		return mapper.findmypwd(dto);
	}

	@Override
	public void tkIssued(HashMap<String,Object> map) {
		mapper.tkIssued(map);
	}

	@Override
	public MemberDTO selectMinfo(String mId) {
		return mapper.selectMinfo(mId);
	}

	@Override
	public void updateminfo(MemberDTO dto) {
		mapper.updateminfo(dto);
	}
}