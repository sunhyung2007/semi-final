package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.QuestionDTO;

public interface QuestionMapper {
	
	public List<QuestionDTO> getAllList();
	
	public List<QuestionDTO> getListPaging(Criteria cri);
	
	public QuestionDTO getByquestionNum(int questionNum);
	
	public void insertquestion(QuestionDTO question);
	
	public int getTotal();

}
