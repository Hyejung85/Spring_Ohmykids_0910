package com.yeye.ohmykids.notice.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.comment.bo.CommentBO;
import com.yeye.ohmykids.comment.model.Comment;
import com.yeye.ohmykids.common.FileManagerService;
import com.yeye.ohmykids.notice.dao.NoticeDAO;
import com.yeye.ohmykids.notice.model.Notice;
import com.yeye.ohmykids.notice.model.NoticeWithComment;
import com.yeye.ohmykids.notice.model.Vote;

@Service
public class NoticeBO {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private CommentBO commentBO;
	
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
	
	//공지 상세 (+comment)
	public List<NoticeWithComment> getNotice(int id) {
				
		//공지 한개
		Notice notice = noticeDAO.selectNoticeById(id);
		
		//리스트 생성
		List<NoticeWithComment> noticeWithCommentList = new ArrayList<>();
		
		//코멘트 리스트
		List<Comment> commentList = commentBO.getCommentList(notice.getNoticeType(), notice.getId());
		
		//객체 생성
		NoticeWithComment noticeWithComment = new NoticeWithComment();
		
		//객체에 공지 하나 담는다.
		noticeWithComment.setNotice(notice);
		//객체에 코멘트 리스트 담는다.
		noticeWithComment.setCommentList(commentList);
		
		//객체를 리스트에 담는다.
		noticeWithCommentList.add(noticeWithComment);
		
		return noticeWithCommentList;	
	}
	
	//공지목록
	public List<Notice> getNoticeList(){
		return noticeDAO.selectNoticeList();
	}
	
	//공지 수정
	public int updateNotice(String postType, int noticeId, int userId, String userName, String userType, String kidsClass
			, String noticeType, String weather, String title, String description, MultipartFile file) {
		
		//사진이 없는 경우 예외처리
		String filePath = null;
		
		if(file != null) {
			FileManagerService fileManager = new FileManagerService();
			filePath = fileManager.saveFile(userId, file);
			
			if(filePath == null) {
				return -1;
			}
		}
		return noticeDAO.updateNotice(postType, userId, noticeId, userName, userType, kidsClass, noticeType, weather, title, description, filePath);
	}
	
	//공지 삭제
	public boolean deleteNotice(int id, Integer userId, String noticeType) {
		//삭제대상 선택
		Notice notice = noticeDAO.selectNoticeById(id);
		//공지 삭제
		int count = noticeDAO.deleteNotice(id, userId, noticeType);
		//삭제 실패하는지 확인
		if(count != 1) {
			return false;
		}
		//삭제할 파일이 없을대 예외 처리
		String filePath = null;
		if(filePath != null) {
			FileManagerService fileManagerService = new FileManagerService();
			fileManagerService.removeFile(filePath);
		}
		
		//코멘트 삭제
		int commentCount = commentBO.deleteCommentWithNote(id, noticeType);
		
		return true;
	}
}
