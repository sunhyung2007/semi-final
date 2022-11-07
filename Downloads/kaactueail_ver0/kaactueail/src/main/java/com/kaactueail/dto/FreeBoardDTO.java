package com.kaactueail.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FreeBoardDTO {
	
	private int FB_num;
	private String FB_title, FB_content;
	private Date FB_date;
	private String FB_writer;
	private int FB_readcount, m_num;
	
	
}
