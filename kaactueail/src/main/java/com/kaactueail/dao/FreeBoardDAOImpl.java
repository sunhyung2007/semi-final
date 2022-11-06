package com.kaactueail.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.Criteria;
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
		
		// 정상적으로 수행되면 1 값 반환되므로 엄격하게 처리하기 위해 == 1
		return mapper.updateByfreeboardNum(FBoard)==1;
	}

	@Override
	public boolean remove(int freeboardNum) {
		
		// 정상적으로 수행되면 1 값 반환되므로 엄격하게 처리하기 위해 == 1		
		return mapper.deleteByfreeboardNum(freeboardNum)==1;
	}

	@Override
	public List<FreeBoardDTO> getAllList() {
		
		return mapper.getAllList();
	}

	@Override
	public FreeBoardDTO getByfreeboardNum(int freeboardNum) {
		
		return mapper.getByfreeboardNum(freeboardNum);
	}

	@Override
	public void write(FreeBoardDTO FBboard) {
		
		mapper.insertfreeBoard(FBboard);
		
	}

	@Override
	public List<FreeBoardDTO> getListPaging(Criteria cri) {
		
		return mapper.getListPaing(cri);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

}
