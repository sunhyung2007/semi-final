package com.kaactueail.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FreeBoardDTO {
	//게시판 번호
	private int freeBoardNum;
	// 게시판 타이틀
	private String freeBoardTitle, freeBoardContent;
	private Date freeBoardDate;
	private String freeBoardWriter;
	private int freeBoardReadcount, freeBoardMnum;
	
	
}
