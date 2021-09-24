package com.yeye.ohmykids.comment;

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

import com.yeye.ohmykids.comment.bo.CommentBO;

@RestController
@RequestMapping("/comment")
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;

	//댓글 작성
	@PostMapping("/create")
	public Map<String, String> create(
			@RequestParam("type") String type
			,@RequestParam("targetId") int targetId
			, @RequestParam("content") String content
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Map<String, String> result = new HashMap<>();
		
		int count = commentBO.createComment(userId, userName, type, targetId, content);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	//댓글삭제 (댓글만 삭제, note, album이 삭제될때는 noteBO, albumBO에서 처리)
	@GetMapping("/delete")
	public Map<String, String> delete(
			@RequestParam("id") int id
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String, String> result = new HashMap<>();
		
		int count = commentBO.deleteComment(id);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
}
