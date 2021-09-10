package com.yeye.ohmykids.user;

import org.springframework.stereotype.Controller;
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
	
	// 
}
