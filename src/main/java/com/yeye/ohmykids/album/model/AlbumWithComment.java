package com.yeye.ohmykids.album.model;

import java.util.List;

import com.yeye.ohmykids.comment.model.Comment;
import com.yeye.ohmykids.imagefile.model.ImageFile;

public class AlbumWithComment {
	private Album album;
	private List<Comment> commentList;
	private List<ImageFile> imageFileList;
	private boolean isLike;
	private int likeCount;
	
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
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
	
}
