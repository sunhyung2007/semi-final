package com.kaactueail.mappers;

import java.util.HashMap;
import java.util.List;

import com.kaactueail.dto.CockitDTO;

public interface CockitMapper {
	
	//스토어 전체 칵키트 얻어오기
	public  List<CockitDTO>selectallcockit();
}
