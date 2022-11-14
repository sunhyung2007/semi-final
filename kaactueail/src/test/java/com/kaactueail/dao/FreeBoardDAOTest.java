package com.kaactueail.dao;

import static org.junit.Assert.assertNotNull;

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
public class FreeBoardDAOTest {
	
	@Setter(onMethod_ = { @Autowired })
	private FreeBoardDAO dao;

	// FreeBoardDAO 객체 주입 가능한지 확인
	// 정상적으로 FreeBoardDAO 객체 생성되고 FreeBoardMapper가 주입되었는지 확인
	@Test
	public void testExist() {
		log.info(dao);
		assertNotNull(dao);
	}
				
	@Test
	public void testGetAllList() {
		dao.getAllList().forEach(FBoard -> log.info(FBoard));
	}
	/*
	@Test
	public void testGetByFB_num() {
		log.info(dao.getByFB_num(8));
	}
		
	@Test
	public void testDelete() {
		log.info("Remove result: "+dao.remove(8));
	}
	
	@Test
	public void testUpdate() {
		FreeBoardDTO FBoard = dao.getByFB_num(9);
		
		if(FBoard==null) {
			return;
		}
		
		FBoard.setFB_title("이것은수정이된타이틀");
		log.info("Modify result:" + dao.modify(FBoard));
	}
*/
}
