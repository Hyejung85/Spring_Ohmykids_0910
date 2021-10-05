package com.yeye.ohmykids.imagefile.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.common.MultiFileManagerService;
import com.yeye.ohmykids.imagefile.dao.ImageFileDAO;

@Service
public class ImageFileBO {
	
	@Autowired
	private ImageFileDAO imageFileDAO;

	//이미지 파일 저장
	public int createImageFile(int userId, String type, int targetId, MultipartFile[] files) {
		
		for(MultipartFile file:files) {
			MultiFileManagerService multiFileManager = new MultiFileManagerService();
			String filePath = multiFileManager.saveFile(userId, type, targetId, file);
			
			if(filePath == null) {
				return -1;
			}
		}
		return imageFileDAO.insertImgeFile(userId, type, targetId, filePath);
	}
}
