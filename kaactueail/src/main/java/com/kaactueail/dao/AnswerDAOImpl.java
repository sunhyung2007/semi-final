package com.kaactueail.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.AnswerDTO;
import com.kaactueail.mappers.AnswerMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class AnswerDAOImpl implements AnswerDAO {
	
	@Autowired
	private AnswerMapper mapper;

	@Override
	public List<AnswerDTO> getAnswer() {
		
		return mapper.getAnswer();
	}

	@Override
	public void write(AnswerDTO answer) {
		
		mapper.insertanswer(answer);

	}

	@Override
	public List<AnswerDTO> getByQuestionNum(int answerQuestionNum) {
		
		return mapper.getByQuestionNum(answerQuestionNum);
	}

}
