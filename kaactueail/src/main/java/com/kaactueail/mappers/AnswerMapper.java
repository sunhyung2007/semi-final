package com.kaactueail.mappers;

import java.util.List;

import com.kaactueail.dto.AnswerDTO;

public interface AnswerMapper {
	
	// 댓글 조회
	public List<AnswerDTO> getAnswer();
	
	// 게시글 번호로 댓글 출력
	public List<AnswerDTO> getByQuestionNum(int answerQuestionNum);
	
	// 댓글 등록
	public void insertanswer(AnswerDTO answer);
	
	

}
