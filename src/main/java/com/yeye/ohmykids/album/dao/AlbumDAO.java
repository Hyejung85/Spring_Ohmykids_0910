package com.yeye.ohmykids.album.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.album.model.Album;
import com.yeye.ohmykids.album.model.AlbumWithComment;

@Repository
public interface AlbumDAO {

	//앨범 입력
	public int insertAlbum(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("type") String type
			, @Param("kidsId") int kidsId
			, @Param("kidsClass") String kidsClass
			, @Param("kidsName") String kidsName
			, @Param("weather") String weather
			, @Param("content") String content);
			//, @Param("imagePath") String imagePath);
	
	//앨범 리스트
	public List<Album> selectAlbumList();
	
	//앨범 상세(+코멘트)
	public Album selectAlbumById(
			@Param("id") int id
			, @Param("userId") int userId);
	
	//앨범 수정
	public int updateAlbum(
			@Param("userId") int userId
			, @Param("id") int id //albumId
			, @Param("type") String type
			, @Param("kidsId") int kidsId
			, @Param("kidsClass") String kidsClass
			, @Param("kidsName") String kidsName
			, @Param("weather") String weather
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	//앨범 삭제
	public int deleteAlbum(
			@Param("id") int id
			, @Param("userId") int userId);
	
	//파일 삭제
	public Album selectAlbum(@Param("id") int id);

	
}
