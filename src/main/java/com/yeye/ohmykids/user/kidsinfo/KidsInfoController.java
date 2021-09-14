package com.yeye.ohmykids.user.kidsinfo;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class KidsInfoController {

	@RequestMapping("/accounts/kidsinfo_view")
	public String kidsInfoView(){
		return "user/kidsinfo";
	}
}
