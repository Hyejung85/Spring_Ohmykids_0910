package com.yeye.ohmykids.notice.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeye.ohmykids.notice.dao.VoteDAO;

@Service
public class VoteBO {

	@Autowired
	private VoteDAO voteDAO;
	
	public int addVote(String postType, int userId, String userName, String userType, String kidsClass
			, String noticeType, String weather, String title, String description, String endDate) {
		return voteDAO.insertVote(postType, userId, userName, userType, kidsClass, noticeType, weather, title, description, endDate);
	}
}
