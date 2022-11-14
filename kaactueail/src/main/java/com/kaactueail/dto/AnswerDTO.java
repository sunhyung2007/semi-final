package com.kaactueail.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AnswerDTO {
	
	private int answerNum, answerAdminNum, answerQuestionNum;
	private String answerContent;
	private Date answerDate;

}
