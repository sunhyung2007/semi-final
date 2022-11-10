package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.BucketDTO;

public interface BucketDAO {
	
	// 장바구니 상품 출력
	public List<BucketDTO> getBucketList(int bucketlistMemberNum);
	
	// 장바구니 상품 수량 수정
	public int modifyCount(BucketDTO bucket);
	
	// 장바구니 상품 삭제
	public int deleteBucket(int bucketlistNum);
	

}
