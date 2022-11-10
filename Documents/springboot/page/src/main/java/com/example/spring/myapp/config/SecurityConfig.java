package com.example.spring.myapp.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.example.spring.myapp.config.auth.CusTomAuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity // 스프링 Security Filter가 Spring Fileter Chain에 등록됨
public class SecurityConfig {
	private final Logger logger = LoggerFactory.getLogger(SecurityConfig.class);
	
	@Bean
    public BCryptPasswordEncoder encodePwd() { // 비밀번호 암호화
        return new BCryptPasswordEncoder();
    }
	/**
     * <pre>
     * Security 무시 설정
     * excludePathPatterns 설정이 변경되면, WebMvcConfig Class도 변경되어야 한다.
     * </pre>
     */
	 
	    public void configure( WebSecurity web ) {
	        web.ignoring().antMatchers("/css/**", "/fonts/**", "/images/**", "/js/**", "/modules/**")
	                .antMatchers("/h2-console/**", "/swagger-ui/**");
	    }
	    
	    protected void configure( HttpSecurity http ) throws Exception {
	        // 해당 기능을 사용하기 위해서는 프론트단에서 csrf토큰값 보내줘야함, csrf공격 보안
	        // <input type="hidden" name="${_csrf.paremeterName }" value="${_csrf.token }"/>
	        http.csrf().disable(); // Spring Security의 SCRF를 막음. Post가 안될 경우가 존재하면 막는 경우도 있음.

	        http.authorizeHttpRequests() //
	                .antMatchers("/login.do", "/logout.do", "/swagger-ui/**", "/swagger-ui").permitAll() // 로그인 하지 않고 모두 권한을
	                                                                                                     // 가짐.
	                .anyRequest().authenticated(); // 그 외 모든 요청은 인증된 사용자만 접근 가능
	        // .anyRequest().permitAll() // 로그인 하지 않고 모두 권한을 가짐.
	        http.requiresChannel()
            // .antMatchers("/**").requiresSecure() // https 로 리다이렉스 시킴
            .antMatchers("/**").requiresInsecure(); // http 로 리다이렉스 시킴
    

    http.formLogin() // 로그인 페이지와 기타 로그인 처리 및 성공 실패 처리를 사용하겠다는 의미 입니다.
            .loginPage("/login.do")                          // Login 화면
            .loginProcessingUrl("/loginProcess.do")          // Login 프로세스
            // .defaultSuccessUrl("/main.do", true)
            .successHandler(new CusTomAuthenticationSuccessHandler("/main.do")) // 인증에 성공하면 Main 페이지로 Redirect
            // // .failureHandler(new CustomAuthenticationFailureHandler("/login-fail")) // 커스텀 핸들러를 생성하여 등록하면 인증실패
            // 후
            .failureUrl("/login.do?fail=true") // 인증이 실패 했을 경우 이동하는 페이지를 설정합니다.
            .usernameParameter("userId")                    // Login ID 명칭지정 - MemberRepository 의 id와 매칭됨.
            .passwordParameter("password");                  // Login PW 명칭지정
   

    		http.logout() 
            .logoutRequestMatcher(new AntPathRequestMatcher("/logout.do")) // 로그아웃
            .logoutSuccessUrl("/login.do") // 로그아웃에 성공하면 페이지 Redirect
            .invalidateHttpSession(true); // Session 초기화
	    }
}
