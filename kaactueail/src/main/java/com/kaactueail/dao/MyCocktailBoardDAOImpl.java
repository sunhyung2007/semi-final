package com.kaactueail.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.LikeDTO;
import com.kaactueail.dto.MyCocktailBoardDTO;
import com.kaactueail.mappers.MyCocktailBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
@Log4j
public class MyCocktailBoardDAOImpl implements MyCocktailBoardDAO {

	@Autowired
	private MyCocktailBoardMapper mapper;

	@Override
	public boolean modifyMycocktailboard(MyCocktailBoardDTO mycocktaildto) {

		// 정상적으로 수행되면 1 값 반환되므로 엄격하게 처리하기 위해 == 1
		return mapper.updateBymycocktailNum(mycocktaildto) == 1;
	}

	@Override
	public boolean removeMycocktailboard(int mycocktailNum) {

		// 정상적으로 수행되면 1 값 반환되므로 엄격하게 처리하기 위해 == 1
		return mapper.deleteBymycocktailNum(mycocktailNum) == 1;
	}

	// d
	@Override
	public List<MyCocktailBoardDTO> getAllMycocktailboardList() {

		return mapper.getAllMycocktailboardList();
	}
	
	@Override
	public void updatelikenum() {
		mapper.updatelikenum();
	}

	@Override
	public MyCocktailBoardDTO getBymycockNum(int mycocktailNum) {
		return mapper.getBymycocktailNum(mycocktailNum);
	}

	@Override
	public void write(MyCocktailBoardDTO mycocktaildto) {
		mapper.insertmycocktailBoard(mycocktaildto);

	}
	// 좋아요 누른지 확인
	@Override
	public int findLike(LikeDTO like) {
		
		return mapper.findLike(like);
	}

	// 좋아요 눌렀을 시 좋아요 추가
	@Override
	public void makeolike(LikeDTO like) {
		mapper.makeolike(like);
	}
	// 좋아요 취소
	public void makeunlike(LikeDTO like) {
		mapper.makeunlike(like);
	}
	
}
