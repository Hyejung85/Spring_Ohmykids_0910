package com.yeye.ohmykids.schedule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@RequestMapping("/create_view")
	public String createView() {
		return "schedule/create";
	}
	
	@RequestMapping("/list_view")
	public String listView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String userType = (String) session.getAttribute("userType");
		
		return "schedule/list";
	}
}
