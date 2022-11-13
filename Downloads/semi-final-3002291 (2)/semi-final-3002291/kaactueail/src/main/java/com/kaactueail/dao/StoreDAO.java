package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.StoreDTO;

public interface StoreDAO {
	// 스토어 상품리스트 조회
	public List<StoreDTO> selectAll(Criteria cri);
	
	// 스토어 상품 조회(칵키트 번호를 받아서 정보반환)
	public StoreDTO getDetail(int cNum);
	
	public int getTotal();	
	
//	// 게시글 조회수 
//	public int updateReadcount(int cNum);
	
	public boolean addCart(StoreDTO dto);
	
	public int selectMemeberId(String mId);
	
	public boolean payment(StoreDTO dto);
	
}
