package com.yeye.ohmykids.album.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.album.dao.AlbumDAO;
import com.yeye.ohmykids.album.model.Album;
import com.yeye.ohmykids.common.FileManagerService;

@Service
public class AlbumBO {

	@Autowired
	private AlbumDAO albumDAO;
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
}
