package com.yeye.ohmykids.notice.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.common.FileManagerService;
import com.yeye.ohmykids.notice.dao.NoticeDAO;

@Service
public class NoticeBO {

	@Autowired
	private NoticeDAO noticeDAO;
	
	//공지 입력
	public int addNotice(String postType, int userId, String userName, String userType, String kidsClass
			, String noticeType, String weather, String title, String description, MultipartFile file) {
		
		//공지 사진이 없는 경우 예외 처리
		String filePath = null;
		
		if(file != null) {
			FileManagerService fileManager = new FileManagerService();
			filePath = fileManager.saveFile(userId, file);
			
			if(filePath == null) {
				return -1;
			}					
		}
		return noticeDAO.insertNotice(postType, userId, userName, userType, kidsClass, noticeType, weather, title, description, filePath);
	}
}
