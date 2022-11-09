package com.kaactueail.mappers;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.FreeBoardDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FreeBoardMapperTest {
	
	@Setter(onMethod_ = { @Autowired })
	private CockInfoBoardMapper mapper;

/*
	@Test
	public void testInsert() {
		FreeBoardDTO FBoard = new FreeBoardDTO();
		FBoard.setFB_title("java title");
		FBoard.setFB_content("java contents");
		FBoard.setFB_writer("java writer");
		FBoard.setM_num(1);
		
		mapper.insert(FBoard);
		
		log.info(FBoard);
	}


	@Test
	public void testDelete() {
		
		log.info("Delete Count:"+mapper.deleteByFBnum(7));
	}


	@Test
	public void testUpdate() {
		FreeBoardDTO FBoard = new FreeBoardDTO();
		
		FBoard.setFB_num(7);
		FBoard.setFB_title("업데이트 제목");
		FBoard.setFB_content("업데이트 내용");

		
		int count = mapper.updateByFBnum(FBoard);
		
		log.info("Update count: "+count);
	}
*/	
		@Test
	public void testGetList(Criteria cri) {
		mapper.selectAll(cri).forEach(infoboard -> log.info(infoboard));
	}
/*		
	@Test
	public void testGetFBnumList() {
		FreeBoardDTO FBoard = mapper.getByFB_num(8);
		log.info(FBoard);
		
	}
*/
}
