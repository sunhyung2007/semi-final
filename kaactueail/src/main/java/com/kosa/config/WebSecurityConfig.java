//package com.kosa.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@EnableWebSecurity
//@Configuration
//public class WebSecurityConfig  extends WebSecurityConfigurerAdapter{
////	private final UserService userService;
//	
//	  @Override
//	  public void configure(WebSecurity web) {
//	    web.ignoring().antMatchers("/css/**", "/js/**", "/img/**");
//	  }
//
//	  @Override
//	  protected void configure(HttpSecurity http) throws Exception {
//		  http
//		  	.authorizeRequests()// 접근에 대한 권한 설정
//		  		.antMatchers("/login", "/signup", "/loginform", "signupform").permitAll() //모든 권한(누구나) 접근 허용
//		  		.antMatchers("/").hasRole("ROLE_USER") //USER, ADMIN 접근가능
//		  		.antMatchers("/admin").hasRole("ROLE_ADMIN") // ADMIN만 접근가능
//		  		.anyRequest().authenticated() // 나머지 요청들은 권한의 종류에 상관없이 권한이 있어야 접근 가능
//		  	.and()
//		  		.formLogin() //로그인 설정
//		  		.loginPage("/loginform") //로그인 페이지 링크
//		  		.defaultSuccessUrl("/loginSuccess") //로그인 성공했을 때
//		  	.and()
//		  		.logout() //로그아웃 설정
//		  		.logoutSuccessUrl("/loginform") //로그아웃 성공 시 리다이렉트 주소
//		  		.invalidateHttpSession(true); // 세션 날리기
//	  }
//	  
////	  @Override
////	  public void configure(AuthenticationManagerBuilder auth) throws Exception {
////		  auth.userDetailsService(userService).passwordEncoder(new BcyptPasswordEncoder());
////	  }
//}
