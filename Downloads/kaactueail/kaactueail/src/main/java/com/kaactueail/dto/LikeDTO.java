package com.kaactueail.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LikeDTO {
	private int likeboardNum, likeboardMyCocktailNum;
	private Integer likeboardMemberNum;

}