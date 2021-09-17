package com.yeye.ohmykids.note.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface NoteDAO {

	//앎림장 작성
	public int insertNote(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("kidsClass") String kidsClass
			, @Param("kidsName") String kidsName
			, @Param("weather") String weather
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
}
