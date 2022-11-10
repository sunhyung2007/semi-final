package com.example.spring.myapp.config.auth;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass()); 
	
	@Autowired
    private PrincipalDetailsService principalDetailsService;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		logger.info("[CustomAuthenticationProvider] 시작 ---------------------------------");
        logger.info("authentication.getName() :: {}", authentication.getName().toString());
        logger.info("---------------------------------");
        
        PrincipalDetails principalDetails = (PrincipalDetails) principalDetailsService
                .loadUserByUsername(authentication.getName().toString());
        
        logger.info("principalDetails.getUsername :: {}", principalDetails.getUsername());
        logger.info("principalDetails.getPassword :: {}", principalDetails.getPassword());
        logger.info("principalDetails.getAuthorities :: {}", principalDetails.getAuthorities());
        
        logger.info("authentication.getCredentials() :: {}", authentication.getCredentials().toString());
        
        String reqPassword = authentication.getCredentials().toString();
        if ( !passwordEncoder.matches(reqPassword, principalDetails.getPassword()) )
            throw new BadCredentialsException("Not Found User");

        logger.info("[CustomAuthenticationProvider] 끝 ---------------------------------");
        
        return new UsernamePasswordAuthenticationToken(principalDetails, null, principalDetails.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
