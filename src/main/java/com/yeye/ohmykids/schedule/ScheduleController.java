package com.yeye.ohmykids.schedule;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeye.ohmykids.kidsinfo.bo.KidsInfoBO;
import com.yeye.ohmykids.kidsinfo.model.KidsInfo;
import com.yeye.ohmykids.schedule.bo.ScheduleBO;
import com.yeye.ohmykids.schedule.model.Schedule;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleBO scheduleBO;
	
	@Autowired
	private KidsInfoBO kidsInfoBO;

	@RequestMapping("/create_view")
	public String createView() {
		return "schedule/create";
	}
	
	@RequestMapping("/list_view")
	public String listView(HttpServletRequest request,Model model) {
		HttpSession session = request.getSession();
		
		String userType = (String) session.getAttribute("userType");
		List<Schedule> scheduleList = scheduleBO.getList();
		model.addAttribute("scheduleList", scheduleList);
		
		List<KidsInfo> kidsBirthList = kidsInfoBO.useKidsBirth();
		model.addAttribute("kidsBirthList", kidsBirthList);
		
		return "schedule/list";
	}
	
}
