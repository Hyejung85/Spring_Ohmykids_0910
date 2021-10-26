package com.yeye.ohmykids.schedule;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yeye.ohmykids.schedule.bo.ScheduleBO;

@RestController
@RequestMapping("/schedule")
public class ScheduleRestController {

	@Autowired
	private ScheduleBO scheduleBO;
	
	//이벤트 생성
	@RequestMapping("/create")
	public Map<String, String> scheduleCreate(
			@RequestParam("kidsClass") String kidsClass
			, @RequestParam("title") String title
			, @RequestParam("description") String description
			, @RequestParam("start") String start
			, @RequestParam("end") String  end
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		String userType = (String) session.getAttribute("userType");
		
		int count = scheduleBO.create(userId, userName, userType, kidsClass, title, description, start, end);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
}
