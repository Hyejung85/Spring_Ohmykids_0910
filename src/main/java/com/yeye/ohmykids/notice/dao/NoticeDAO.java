package com.yeye.ohmykids.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.notice.model.Notice;

@Repository
public interface NoticeDAO {

	//공지 입력
	public int insertNotice(
			@Param("postType") String postType
			, @Param("userId") int userId
			, @Param("userName") String userName
			, @Param("userType") String userType
			, @Param("kidsClass") String kidsClass
			, @Param("noticeType") String noticeType
			, @Param("weather") String weather
			, @Param("title") String tilte
			, @Param("description") String description
			, @Param("imagePath") String imagePath);
	
	//공지 상세
	public Notice selectNoticeById(@Param("id") int id);
	
	//공지 목록
	public List<Notice> selectNoticeList();
	
	//공지 업데이트
	public int updateNotice(
			 @Param("postType") String postType
			, @Param("id") int id //noticeId
			, @Param("userId") int userId
			, @Param("userName") String userName
			, @Param("userType") String userType
			, @Param("kidsClass") String kidsClass
			, @Param("noticeType") String noticeType
			, @Param("weather") String weather
			, @Param("title") String tilte
			, @Param("description") String description
			, @Param("imagePath") String imagePath);
	
}
