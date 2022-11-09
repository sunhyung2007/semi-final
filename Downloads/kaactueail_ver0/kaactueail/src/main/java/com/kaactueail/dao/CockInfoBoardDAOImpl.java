package com.kaactueail.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.CockInfoBoardDTO;
import com.kaactueail.dto.Criteria;
import com.kaactueail.mappers.CockInfoBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@AllArgsConstructor
@Service
@Log4j
public class CockInfoBoardDAOImpl implements CockInfoBoardDAO {
	
	@Autowired
	private CockInfoBoardMapper mapper;
	
	
	//  select all 칵테일 이름&내용또는설명 전체 조회
	@Override
	public List<CockInfoBoardDTO> selectAll(Criteria cri){
		log.info("getallList-----------");
		
		return mapper.selectAll(cri);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public CockInfoBoardDTO getDetail(int infoboardNum) throws Exception {
		log.info("cockInfoGetDetail....." + infoboardNum);
		return mapper.getDetail(infoboardNum);
	}

	// 칵테일 정보 등록
	@Override
	public void write(CockInfoBoardDTO board) {
		mapper.write(board);
		
	}

	@Override
	public CockInfoBoardDTO getByinfoboardNum(int infoboardNum) {
		return mapper.getByinfoboardNum(infoboardNum);
	}

	@Override
	public boolean modify(CockInfoBoardDTO dto) {		
		return mapper.updateByinfoboardNum(dto)==1;
	}

	@Override
	public int updateReadcount(int infoboardNum) {		
		return mapper.updateReadcount(infoboardNum);
	}
	
	
	
	
	
}
