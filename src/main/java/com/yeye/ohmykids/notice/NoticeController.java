package com.yeye.ohmykids.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeye.ohmykids.kidsinfo.bo.KidsInfoBO;
import com.yeye.ohmykids.kidsinfo.model.KidsInfo;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private KidsInfoBO kidsInfoBO;
	//입력화면
	@RequestMapping("/create_view")
	public String createView(
			Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userType = (String) session.getAttribute("userType");
		//반정보 중복없이
		List<KidsInfo> kidsClassList = kidsInfoBO.getKidsInfoListGroupByClass();
		model.addAttribute("kidsClassList", kidsClassList);
		
		return "notice/create";
	}
	
	//상세보기/수정화면_공지
	@RequestMapping("/detail_view/typeisnotice")
	public String detailViewNotice() {
		return "notice/detail_notice";
	}
	
	//상세보기/수정화면_투표
	@RequestMapping("/detail_view/typeisvote")
	public String detailViewVote() {
		return "notice/detail_vote";
	}
	
	//리스트화면
	@RequestMapping("/list_view")
	public String listView() {
		return "notice/list";
	}
}
