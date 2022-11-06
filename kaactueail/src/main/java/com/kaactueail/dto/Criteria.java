package com.kaactueail.dto;

import lombok.Data;

@Data
public class Criteria {
	
	// 현재 페이지
	private int pageNum;
	
	// 한페이지에 보여줄 게시물 개수
	private int amount;
	
	
	// 기본 세팅 pageNum = 1, amount = 10
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
