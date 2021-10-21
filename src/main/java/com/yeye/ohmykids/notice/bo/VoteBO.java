package com.yeye.ohmykids.notice.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeye.ohmykids.comment.bo.CommentBO;
import com.yeye.ohmykids.comment.model.Comment;
import com.yeye.ohmykids.notice.dao.VoteDAO;
import com.yeye.ohmykids.notice.model.NoticeWithComment;
import com.yeye.ohmykids.notice.model.Vote;

@Service
public class VoteBO {

	@Autowired
	private VoteDAO voteDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	//투표 입력
	public int addVote(String postType, int userId, String userName, String userType, String kidsClass
			, String noticeType, String weather, String title, String description, String endDate) {
		return voteDAO.insertVote(postType, userId, userName, userType, kidsClass, noticeType, weather, title, description, endDate);
	}
	
	//공지 목록(noticeBO 연결)
	public List<Vote> getVoteList(){
		return voteDAO.selectVoteList();	
	}
	
	//공지 상세(+코멘트)
	public List<NoticeWithComment> getVote(int id){
		//공지 한개
		Vote vote = voteDAO.selectVote(id);
		//코멘트 리스트
		List<Comment> commentList = commentBO.getCommentList(vote.getPostType(), vote.getId());
		//리스트 생성
		List<NoticeWithComment> voteWithCommentList = new ArrayList<>();
		//객체 생성
		NoticeWithComment noticeWithComment = new NoticeWithComment();
		//객체에 공지 담는다.
		noticeWithComment.setVote(vote);
		//객체에 코멘트리스트 담는다.
		noticeWithComment.setCommentList(commentList);
		
		//객체를 리스트에 담는다.
		voteWithCommentList.add(noticeWithComment);
		
		return voteWithCommentList;
	}
}
