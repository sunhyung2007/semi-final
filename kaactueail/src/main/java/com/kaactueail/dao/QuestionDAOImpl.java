package com.kaactueail.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaactueail.dto.Criteria;
import com.kaactueail.dto.QuestionDTO;
import com.kaactueail.mappers.QuestionMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
@Log4j
public class QuestionDAOImpl implements QuestionDAO {
	
	@Autowired
	private QuestionMapper mapper;

	@Override
	public List<QuestionDTO> getAllList() {
		return mapper.getAllList();
	}

	@Override
	public List<QuestionDTO> getListPaging(Criteria cri) {
		return mapper.getListPaging(cri);
	}

	@Override
	public QuestionDTO getByquestionNum(int questionNum) {
		return mapper.getByquestionNum(questionNum);
	}

	@Override
	public void write(QuestionDTO question) {
		mapper.insertquestion(question);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

}
