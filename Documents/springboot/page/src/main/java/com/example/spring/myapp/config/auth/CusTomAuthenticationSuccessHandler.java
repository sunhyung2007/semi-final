package com.example.spring.myapp.config.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CusTomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private String redirectUri;
    
    public CusTomAuthenticationSuccessHandler(String redirectUri) {
		this.redirectUri = redirectUri;
	}
    
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		logger.info("[CustomAuthenticationSuccessHandler] 인증성공 ==============================================================");

        logger.info("1. 사용자 Session 생성");
        
        HttpSession session = request.getSession(true);
        session.setAttribute("UserDetail", authentication.getCredentials());

        response.sendRedirect(redirectUri);

        // 에러 세션 지우기
        clearAuthenticationAttributes(request);

        logger.info("session 정보 :: {}", session.getId());
        logger.info("UserDetail :: {}", session.getAttribute("UserDetail"));
        logger.info("[CustomAuthenticationSuccessHandler] 끝 ==============================================================");
	}
	
	//남아있는 에러세션 지워줌
	 protected void clearAuthenticationAttributes( HttpServletRequest request ) {
	        HttpSession session = request.getSession(false);
	        if ( session == null ) return;

	        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	    }

}
