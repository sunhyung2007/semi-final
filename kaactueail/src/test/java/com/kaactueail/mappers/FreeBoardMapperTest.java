package com.kaactueail.mappers;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kaactueail.dto.FreeBoardDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FreeBoardMapperTest {
	
	@Setter(onMethod_ = { @Autowired })
	private FreeBoardMapper mapper;
/*

	@Test
	public void testInsert() {
		FreeBoardDTO FBoard = new FreeBoardDTO();
		FBoard.setFreeboardTitle("java title");
		FBoard.setFreeboardContent("java contents");
		FBoard.setFreeboardWriter("java writer");
		FBoard.setFreeboardMnum(1);
		
		mapper.insertfreeBoard(FBoard);
		
		log.info(FBoard);
	}
*/	

	@Test
	public void testDelete() {
		
		log.info("Delete Count:"+mapper.deleteByfreeboardNum(2));
	}
/*
	@Test
	public void testUpdate() {
		FreeBoardDTO FBoard = new FreeBoardDTO();
		
		FBoard.setFreeboardNum(1);
		FBoard.setFreeboardTitle("아아아아아아아아");
		FBoard.setFreeboardContent("업데이트 내용");

		int count = mapper.updateByfreeboardNum(FBoard);
		
		log.info("Update count: "+count);
	}
		
		@Test
	public void testGetList() {
		mapper.getAllList().forEach(freeboard -> log.info(freeboard));
	}
		
	@Test
	public void testGetFBnumList() {
		FreeBoardDTO FBoard = mapper.getByfreeboardNum(1);
		log.info(FBoard);
		
	}
*/
}
