package com.yeye.ohmykids.schedule;

import java.util.ArrayList;
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

	//스케줄 리스트
	@RequestMapping("/list_view")
	public String listView(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		String userType = (String) session.getAttribute("userType");
		
		//스케줄 목록 (스케줄 상세에 id를 어떻게 받을지.. for문을 사용하면 model에 마지막 값만 들어간다.)
		List<Schedule> scheduleList = scheduleBO.getList();
		model.addAttribute("scheduleList", scheduleList);
		
		//스케줄 상세
		//List<Schedule> oneScheduleList = new ArrayList<>();
		Schedule schedule = null;
		for(Schedule target : scheduleList) {
			
			schedule = scheduleBO.getSchedule(target.getId());
			//oneScheduleList.add(schedule);
		}
		model.addAttribute("schedule", schedule);
		//Schedule schedule = scheduleBO.getSchedule();
		//model.addAttribute("oneScheduleList", oneScheduleList);
		
		
		//kidsInfo 생일정보
		List<KidsInfo> kidsBirthList = kidsInfoBO.useKidsBirth();
		model.addAttribute("kidsBirthList", kidsBirthList);
		
		return "schedule/list";
	}
	
	
}
