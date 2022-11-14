package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.QuestionDTO;

public interface QuestionDAO {
	
	public List<QuestionDTO> getAllList();
	
	public List<QuestionDTO> getListPaging(Criteria cri);
	
	public QuestionDTO getByquestionNum(int questionNum);
	
	public void write(QuestionDTO question);
	
	public int getTotal();
}
