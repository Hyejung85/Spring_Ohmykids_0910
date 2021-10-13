package com.yeye.ohmykids.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeye.ohmykids.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	//좋아요 입력
	public int createLike(int userId, String type, int targetId) {
		return likeDAO.insertLike(userId, type, targetId);
		
	}
	
	//좋아요 했는지 확인(AlbumController 사용)
	public boolean existLike(int userId, String type, int targetId) {
		int count = likeDAO.selectCountLike(userId, type, targetId);
		
		if(count >= 1) {
			return true;
		}else {
			return false;
		}
	}
	
	//좋아요 갯수
	public int countLike(String type, int targetId) {
		return likeDAO.selectCountByAlbumId(type, targetId);
		
	}
	
	//좋아요 취소
	public int dislike(int userId, String type, int targetId) {
		return likeDAO.deleteLike(userId, type, targetId);
		
	}
	//앨범삭제+좋아요 삭제
	public int deleteLike(String type, int targetId) {
		return likeDAO.deleteLikeByAlbumId(type, targetId);
		
	}
}
