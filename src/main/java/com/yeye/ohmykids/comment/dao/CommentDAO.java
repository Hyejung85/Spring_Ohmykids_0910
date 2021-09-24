package com.yeye.ohmykids.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.comment.model.Comment;

@Repository
public interface CommentDAO {

	//코멘트입력
	public int insertComment(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("type") String type
			, @Param("targetId") int targetId
			, @Param("content") String content);
	
	//코멘트리스트
	public List<Comment> selectCommentByTargetId(
			@Param("type") String type
			, @Param("targetId") int targetId);
	
	//코멘트만 삭제
	public int deleteCommentById(@Param("id") int id);
	
	//알림장삭제하면서 코멘트 삭제
	public int deleteCommentWithNote(
			@Param("targetId") int targetId
			, @Param("type") String type);
}
