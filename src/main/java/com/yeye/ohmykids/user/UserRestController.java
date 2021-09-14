package com.yeye.ohmykids.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yeye.ohmykids.user.bo.UserBO;
import com.yeye.ohmykids.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	// 회원가입
	@PostMapping("/sign_up")
	public Map<String, String> signup(
			@RequestParam("type") String type
			, @RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email){
		
		Map<String, String> result = new HashMap<>();
		int count = userBO.signup(type, loginId, password, name, email);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	// 아이디 중복체크
	@GetMapping("/is_duplicate_id")
	public Map<String, Boolean> isDuplicateId(
			@RequestParam("loginId") String loginId){
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.isDuplicateId(loginId)) {
			result.put("is_duplicate", true);
		}else {
			result.put("is_duplicate", false);
		}
		return result;
	}
	
	// 로그인
	@RequestMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("type") String type
			, @RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request){
		
		Map<String, String> result = new HashMap<>();
		User user = userBO.signIn(type, loginId, password);
		
		if(user != null) {
			result.put("result", "success");
			// 로그인 상태 세션 가져오기
			HttpSession session = request.getSession();
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
		}else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	
}
