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
	
	//알림장 목록
	public List<Note> selectNoteList();
	
	//알림장 상세
	public Note selectNoteById(
			@Param("id") int id
			, @Param("userId") int userId);
	
	//알림장 수정
	public int updateNote(
			@Param("userId") int userId
			, @Param("id") int id
			, @Param("kidsId") int kidsId
			, @Param("kidsClass") String kidsClass
			, @Param("kidsName") String kidsName
			, @Param("weather") String weather
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	//알림장 삭제
	public int deleteNote(
			@Param("id") int id
			, @Param("userId") int userId);
} 
