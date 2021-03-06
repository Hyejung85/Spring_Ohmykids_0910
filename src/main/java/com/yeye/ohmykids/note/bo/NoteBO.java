package com.yeye.ohmykids.note.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.comment.bo.CommentBO;
import com.yeye.ohmykids.comment.model.Comment;
import com.yeye.ohmykids.common.FileManagerService;
import com.yeye.ohmykids.note.dao.NoteDAO;
import com.yeye.ohmykids.note.model.Note;
import com.yeye.ohmykids.note.model.NoteWithComment;

@Service
public class NoteBO {

	@Autowired
	private NoteDAO noteDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	//알림장 작성
	public int noteCreate(int userId, String userName,  String userType, String type, int kidsId, String kidsClass, String kidsName, int parentsId
			, String weather, String content, MultipartFile file) {

		
		//알림장 사진이 없는 경우 예외처리
		String filePath = null;
		
		if(file != null) {
			FileManagerService fileManager = new FileManagerService();
			filePath = fileManager.saveFile(userId, file);
			
			if(filePath == null) {
				return -1;
			}
		}
		
		return noteDAO.insertNote(userId, userName, userType, type, kidsId, kidsClass, kidsName, parentsId, weather, content, filePath);
	}
	
	//알림장 목록
	public List<Note> getNoteList(int parentsId, String userType){
		
		List<Note> noteList = null;
		if(userType.equals("선생님")) {
			noteList = noteDAO.selectNoteList(); //선생님
		}else {
			noteList = noteDAO.selectNoteListForParents(parentsId); //학부모
		}
		return noteList;
	}
	
	//알림장 목록(for parents)
	//	public List<Note> getNoteListForParents(int parentsId){
	//		List<Note> noteList = noteDAO.selectNoteListForParents(parentsId);
	//		return noteList;
	//	}
	
	//알림장 상세
	/*
	 * public List<NoteWithComment> getNote(int id, Integer userId){
	 * 
	 * Note note = noteDAO.selectNoteById(id, userId);
	 * 
	 * List<NoteWithComment> noteWithCommentList = new ArrayList<>(); List<Comment>
	 * commentList = commentBO.getCommentList(note.getType(), note.getId());
	 * 
	 * NoteWithComment noteWithComment = new NoteWithComment();
	 * 
	 * noteWithComment.setNote(note); noteWithComment.setCommentList(commentList);
	 * 
	 * noteWithCommentList.add(noteWithComment);
	 * 
	 * return noteWithCommentList; }
	 */
	
	//알림장 상세(for teacher)
		public List<NoteWithComment> getNoteForTeacher(int id){
			
			Note note = noteDAO.selectNoteByIdForTeacher(id);
			
			List<NoteWithComment> noteWithCommentList = new ArrayList<>();
			List<Comment> commentList = commentBO.getCommentList(note.getType(), note.getId());
			
			NoteWithComment noteWithComment =  new NoteWithComment();
			
			noteWithComment.setNote(note);
			noteWithComment.setCommentList(commentList);
			
			noteWithCommentList.add(noteWithComment);
			
			return noteWithCommentList;
		}
	
	
	//알림장 수정
	public int updateNote(int userId, String userType, String type, int noteId, int kidsId, String kidsClass, String KidsName, int parentsId, String weather, String content, MultipartFile file) {
		
		//사진이 없는 경우 예외처리
		String filePath = null;
		
		if(file != null) {
			FileManagerService fileManager = new FileManagerService();
			filePath = fileManager.saveFile(userId, file);
			
			if(filePath == null) {
				return -1;
			}
		}
		
		return noteDAO.updateNote(userId, noteId, userType, type, kidsId, kidsClass, KidsName, parentsId, weather, content, filePath);
		
	}
	
	//알림장 삭제 (+코멘트도 삭제)
	public boolean deleteNote(int targetId, Integer userId, String type) {
		//삭제 대상 select
		Note note = noteDAO.selectNote(targetId);
		//알림장 삭제
		int count = noteDAO.deleteNote(targetId, userId);
		//코멘트부터 삭제 실패하는지 확인
		if(count != 1) {
			return false;
		}
		
		//삭제할 파일이 없을때 예외처리
		String filePath = null;
		if(filePath != null) {
			FileManagerService fileManagerService = new FileManagerService();
			fileManagerService.removeFile(note.getImagePath());	
		}
		//코멘트삭제
		int commentCount = commentBO.deleteCommentWithNote(targetId, type);
		
		return true;
	}
	
}
