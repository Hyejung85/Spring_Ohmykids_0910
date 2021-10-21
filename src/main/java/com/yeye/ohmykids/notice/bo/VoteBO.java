package com.yeye.ohmykids.notice.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeye.ohmykids.notice.dao.VoteDAO;
import com.yeye.ohmykids.notice.model.Vote;

@Service
public class VoteBO {

	@Autowired
	private VoteDAO voteDAO;
	
	//투표 입력
	public int addVote(String postType, int userId, String userName, String userType, String kidsClass
			, String noticeType, String weather, String title, String description, String endDate) {
		return voteDAO.insertVote(postType, userId, userName, userType, kidsClass, noticeType, weather, title, description, endDate);
	}
	
	//공지 목록(noticeBO 연결)
	public List<Vote> getVoteList(){
		return voteDAO.selectVoteList();	
	}
}
