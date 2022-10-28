package com.example.spring.myapp.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.spring.myapp.model.Member;

/**
 * Spring Security가 /login.do 요청이 들어오면
 * 로그인이 완료되면 Security Session 을 생성한다. ( SecurityHolder )
 * Object Type => Authentication 타입 객체
 * Authentication 안에 User 정보가 있어야 함.
 * User Object Type => UserDetails Type 객체
 * 
 * Principal -> User 의 ID를 가리킴
 * 
 * Security Session -> Authentication -> UserDetails(PrincipalDetails)
 */

public class PrincipalDetails implements UserDetails {
	
	private Member member; //구성
	
	public PrincipalDetails(Member member) {
		this.member = member;
	}
	
	@Override //사용자가 가진 권한 의미, 특정 자원에 대한 권한이 있는지 검사, 접근 허용 여부 결정 (인가)
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authList = new ArrayList<>();
											//권한 설정하기. 해당 사항에 맞는 권한인지
		authList.add(new SimpleGrantedAuthority(member.getRole()));
		return authList;
	}

	@Override //사용자의 비밀번호 가져옴
	public String getPassword() {
		return member.getMPwd();
	}

	@Override //사용자의 이름을 가져옴
	public String getUsername() {
		return member.getMName();
	}

	@Override // 사용자가 만료된 지를 알고 싶으면 호출
	public boolean isAccountNonExpired() { // 만료가 안 됐는지?
		//접속시간확인으로 true, false 리턴
		return true;
	}

	@Override
	public boolean isAccountNonLocked() { //계정이 잠기지 않았는지? true -> 잠기지 않음
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() { // 계정의 패스워드가 만료되지 않았는지 true = 만료 x
		return true;
	}

	@Override
	public boolean isEnabled() { //사용 가능한 계정인지? true -> 사용가능
		return true;
	}

}
