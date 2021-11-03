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
			, @Param("color") String color
			);
	
	//리스트
	public List<Schedule> selectSchedule();
	
	/*
	 * //상세 public Schedule selectScheduleById(@Param("id") int id);
	 */
	
	//수정
	public int updatedSchedule(
			@Param("id") int id
			, @Param("userId") int userId
			, @Param("userName") String userName
			, @Param("userType") String userType
			, @Param("kidsClass") String kidsClass
			, @Param("title") String title
			, @Param("description") String description
			, @Param("color") String color);
	
	//스케줄 삭제
	public int deleteSchedule(@Param("id") int id);
	
}
