package com.example.spring.myapp.config.interceptor;

import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

public class AccessInterceptor implements HandlerInterceptor {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/**
     * 컨트롤러에 진입하기 전에 실행됩니다.
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        logger.info("[AccessInterceptor] 시작 ==============================================================");

        String url = request.getRequestURI();

        URI uri = UriComponentsBuilder.fromUriString(request.getRequestURI()).query(request.getQueryString()).build()
                .toUri();
        int httpStatus = response.getStatus();
        
        logger.info("AccessInterceptor preHandle >> url :: {} >> {}", url, httpStatus);
        logger.info("AccessInterceptor preHandle >> uri :: {} >> {}", uri, httpStatus);

        logger.info("1. 접근 URL 체크");

        // HttpSession session = request.getSession();
        // UserVO loginVO = (UserVO) session.getAttribute("loginUser");
        //
        // if (ObjectUtils.isEmpty(loginVO)) {
        // response.sendRedirect("/moveLogin.go");
        // return false;
        // } else {
        // session.setMaxInactiveInterval(30 * 60);
        // return true;
        // }

        logger.info("[AccessInterceptor] 끝 ==============================================================");

        return true;

    }
    
    /**
     * 컨트롤러 진입 후 View가 랜더링 되기 전에 수행됩니다.
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        logger.info("AccessInterceptor postHandle");
    }
    /**
     * 컨트롤러 진입 후 view가 랜더링 된 후에 실행되는 메소드입니다.
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        logger.info("AccessInterceptor afterCompletion");
    }
}
