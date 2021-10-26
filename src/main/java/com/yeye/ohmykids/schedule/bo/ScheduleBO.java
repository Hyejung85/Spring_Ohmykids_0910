package com.yeye.ohmykids.schedule.bo;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeye.ohmykids.schedule.dao.ScheduleDAO;

@Service
public class ScheduleBO {

	@Autowired
	private ScheduleDAO scheduleDAO;
	
	
	public int create(int userId, String userName, String userType, String kidsClass, String title,
			 String description, String  start, String  end) {
		return scheduleDAO.insertSchedule(userId, userName, userType, kidsClass, title, description, start, end);
	}
	
}
