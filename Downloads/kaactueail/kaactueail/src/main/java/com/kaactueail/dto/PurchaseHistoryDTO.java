package com.kaactueail.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PurchaseHistoryDTO {
	
	private int PUrchaseNum, PUrchaseCost, PUrchaseAmount, PUrchaseMemberNum, PUrchaseCockitNum;
	private int OrderMemberNum;
	private Date PUrchaseDate;
	private String PUrchaseCockitName;
}
