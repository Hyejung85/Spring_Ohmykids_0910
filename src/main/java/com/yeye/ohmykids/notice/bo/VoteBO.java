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
import com.yeye.ohmykids.notice.model.VoteWithComment;

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
	public List<VoteWithComment> getVote(int id){
		//공지 한개
		Vote vote = voteDAO.selectVote(id);
		
		//리스트 생성
		List<VoteWithComment> voteWithCommentList = new ArrayList<>();
		
		//코멘트 리스트
		List<Comment> commentList = commentBO.getCommentList(vote.getNoticeType(), vote.getId());
		
		//객체 생성
		VoteWithComment voteWithComment = new VoteWithComment();
		//객체에 공지 담는다.
		voteWithComment.setVote(vote);
		//객체에 코멘트리스트 담는다.
		voteWithComment.setCommentList(commentList);
		
		//객체를 리스트에 담는다.
		voteWithCommentList.add(voteWithComment);
		
		return voteWithCommentList;
	}
	
	//공지 수정
	public int updateVote(String postType, int voteId, int userId, String userName, String userType, String kidsClass
			, String noticeType, String weather, String title, String description, String endDate) {
		return voteDAO.updateVote(postType, voteId, userId, userName, userType, kidsClass, noticeType, weather, title, description, endDate);
	}
	
	//공지 삭제
	public boolean deleteVote(int id, String noticeType, int userId) {
		//삭제 대상 선택
		Vote vote = voteDAO.selectVote(id);
		
		//투표 삭제
		int count = voteDAO.deleteVote(id, noticeType, userId);
		
		//투표부터 삭제 확인
		if (count != 1) {
			return false;
		}
		//코멘트 삭제
		int commentList = commentBO.deleteCommentWithNote(id, noticeType);
		
		return true;
	}
}
