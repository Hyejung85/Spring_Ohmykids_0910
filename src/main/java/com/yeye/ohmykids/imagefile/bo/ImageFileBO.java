package com.yeye.ohmykids.imagefile.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.album.dao.AlbumDAO;
import com.yeye.ohmykids.album.model.Album;
import com.yeye.ohmykids.common.MultiFileManagerService;
import com.yeye.ohmykids.imagefile.dao.ImageFileDAO;

@Service
public class ImageFileBO {
	
	@Autowired
	private ImageFileDAO imageFileDAO;
	

	//이미지 파일 저장
	public int addImageFiles(int userId, String type, int targetId, MultipartFile[] files) {
		
		
			targetId = Album.getId(); //insert하면서 생성된 targetId 가져오기
			
			MultiFileManagerService multiFileManager = new MultiFileManagerService();
			List<String> filePathList = multiFileManager.saveFile(userId, type, targetId, files);
			
			if(filePathList == null) {
				return -1;
			}
		
		return imageFileDAO.insertImgeFiles(userId, type, targetId, filePathList);
	}
}
