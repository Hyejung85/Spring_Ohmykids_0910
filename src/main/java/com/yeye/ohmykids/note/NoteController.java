package com.yeye.ohmykids.note;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeye.ohmykids.kidsinfo.bo.KidsInfoBO;
import com.yeye.ohmykids.kidsinfo.model.KidsInfo;
import com.yeye.ohmykids.note.bo.NoteBO;
import com.yeye.ohmykids.note.model.Note;
import com.yeye.ohmykids.note.model.NoteWithComment;

@Controller
@RequestMapping("/note")
public class NoteController {
	
	@Autowired
	private NoteBO noteBO;
	
	@Autowired
	private KidsInfoBO kidsInfoBO;

	//알림장 작성
	@RequestMapping("/create_view")
	public String noteCreateView(
			Model model
			,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		//kidsInfoList보여주기(학부모-본인자녀만)
		List<KidsInfo> kidsInfoList = kidsInfoBO.getKidsInfoList(userId);
		model.addAttribute("kidsInfoList", kidsInfoList);
	
		//kidsInfoList보여주기(선생님-전체)
		List<KidsInfo> kidsInfoListForTeacher = kidsInfoBO.getKidsInfoListForTeacher();
		model.addAttribute("kidsInfoListForTeacher", kidsInfoListForTeacher);
		
		return "note/create";
	}
	
	//알림장 상세, 수정화면
	@RequestMapping("/detail_view")
	public String noteDetailView(
			@RequestParam("id") int id
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		//note + comment(학부모-본인자녀만)
		List<NoteWithComment> noteDetailList = noteBO.getNote(id, userId);
		model.addAttribute("noteDetailList", noteDetailList);
		
		//note + comment(선생님-전체)
		List<NoteWithComment> noteDetailListForTeacher = noteBO.getNoteForTeacher(id);
		model.addAttribute("noteDetailListForTeacher", noteDetailListForTeacher);
		
		//kidsInfoList보여주기(학부모-본인자녀만)
		List<KidsInfo> kidsInfoList = kidsInfoBO.getKidsInfoList(userId);
		model.addAttribute("kidsInfoList", kidsInfoList);
			
		//kidsInfoList보여주기(선생님-전체)
		List<KidsInfo> kidsInfoListForTeacher = kidsInfoBO.getKidsInfoListForTeacher();
		model.addAttribute("kidsInfoListForTeacher", kidsInfoListForTeacher);
		
		return "note/detail";
	}
	
	//알림장 목록 
	@RequestMapping("/list_view")
	public String noteListView(Model model
			,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		List<Note> noteList = noteBO.getNoteList();
		model.addAttribute("noteList", noteList);
		
		//kidsInfoList보여주기(학부모-본인자녀만)
		List<KidsInfo> kidsInfoList = kidsInfoBO.getKidsInfoList(userId);
		model.addAttribute("kidsInfoList", kidsInfoList);
			
		//kidsInfoList보여주기(선생님-전체)
		List<KidsInfo> kidsInfoListForTeacher = kidsInfoBO.getKidsInfoListForTeacher();
		model.addAttribute("kidsInfoListForTeacher", kidsInfoListForTeacher);
		
		return "note/list";
	}
	
}
