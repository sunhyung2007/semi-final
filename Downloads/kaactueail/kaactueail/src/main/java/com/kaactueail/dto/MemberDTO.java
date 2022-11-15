package com.kaactueail.dto;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Getter
@Setter
@Data
public class MemberDTO {
	private int mNum;
	private String mId, mPwd, mName, mBirth, mTel, mRole;
	
	
	@Autowired
	public MemberDTO(String mId, String mPwd) {
		this.mId = mId;
		this.mPwd = mPwd;
	}
	
	
	@Autowired
	public MemberDTO(int mNum, String mId, String mPwd, String mName, String mBirth, String mTel, String mRole) {
		this.mNum = mNum;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mBirth = mBirth;
		this.mTel = mTel;
		this.mRole = mRole;
	}
}