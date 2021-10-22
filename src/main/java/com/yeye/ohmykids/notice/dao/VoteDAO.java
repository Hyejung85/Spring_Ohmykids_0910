package com.yeye.ohmykids.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.notice.model.NoticeWithComment;
import com.yeye.ohmykids.notice.model.Vote;

@Repository
public interface VoteDAO {

	//투표 작성
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
	
	//공지 목록
	public List<Vote> selectVoteList();
	
	//공지 상세
	public Vote selectVote(@Param("id") int id);
}
