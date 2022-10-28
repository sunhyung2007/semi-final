package com.example.spring.myapp.model;



import java.sql.Timestamp;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.Id;

import lombok.Data;

@Data
public class Member {
	
	
	/*
	 * 기본키 생성을 데이터베이스에 위임함
	 * IDENTITY -> em.persist()로 객체를 영속화 시키는 시점에 곧바로 insert 쿼리가 DB로 전송
	 * 거기서 반환받은 식별자 값을 가지고 1차 캐시에 엔티티를 등록시켜 관리
	 */
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String mId;
	private String mPwd,mName,mBirth,mTel;
	private String role;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	public Member(String mName, String mPwd) {
		this.mName = mName;
		this.mPwd = mPwd;
	}
	
	public Member(String mName, String mId, String mPwd) {
		this.mName = mName;
		this.mId = mId;
		this.mPwd = mPwd;
	}
	public Member(String mName, String mId, String mPwd, String role) {
		this.mName = mName;
		this.mId = mId;
		this.mPwd = mPwd;
		this.role = role;
	}
	
}
