package com.yeye.ohmykids.user.kidsinfo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.user.kidsinfo.bo.KidsInfoBO;

@RestController
@RequestMapping("/user/accounts/kidsinfo")
public class KidsInfoRestController {
	
	@Autowired
	private KidsInfoBO kidsInfoBO;

	// 자녀정보 등록
	@RequestMapping("/create")
	public Map<String, String> kidsInfo(
			@RequestParam("kidsName") String kidsName
			, @RequestParam("kidsBirth") String kidsBirth
			, @RequestParam("kidsGender") String kidsGender
			, @RequestParam("kidsClass") String kidsClass
			, @RequestParam("relationship") String relationship
			, @RequestParam("file") MultipartFile file
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Map<String, String> result = new HashMap<>();
		
		int count = kidsInfoBO.addKidsInfo(userId, userName, kidsName, kidsBirth, kidsGender, kidsClass, relationship, file);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
}
