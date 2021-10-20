package com.yeye.ohmykids.notice.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VoteDAO {

	public int insertVote(
			@Param("postType") String postType
			, @Param("userId") int userId
			, @Param("userName") String userName
			, @Param("userType") String userType
			, @Param("kidsClass") String kidsClass
			, @Param("noticeType") String noticeType
			, @Param("weather") String weather
			, @Param("title") String tilte
			, @Param("description") String description
			, @Param("endDate") String endDate
			);
}
