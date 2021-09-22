package com.yeye.ohmykids.note;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeye.ohmykids.note.bo.NoteBO;
import com.yeye.ohmykids.note.model.Note;

@Controller
@RequestMapping("/note")
public class NoteController {
	
	@Autowired
	private NoteBO noteBO;

	//알림장 작성 + kidsInfoList
	@RequestMapping("/create_view")
	public String noteCreateView() {
		return "note/create";
	}
	
	//알림장 상세
	@RequestMapping("/detail_view")
	public String noteDetailView() {
		return "note/detail";
	}
	
	//알림장 목록 + kidsInfoList
	@RequestMapping("/list_view")
	public String noteListView(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		List<Note> noteList = noteBO.getNoteList();
		model.addAttribute("noteList", noteList);
		
		return "note/list";
	}
	
}
