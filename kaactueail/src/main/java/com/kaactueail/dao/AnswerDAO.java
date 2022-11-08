package com.kaactueail.dao;

import java.util.List;

import com.kaactueail.dto.AnswerDTO;

public interface AnswerDAO {
	
	public List<AnswerDTO> getAnswer();
	
	public void write(AnswerDTO answer);
	
	public AnswerDTO getByQuestionNum(int answerQuestionNum);

}
