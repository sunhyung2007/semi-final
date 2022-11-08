package com.kaactueail.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class QuestionDTO {
	
	private int questionNum;
	private String questionTitle, questionContent, questionWriter;
	private Date questionDate;
	private int questionReadcount, questionMemberNum;

}
