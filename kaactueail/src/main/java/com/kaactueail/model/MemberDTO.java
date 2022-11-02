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
	private int m_num;
	private String m_id, m_pwd, m_name, m_birth, m_tel, m_role;
	
	@Autowired
	public MemberDTO(String m_id, String m_pwd) {
		this.m_id = m_id;
		this.m_pwd = m_pwd;
	}
	
	
	@Autowired
	public MemberDTO(int m_num, String m_id, String m_pwd, String m_name, String m_birth, String m_tel) {
		this.m_num = m_num;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_tel = m_tel;
	}
}
