package com.yeye.ohmykids.note.model;

import java.util.List;

import com.yeye.ohmykids.comment.model.Comment;
import com.yeye.ohmykids.user.kidsinfo.model.KidsInfo;

public class NoteWithComment {
	private Note note;
	private List<Comment> commentList;
	public Note getNote() {
		return note;
	}
	public void setNote(Note note) {
		this.note = note;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
	
	
	
	

}
