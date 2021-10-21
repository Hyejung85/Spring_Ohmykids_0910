package com.yeye.ohmykids.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeye.ohmykids.kidsinfo.bo.KidsInfoBO;
import com.yeye.ohmykids.kidsinfo.model.KidsInfo;
import com.yeye.ohmykids.notice.bo.NoticeBO;
import com.yeye.ohmykids.notice.bo.VoteBO;
import com.yeye.ohmykids.notice.model.Notice;
import com.yeye.ohmykids.notice.model.NoticeWithComment;
import com.yeye.ohmykids.notice.model.Vote;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private KidsInfoBO kidsInfoBO;
	
	@Autowired
	private NoticeBO noticeBO;
	
	@Autowired
	private VoteBO voteBO;
	
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
	public String detailViewNotice(
			@RequestParam("id") int id
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userType = (String) session.getAttribute("userType");
		
		//반정보 중복없이
		List<KidsInfo> kidsClassList = kidsInfoBO.getKidsInfoListGroupByClass();
		model.addAttribute("kidsClassList", kidsClassList);
		
		//공지&코멘트 리스트
		List<NoticeWithComment> noticeWithCommentList = noticeBO.getNotice(id);
		model.addAttribute(noticeWithCommentList);
		
		return "notice/detail_notice";
	}
	
	//상세보기/수정화면_투표
	@RequestMapping("/detail_view/typeisvote")
	public String detailViewVote(
			@RequestParam("id") int id
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userType = (String) session.getAttribute("userType");
		
		//반정보 중복없이
		List<KidsInfo> kidsClassList = kidsInfoBO.getKidsInfoListGroupByClass();
		model.addAttribute("kidsClassList", kidsClassList);
		
		//투표&코멘트 리스트
		List<NoticeWithComment> voteWithCommentList = voteBO.getVote(id);
		model.addAttribute("voteWithCommentList",voteWithCommentList);
		
		return "notice/detail_vote";
	}
	
	//리스트화면
	@RequestMapping("/list_view")
	public String listView(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userType = (String) session.getAttribute("userType");
		
		//반정보 중복없이
		List<KidsInfo> kidsClassList = kidsInfoBO.getKidsInfoListGroupByClass();
		model.addAttribute("kidsClassList", kidsClassList);
				
		//vote List
		List<Vote> voteList = voteBO.getVoteList();
		model.addAttribute("voteList", voteList);
		
		//notice List
		List<Notice> noticeList = noticeBO.getNoticeList();
		model.addAttribute("noticeList", noticeList);
				
		
		return "notice/list";
	}
}
