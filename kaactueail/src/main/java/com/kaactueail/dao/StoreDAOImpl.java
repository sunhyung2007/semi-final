package com.kaactueail.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.StoreDTO;
import com.kaactueail.mappers.StoreMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
@Log4j
public class StoreDAOImpl implements StoreDAO {
	
	@Autowired
	private StoreMapper mapper;
	
	@Override
	public List<StoreDTO> selectAll(Criteria cri) {
		return mapper.selectAll(cri);
	}

	@Override
	public StoreDTO getDetail(int cNum) {
		return mapper.getDetail(cNum);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public boolean addCart(StoreDTO dto) {
		return mapper.insertByCartNum(dto)==1;
	}

	@Override
	public boolean payment(StoreDTO dto) {
		return mapper.insertByPaymentNum(dto)==1;
	}

	@Override
	public int selectMemeberId(String mId) {
		return mapper.selectMemeberId(mId);
	}
	
	
//	@Override
//	public int updateReadcount(int cNum) {
//		return mapper.updateReadcount(cNum);
//	}	
	
	
	
}