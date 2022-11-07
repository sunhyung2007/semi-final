package com.kaactueail.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.FreeBoardDTO;
import com.kaactueail.mappers.FreeBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
@Log4j
public class FreeBoardDAOImpl implements FreeBoardDAO {
	
	@Autowired
	private FreeBoardMapper mapper;


	@Override
	public boolean modify(FreeBoardDTO FBoard) {
		log.info("modify-----------"+FBoard);
		
		// 정상적으로 수행되면 1 값 반환되므로 엄격하게 처리하기 위해 == 1
		return mapper.updateByFBnum(FBoard)==1;
	}

	@Override
	public boolean remove(int FB_num) {
		log.info("remove--------"+FB_num);
		
		// 정상적으로 수행되면 1 값 반환되므로 엄격하게 처리하기 위해 == 1		
		return mapper.deleteByFBnum(FB_num)==1;
	}

	@Override
	public List<FreeBoardDTO> getAllList() {
		log.info("getallList-----------");
		
		return mapper.getAllList();
	}

	@Override
	public FreeBoardDTO getByFB_num(int FB_num) {
		log.info("get----------"+FB_num);
		
		return mapper.getByFB_num(FB_num);
	}

}
