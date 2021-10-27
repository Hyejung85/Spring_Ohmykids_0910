package com.yeye.ohmykids.schedule.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.schedule.model.Schedule;

@Repository

public interface ScheduleDAO {

	//스케줄 입력
	public int insertSchedule(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("userType") String userType
			, @Param("kidsClass") String kidsClass
			, @Param("title") String title
			, @Param("description") String description
			, @Param("start") Date start
			, @Param("end") Date end
			);
	
	//리스트
	public List<Schedule> selectSchedule();
	
}
