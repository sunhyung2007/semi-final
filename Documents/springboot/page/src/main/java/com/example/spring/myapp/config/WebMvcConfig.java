package com.example.spring.myapp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.spring.myapp.config.interceptor.AccessInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	/*
	 *  <pre>
	 */
	
	@Override
    public void addInterceptors( InterceptorRegistry registry ) {
        registry.addInterceptor(new AccessInterceptor()).addPathPatterns("/**") // 해당 경로에 접근하기 전에 인터셉터가 가로챈다.
                .excludePathPatterns("/css/**")             // 해당 경로는 인터셉터가 가로채지 않는다.
                .excludePathPatterns("/fonts/**")           // 해당 경로는 인터셉터가 가로채지 않는다.
                .excludePathPatterns("/images/**")          // 해당 경로는 인터셉터가 가로채지 않는다.
                .excludePathPatterns("/js/**")              // 해당 경로는 인터셉터가 가로채지 않는다.
                .excludePathPatterns("/modules/**")         // 해당 경로는 인터셉터가 가로채지 않는다.
                .excludePathPatterns("/error")              // 해당 경로는 인터셉터가 가로채지 않는다.
                .excludePathPatterns("/login.do")           // 해당 경로는 인터셉터가 가로채지 않는다.
                .excludePathPatterns("/logout.do")          // 해당 경로는 인터셉터가 가로채지 않는다.
                .excludePathPatterns("/upload.do");         // 해당 경로는 인터셉터가 가로채지 않는다.
    }
}
