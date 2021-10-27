package com.yeye.ohmykids.schedule.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeye.ohmykids.schedule.dao.ScheduleDAO;
import com.yeye.ohmykids.schedule.model.Schedule;

@Service
public class ScheduleBO {

	@Autowired
	private ScheduleDAO scheduleDAO;
	
	//스케줄 입력
	public int create(int userId, String userName, String userType, String kidsClass, String title,
			 String description, Date  start, Date  end) {
		return scheduleDAO.insertSchedule(userId, userName, userType, kidsClass, title, description, start, end);
	}
	
	//스케줄 리스트
	 public List<Schedule> getList(){
		 return scheduleDAO.selectSchedule();
	 
	 }
	 
	
}
