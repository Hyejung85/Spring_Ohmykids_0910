package com.yeye.ohmykids.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeye.ohmykids.comment.dao.CommentDAO;
import com.yeye.ohmykids.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;

	//코멘트입력
	public int createComment(int userId, String userName, String type, int targetId, String content) {
		return commentDAO.insertComment(userId, userName, type, targetId, content);
	}
	
	//코멘트리스트
	public List<Comment> getCommentList(String type, int targetId){
		return commentDAO.selectCommentByTargetId(type, targetId);
		
	}
	
	//코멘트만 삭제
	public int deleteComment(int id) {
		return commentDAO.deleteCommentById(id);
	}
	
	//알림장삭제시 코멘트삭제 (noteBO에서 처리)
	public int deleteCommentWithNote(int targetId, String type) {
		return commentDAO.deleteCommentWithNote(targetId, type);
	}
}
