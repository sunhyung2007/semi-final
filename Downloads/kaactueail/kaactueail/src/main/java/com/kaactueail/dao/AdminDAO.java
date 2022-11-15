package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.CockitDTO;
import com.kaactueail.dto.MemberDTO;

public interface AdminDAO {
	
	//회원관리에서 회원 모두 보기
	public List<MemberDTO> SelectAllUser();
	
	//회원 삭제
	public void deleteMember(String mNum);
	
	//회원 수
	public int CountAllUser();
	
	//회원검색
	public List<MemberDTO> selectmember(String mId);
	
	//이름으로 회원검색
	public List<MemberDTO> selectnamemember(String mName);
	
	//재고 모두보기
	public List<CockitDTO> SelectAllCockitStock();
	
	//이름으로 재고검색
	public List<CockitDTO> selectcockit(String cName);
	
	//재고 삭제
	public void deleteProduct(String cNum);
	
	//재고 수정
	public void updateProduct(CockitDTO dto);
	
	//title 중복확인
	public int selectcName(String cName);
	
	//칵키트 정보 입력
	public void writeCockit (CockitDTO dto);
}
