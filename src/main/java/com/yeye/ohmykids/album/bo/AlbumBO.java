package com.yeye.ohmykids.album.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.album.dao.AlbumDAO;
import com.yeye.ohmykids.album.model.Album;
import com.yeye.ohmykids.album.model.AlbumWithComment;
import com.yeye.ohmykids.comment.bo.CommentBO;
import com.yeye.ohmykids.comment.model.Comment;
import com.yeye.ohmykids.common.FileManagerService;

@Service
public class AlbumBO {

	@Autowired
	private AlbumDAO albumDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	//앨범 작성
	public int createAlbum(int userId, String userName, String type, int kidsId, String kidsClass, String kidsName
			, String weather, String content, MultipartFile file) {
		
		FileManagerService fileManager = new FileManagerService();
		String filePath = fileManager.saveFile(userId, file);
		
		if(filePath == null) {
			return -1;
		}
		
		return albumDAO.insertAlbum(userId, userName, type, kidsId, kidsClass, kidsName, weather, content, filePath);
	}
	
	//앨범 목록
	public List<Album> getAlbumList(){
		List<Album> albumList = albumDAO.selectAlbumList();
		return albumList;
	}
	
	//앨범 상세
	public List<AlbumWithComment> getAlbum(int id, Integer userId){
		Album album = albumDAO.selectAlbumById(id, userId);
		
		List<AlbumWithComment> albumWithCommentList = new ArrayList<>();
		List<Comment> commentList = commentBO.getCommentList(album.getType(), album.getId());
		
		AlbumWithComment albumWithComment = new AlbumWithComment();
		
		albumWithComment.setAlbum(album);
		albumWithComment.setCommentList(commentList);
		
		albumWithCommentList.add(albumWithComment);
		
		return albumWithCommentList;
	}
	
	//앨범 수정
	public int updateAlbum(int userId, String type, int noteId, int kidsId, String kidsClass, String KidsName, String weather, String content, MultipartFile file) {
		
		FileManagerService fileManager = new FileManagerService();
		String filePath = fileManager.saveFile(userId, file);
		
		if(filePath == null) {
			return -1;
		}
		return albumDAO.updateAlbum(userId, noteId, type, kidsId, kidsClass, KidsName, weather, content, filePath);
	}
}
