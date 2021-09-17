package com.yeye.ohmykids.note;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
