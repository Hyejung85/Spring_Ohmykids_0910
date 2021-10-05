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
import com.yeye.ohmykids.common.MultiFileManagerService;
import com.yeye.ohmykids.imagefile.bo.ImageFileBO;
import com.yeye.ohmykids.like.bo.LikeBO;

@Service
public class AlbumBO {

	@Autowired
	private AlbumDAO albumDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private ImageFileBO imageFileBO;
	
	//앨범 작성
	public int createAlbum(int userId, String userName, String type, int kidsId, String kidsClass, String kidsName
			, String weather, String content, MultipartFile[] files) {
		
		
		// 반복문을 통해서 파일을 하나씩 인서트
		for(String filePath : filePathList) {
			
			if(filePath == null) {
				return -1;
			}
		}
			
		return albumDAO.insertAlbum(userId, userName, type, kidsId, kidsClass, kidsName, weather, content);
	
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
		//코멘트 리스트
		List<Comment> commentList = commentBO.getCommentList(album.getType(), album.getId());
		//좋아요 했는지
		boolean isLike = likeBO.existLike(userId, album.getType(), album.getId());
		//좋아요 갯수
		int likeCount = likeBO.countLike(album.getType(), album.getId());
		
		AlbumWithComment albumWithComment = new AlbumWithComment();
			//앨범
			albumWithComment.setAlbum(album);
			//코멘트
			albumWithComment.setCommentList(commentList);
			//좋아요가 된 상태인지
			albumWithComment.setLike(isLike);
			//좋아요 갯수
			albumWithComment.setLikeCount(likeCount);
			
			albumWithCommentList.add(albumWithComment);
			
		return albumWithCommentList;
	}
	
	//앨범 수정
	public int updateAlbum(int userId, String type, int noteId, int kidsId, String kidsClass, String KidsName, String weather, String content, MultipartFile file) {
		
		//사진 업데이트가 없는 경우 예외 처리
		String filePath = null;
		
		if(file != null) {
			FileManagerService fileManager = new FileManagerService();
			filePath = fileManager.saveFile(userId, file);
			
			if(filePath == null) {
				return -1;
			}
		}
		
		return albumDAO.updateAlbum(userId, noteId, type, kidsId, kidsClass, KidsName, weather, content, filePath);
	}
	
	//앨범 삭제
	public boolean deleteAlbum(int targetId, String type, int userId) {
		//삭제 대상 select
		Album album = albumDAO.selectAlbum(targetId);
		//앨범 삭제
		int count = albumDAO.deleteAlbum(targetId, userId);
		//코멘트부터 삭제 실패하는지 확인
		if(count != 1) {
			return false;
		}
		//파일 삭제
		FileManagerService fileManagerService = new FileManagerService();
		fileManagerService.removeFile(album.getImagePath());	
		//코멘트 삭제
		int commentCount = commentBO.deleteCommentWithNote(targetId, type);
		//좋아요 삭제
		int likeCount = likeBO.deleteLike(type, targetId);
		
		return true;
	}
}
