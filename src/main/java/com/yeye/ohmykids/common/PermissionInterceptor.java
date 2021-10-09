package com.yeye.ohmykids.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


@Component
public class PermissionInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		
		//현재 path 알아오기
		String uri = request.getRequestURI();
		
		//로그인 안된상태라면
		if(session.getAttribute("userId") == null || session.getAttribute("userId") == "") {
			if(uri.startsWith("/note") || uri.startsWith("/album") || uri.startsWith("/kidsinfo")) { // 알림장, 앨범, 자녀정보 접근시
				//로그인 페이지로 이동 시킨다.
				response.sendRedirect("/user/signin_view"); 
				return false;
			}
		}else  { //로그인이 된 상태라면
			if(uri.startsWith("/user")) { //로그인, 회원가입 페이지 접근시
				response.sendRedirect("/kidsinfo/list_view");
				return false;
			}
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		
	}

}
