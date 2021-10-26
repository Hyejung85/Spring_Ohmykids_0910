package com.yeye.ohmykids.schedule.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository

public interface ScheduleDAO {

	public int insertSchedule(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("userType") String userType
			, @Param("kidsClass") String kidsClass
			, @Param("title") String title
			, @Param("description") String description
			, @Param("start") String start
			, @Param("end") String end
			);
}
