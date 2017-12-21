package com.jiayun.inventory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.logging.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Service;
import org.springframework.security.ldap.userdetails.LdapUserDetails;

@Service
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	private static final Logger log = Logger.getLogger(LoginSuccessHandler.class);
	
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws ServletException, IOException {
    	
    	// 把用户的登录信息记录在日志里面.
    	LdapUserDetails user = (LdapUserDetails) authentication.getPrincipal();
    log.infov("User {0} logged in.", user.getUsername());

        // 根据 Cookie 里的信息，确定是 PC访问，还是手机访问.
    Cookie[] cookies = request.getCookies();
    Boolean isMobile = false;
    for(Cookie cookie : cookies) {
        	if("mobile".equals(cookie.getName())){
        		String isMobileStr = cookie.getValue();
        		if(isMobileStr !=null && !isMobileStr.isEmpty()) {
        			isMobile = Boolean.parseBoolean(isMobileStr);
        		}
        	}
    }
    if(isMobile) {
        	response.sendRedirect("indexM");
    }
    else {
        	response.sendRedirect("index");
    }

    }
}
