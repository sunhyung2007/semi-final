package com.kaactueail.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FreeBoardDTO {
	
	private int freeboardNum;
	private String freeboardTitle, freeboardContent;
	private Date freeboardDate;
	private String freeboardWriter;
	private int freeboardReadcount, freeboardMnum;
	
	
}
