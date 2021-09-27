package com.yeye.ohmykids.album.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.album.model.Album;

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
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	//앨범 리스트
	public List<Album> selectAlbumList();
}
