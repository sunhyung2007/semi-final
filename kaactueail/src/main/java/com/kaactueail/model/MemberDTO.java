package com.kaactueail.model;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MemberDTO {
	private int mNum;
	private String mId, mPwd, mName, mBirth, mTel, mRole;
	
	
	@Autowired
	public MemberDTO(String mId, String mPwd) {
		this.mId = mId;
		this.mPwd = mPwd;
	}
	
	
	@Autowired
	public MemberDTO(int mNum, String mId, String mPwd, String mName, String mBirth, String mTel) {
		this.mNum = mNum;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mBirth = mBirth;
		this.mTel = mTel;
	}
}
