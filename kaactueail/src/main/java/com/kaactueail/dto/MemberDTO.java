package com.kaactueail.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDTO {
	
	private int Mnum;
	private String Mid, Mpwd, Mname, Mbirth, Mtel;

}
