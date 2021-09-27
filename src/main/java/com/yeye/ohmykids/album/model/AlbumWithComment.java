package com.yeye.ohmykids.album.model;

import java.util.List;

import com.yeye.ohmykids.comment.model.Comment;

public class AlbumWithComment {
	private Album album;
	private List<Comment> commentList;
	
	public Album getAlbum() {
		return album;
	}
	public void setAlbum(Album album) {
		this.album = album;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
}
