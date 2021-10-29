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
			 String description, Date start, Date end, String color) {
		return scheduleDAO.insertSchedule(userId, userName, userType, kidsClass, title, description, start, end, color);
	}
	
	//스케줄 리스트
	 public List<Schedule> getList(){
		 return scheduleDAO.selectSchedule();
	 
	 }
	 
	 //스케줄 상세
	 public Schedule getSchedule(int id) {
		 return scheduleDAO.selectScheduleById(id);
	 }
	 
	 //스케줄 수정
	 public int updateSchedule(int userId, String userName, String userType, String kidsClass, String title,
			 String description, Date start, Date end, String color) {
		 return scheduleDAO.updatedSchedule(userId, userName, userType, kidsClass, title, description, start, end, color);
	 }
	 
	 //스케줄 삭제
	 public int deleteSchedule(int id) {
		 return scheduleDAO.deleteSchedule(id);
	 }
	
}
