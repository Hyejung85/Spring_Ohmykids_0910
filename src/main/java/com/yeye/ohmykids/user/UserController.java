package com.yeye.ohmykids.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	//로그인 화면
	@RequestMapping("/signin_view")
	public String signin() {
		return "user/signin";
	}
	
	//회원가입 화면
	@RequestMapping("/signup_view")
	public String signup() {
		return "user/signup";
	}
	
	//로그아웃
	@GetMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("parentsId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/signin_view";
	}
}
