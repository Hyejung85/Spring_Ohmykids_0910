package com.yeye.ohmykids.notice.model;

import java.util.List;

import com.yeye.ohmykids.comment.model.Comment;

public class NoticeWithComment {
	private Notice notice;
	private Vote vote;
	private List<Comment> commentList;
	
	
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public Vote getVote() {
		return vote;
	}
	public void setVote(Vote vote) {
		this.vote = vote;
	}
	
	

}
