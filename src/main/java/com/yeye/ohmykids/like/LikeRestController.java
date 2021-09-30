package com.yeye.ohmykids.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yeye.ohmykids.like.bo.LikeBO;

@RestController
@RequestMapping("/like")
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;

	//좋아요 입력
	@GetMapping("/create")
	public Map<String, Object> create(
			@RequestParam("type") String type
			, @RequestParam("targetId") int targetId
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> likeList = new HashMap<>();
		int like = likeBO.createLike(userId, type, targetId);
		int likeCount = likeBO.countLike(type, targetId); 
		
		if(like == 1) {
			likeList.put("likeList", "success");
			likeList.put("likeCount", likeCount);
		}else {
			likeList.put("likeList", "fail");
		}
		return likeList;
	}
	
	//좋아요 취소
	@GetMapping("/delete")
	public Map<String, Object> dislike(
			@RequestParam("type") String type
			, @RequestParam("targetId") int targetId
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> dislikeList = new HashMap<>();
		int dislike = likeBO.dislike(userId, type, targetId);
		int likeCount = likeBO.countLike(type, targetId); 
		
		if(dislike == 1) {
			dislikeList.put("dislikeList", "success");
			dislikeList.put("likeCount", likeCount);
		}else {
			dislikeList.put("dislikeList", "fail");
		}
		return dislikeList;
		
	}
}
