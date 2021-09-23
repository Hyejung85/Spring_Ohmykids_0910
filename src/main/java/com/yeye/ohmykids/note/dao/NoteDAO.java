package com.yeye.ohmykids.note.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.note.model.Note;

@Repository
public interface NoteDAO {

	//앎림장 작성
	public int insertNote(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("kidsId") int kidsId
			, @Param("kidsClass") String kidsClass
			, @Param("kidsName") String kidsName
			, @Param("weather") String weather
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	//알림장목록
	public List<Note> selectNoteList();
} 
