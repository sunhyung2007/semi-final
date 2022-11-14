package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.CockitDTO;
import com.kaactueail.dto.MemberDTO;

public interface AdminMapper {
	
	//회원 보기
	public List<MemberDTO> SelectAllUser();
	
	//회원 삭제
	public void deleteMember(String mNum);
	
	
	//회원 수 구하기
	public int countalluser();

	
	//회원 검색
	public List<MemberDTO> selectmember(String mId);
	
	//이름으로 회원검색
	public List<MemberDTO> selectnamemember(String mName);
	
	//재고 모두보기
	public List<CockitDTO> SelectAllCockitStock();
	
	//재고 검색
	public List<CockitDTO> selectcockit(String cName);
	
	//재고 삭제
	public void deleteproduct(String cNum);
	
	//재고 수정
	public void updateproduct(CockitDTO dto);
	
	//타이틀 중복 확인
	public int selectcName(String cName);
	
	//칵키트 정보 입력
	public void writeCockit(CockitDTO dto);
}
