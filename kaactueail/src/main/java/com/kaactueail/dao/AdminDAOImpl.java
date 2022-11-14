package com.kaactueail.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.CockitDTO;
import com.kaactueail.dto.MemberDTO;
import com.kaactueail.mappers.AdminMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private AdminMapper mapper;
	
	@Override
	public List<MemberDTO> SelectAllUser() {
		return mapper.SelectAllUser();
	}

	@Override
	public void deleteMember(String mNum) {
		mapper.deleteMember(mNum);
	}

	@Override
	public int CountAllUser() {
		return mapper.countalluser();
	}

	@Override
	public List<MemberDTO> selectmember(String mId) {
		return mapper.selectmember(mId);
	}

	@Override
	public List<MemberDTO> selectnamemember(String mName) {
		return mapper.selectnamemember(mName);
	}

	@Override
	public List<CockitDTO> SelectAllCockitStock() {
		return mapper.SelectAllCockitStock();
	}

	@Override
	public List<CockitDTO> selectcockit(String cName) {
		
		return mapper.selectcockit(cName);
	}

	@Override
	public void deleteProduct(String cNum) {
		
		 mapper.deleteproduct(cNum);
	}

	@Override
	public void updateProduct(CockitDTO dto) {
		mapper.updateproduct(dto);
	}

	@Override
	public int selectcName(String cName) {
		return mapper.selectcName(cName);
	}

	@Override
	public void writeCockit(CockitDTO dto) {
		mapper.writeCockit(dto);
	}
}
