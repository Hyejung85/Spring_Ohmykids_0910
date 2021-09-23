package com.yeye.ohmykids.note.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.common.FileManagerService;
import com.yeye.ohmykids.note.dao.NoteDAO;
import com.yeye.ohmykids.note.model.Note;
import com.yeye.ohmykids.note.model.NoteWithKidsInfo;
import com.yeye.ohmykids.user.kidsinfo.bo.KidsInfoBO;
import com.yeye.ohmykids.user.kidsinfo.model.KidsInfo;

@Service
public class NoteBO {

	@Autowired
	private NoteDAO noteDAO;
	
	
	//알림장 작성
	public int noteCreate(int userId, String userName,  int kidsId, String kidsClass, String kidsName
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
		
		return noteDAO.insertNote(userId, userName, kidsId, kidsClass, kidsName, weather, content, filePath);
	}
	
	// 알림장 목록 (+kidsInfo)
	public List<Note> getNoteList(){
		List<Note> noteList = noteDAO.selectNoteList();
		return noteList;
	}
}
