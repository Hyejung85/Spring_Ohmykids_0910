package com.yeye.ohmykids.notice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yeye.ohmykids.notice.bo.VoteBO;

@RestController
@RequestMapping("/notice/vote")
public class VoteRestController {

	@Autowired
	private VoteBO voteBO;
	
	
	//투표 입력
	@PostMapping("/create")
	public Map<String, String> addVote(
			@RequestParam("postType") String postType
			, @RequestParam("kidsClass") String kidsClass
			, @RequestParam("noticeType") String noticeType
			, @RequestParam(value="weather", required=false) String weather
			, @RequestParam("title") String title
			, @RequestParam("description") String description
			, @RequestParam("endDate") String endDate
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		String userType = (String) session.getAttribute("userType");
		
		int count = voteBO.addVote(postType, userId, userName, userType, kidsClass, noticeType, weather, title, description, endDate);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	//투표 수정
	@PostMapping("/update")
	public Map<String, String> updateVote(
			@RequestParam("postType") String postType
			, @RequestParam("voteId") int voteId
			, @RequestParam("kidsClass") String kidsClass
			, @RequestParam("noticeType") String noticeType
			, @RequestParam(value="weather", required=false) String weather
			, @RequestParam("title") String title
			, @RequestParam("description") String description
			, @RequestParam("endDate") String endDate
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		String userType = (String) session.getAttribute("userType");
		
		Map<String, String> result = new HashMap<>();
		
		int count = voteBO.updateVote(postType, voteId, userId, userName, userType, kidsClass, noticeType, weather, title, description, endDate);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	//투표 삭제
	@GetMapping("/delete")
	public Map<String, String> deleteVote(
			@RequestParam("id") int id
			, @RequestParam("noticeType") String noticeType
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		Map<String, String> result = new HashMap<>();
		
		if(voteBO.deleteVote(id, noticeType, userId)) {
			result.put("result", "success");
		}else{
			result.put("result", "fail");
		}
		return result;
	}
	
}
