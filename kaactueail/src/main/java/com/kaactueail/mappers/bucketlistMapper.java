package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.BucketDTO;

public interface bucketlistMapper {
	
	// 회원 번호 기준으로 장바구니 담긴 물건 출력
	public List<BucketDTO> getBucketList(int bucketlistMemberNum);
	
	// 장바구니 삭제
	public int deleteBucket(int bucketlistNum);
	
	// 상품 수량 수정
	public int modifyAmount(BucketDTO bucket);
	
}
