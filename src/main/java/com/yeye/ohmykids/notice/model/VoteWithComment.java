package com.yeye.ohmykids.notice.model;

import java.util.List;

import com.yeye.ohmykids.comment.model.Comment;

public class VoteWithComment {
	
	private Vote vote;
	private List<Comment> commentList;
	
	public Vote getVote() {
		return vote;
	}
	public void setVote(Vote vote) {
		this.vote = vote;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
	

}

