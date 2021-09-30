package com.yeye.ohmykids.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	//좋아요 입력
	public int insertLike(
			@Param("userId") int userId
			, @Param("type") String type
			, @Param("targetId") int targetId);
	
	//좋아요 했는지
	public int selectCountLike(
			@Param("userId") int userId
			, @Param("type") String type
			, @Param("targetId") int targetId);
	
	//좋아요 갯수
	public int selectCountByAlbumId(
			@Param("type") String type
			, @Param("targetId") int targetId);
	
	//좋아요 취소
	public int deleteLike(
			@Param("userId") int userId
			, @Param("type") String type
			, @Param("targetId") int targetId);
	
	//앨범삭제+좋아요 삭제
	public int deleteLikeByAlbumId(
			@Param("type") String type
			, @Param("targetId") int targetId);
	
}
