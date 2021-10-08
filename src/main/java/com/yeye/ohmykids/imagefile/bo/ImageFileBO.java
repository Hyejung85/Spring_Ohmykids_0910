package com.yeye.ohmykids.imagefile.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.album.bo.AlbumBO;
import com.yeye.ohmykids.album.dao.AlbumDAO;
import com.yeye.ohmykids.album.model.Album;
import com.yeye.ohmykids.album.model.AlbumWithComment;
import com.yeye.ohmykids.common.MultiFileManagerService;
import com.yeye.ohmykids.imagefile.dao.ImageFileDAO;
import com.yeye.ohmykids.imagefile.model.ImageFile;

@Service
public class ImageFileBO {
	
	@Autowired
	private ImageFileDAO imageFileDAO;

	//이미지 파일 저장 (리스트로 저장)
	public int addImageFiles(int userId, String type, int targetId, MultipartFile[] files) {
		
			
			MultiFileManagerService multiFileManager = new MultiFileManagerService();
			List<String> filePathList = multiFileManager.saveFile(userId, type, targetId, files);
			
				if(files == null) {
					return -1;
				}
				
			List<Map<String, Object>> imageFiles = new ArrayList<>();
			for(String path: filePathList) {
				Map<String, Object> item = new HashMap<>();
				item.put("userId", userId);
				item.put("type", type);
				item.put("targetId", targetId);
				item.put("imagePath", path);
				
				imageFiles.add(item);
				
			}
			
			return imageFileDAO.insertImageFiles(imageFiles);
	}
	
	//앨범 리스트에 이미지 보여주기
	public List<ImageFile> getImageFileList(int targetId, String type) {
		List<ImageFile> imageFileList = imageFileDAO.selectImageFiles(targetId, type);
		
		return imageFileList;
	}
	
	
	//이미지 파일 삭제
	public int deleteImageFiles(int targetId, String type, int userId) {
		
		List<ImageFile> imageFileList = imageFileDAO.selectImageFiles(targetId, type);
			
			// 파일 디렉토리 삭제 로직
			MultiFileManagerService multiFileManagerService = new MultiFileManagerService(); 
			multiFileManagerService.removeFile(imageFileList);
			
		return imageFileDAO.deleteImageWithAlbum(targetId, type);
	}
}
