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
		FBoard.setFreeBoardTitle("java title");
		FBoard.setFreeBoardContent("java contents");
		FBoard.setFreeBoardWriter("java writer");
		FBoard.setFreeBoardMnum(1);
		
		mapper.freeBoardinsert(FBoard);
		
		log.info(FBoard);
	}
	

	@Test
	public void testDelete() {
		
		log.info("Delete Count:"+mapper.deleteByfreeBoardNum(2));
	}

*/
	@Test
	public void testUpdate() {
		FreeBoardDTO FBoard = new FreeBoardDTO();
		
		FBoard.setFreeBoardNum(1);
		FBoard.setFreeBoardTitle("업데이트 제목");
		FBoard.setFreeBoardContent("업데이트 내용");

		int count = mapper.updateByfreeBoardNum(FBoard);
		
		log.info("Update count: "+count);
	}
	/*	
		@Test
	public void testGetList() {
		mapper.getAllList().forEach(freeboard -> log.info(freeboard));
	}
		
	@Test
	public void testGetFBnumList() {
		FreeBoardDTO FBoard = mapper.getByfreeBoardNum(1);
		log.info(FBoard);
		
	}
*/
}
