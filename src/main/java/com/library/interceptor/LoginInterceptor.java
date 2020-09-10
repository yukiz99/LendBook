package com.library.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


@Configuration
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
         HttpSession session=request.getSession();
		if(session.getAttribute("sessionAdmin")==null&&request.getRequestURI().matches("/admin/.*")){
			response.sendRedirect("/login.html");
			return false;
		}else if(session.getAttribute("sessionReader")==null&&request.getRequestURI().matches("/reader/.*")) {
			response.sendRedirect("/login.html");
			return false;
		}
		return true;
	}
}
