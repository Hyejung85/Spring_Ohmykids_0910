package com.yeye.ohmykids.note;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeye.ohmykids.user.kidsinfo.model.KidsInfo;

@Controller
@RequestMapping("/note")
public class NoteController {

	//알림장 작성
	@RequestMapping("/create_view")
	public String noteCreateView() {
		return "note/create";
	}
	
	//알림장 상세
	@RequestMapping("/detail_view")
	public String noteDetailView() {
		return "note/detail";
	}
	
	//알림장 목록
	@RequestMapping("/list_view")
	public String noteListView() {
		return "note/list";
	}
	
}
