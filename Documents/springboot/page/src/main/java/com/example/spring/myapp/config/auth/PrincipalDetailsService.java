package com.example.spring.myapp.config.auth;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.spring.myapp.model.Member;
import com.example.spring.myapp.repository.MemberRepository;
//UserDetailsService는 IoC로 찾음
///loginProcess.do 가 찾아오는 클래스임.
@Service // UserDetailsService타입으로 메모리에 뜬다 (덮어씌워짐)
public class PrincipalDetailsService implements UserDetailsService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
    private MemberRepository memberRepository;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		// 어썬티케이션 매니저가 낚아챔
        // JPA는 기본적인 CRUD만 있어서 다른걸 쓰려면 만들어줘야함
		
		logger.info("[PrincipalDetailsService] userId :: {}", id);

        Member member = memberRepository.findMember(Long.parseLong(id));

        logger.info("[PrincipalDetailsService] member :: {}", member);
		
        if  ( member != null) {
        	List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        	String roles[] = member.getRole().split(",");
        	for ( int i = 0; i < roles.length; i ++) {
        		authorities.add(new SimpleGrantedAuthority(roles[i]));
        	}
        	
        	return new PrincipalDetails(member); // SecurityContext의 Authertication에 등록되어 인증정보를 가진다.
        }
        
		return null;
	}

}
