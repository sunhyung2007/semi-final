package com.kaactueail.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CockInfoBoardDTO {
	
	private int infoBoardNum, infoBoardReadcount, infoBoardAdminNum;
	private String infoBoardTitle, infoBoardContent, infoBoardRecipe;
	
	private Date infoBoardDate; 
	private String infoBoardWriter;
	

//	   infoBoardNum number(8) primary key,                      -- 소개 게시판 게시글 번호 (기본키) -- 
//	   infoBoardTitle varchar2(20 char) not null,                  -- 소개 게시판 게시글 제목 -- 
//	   infoBoardContent varchar2(2000) not null,      
//	   infoBoardRecipe varchar2(300 char) not null,               -- 소개 게시판 게시글 내용 -- 
//	   infoBoardDate date,                                        -- 소개 게시판 게시글 작성일자 -- 
//	   infoBoardWriter varchar2(20) not null,                      -- 소개 게시판 게시글 작성자 -- 
//	   infoBoardReadcount number default 0,                      -- 소개 게시판 게시글 조회수 -- 
//
//	   -- 소개 게시판 작성자의 회원번호를 외래키로 가진다. --
//	   infoBoardAdminNum number(8) not null,
//	   constraint infoBoardAdminNumFk foreign key(infoBoardAdminNum) references Admin(adminNum)   
}
