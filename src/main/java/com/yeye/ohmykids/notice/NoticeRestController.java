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
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.notice.bo.NoticeBO;

@RestController
@RequestMapping("/notice/notice")
public class NoticeRestController {

	@Autowired
	private NoticeBO noticeBO;
	
	@PostMapping("/create")
	public Map<String, String> addNotice(
			@RequestParam("postType") String postType
			, @RequestParam("kidsClass") String kidsClass
			, @RequestParam("noticeType") String noticeType
			, @RequestParam(value="weather", required=false) String weather
			, @RequestParam("title") String title
			, @RequestParam("description") String description
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		String userType = (String) session.getAttribute("userType");
		
		int count = noticeBO.addNotice(postType, userId, userName, userType, kidsClass, noticeType, weather, title, description, file);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;	
	}
	
	//공지 수정
	@PostMapping("/update")
	public Map<String, String> updateNotice(
			@RequestParam("postType") String postType
			, @RequestParam("noticeId") int noticeId
			, @RequestParam("kidsClass") String kidsClass
			, @RequestParam(value="noticeType", required=false) String noticeType
			, @RequestParam(value="weather", required=false) String weather
			, @RequestParam("title") String title
			, @RequestParam("description") String description
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		String userType = (String) session.getAttribute("userType");
		
		int count = noticeBO.updateNotice(postType, userId, noticeId, userName, userType, kidsClass, noticeType, weather, title, description, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;	
	}
	
	//공지 삭제
//	@GetMapping("/delete")
//	public int deleteNotice(@RequestParam("id") int id) {
//		
//	}
}
