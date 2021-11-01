package com.yeye.ohmykids.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.notice.model.NoticeWithComment;
import com.yeye.ohmykids.notice.model.Vote;

@Repository
public interface VoteDAO {

	//투표 작성
	public int insertVote(
			@Param("postType") String postType
			, @Param("userId") int userId
			, @Param("userName") String userName
			, @Param("userType") String userType
			, @Param("kidsClass") String kidsClass
			, @Param("noticeType") String noticeType
			, @Param("weather") String weather
			, @Param("title") String tilte
			, @Param("description") String description
			, @Param("endDate") String endDate
			);
	
	//공지 목록
	public List<Vote> selectVoteList();
	
	//공지 상세
	public Vote selectVote(@Param("id") int id);
	
	//공지 수정
	public int updateVote(
			@Param("postType") String postType
			, @Param("id") int id //voteId
			, @Param("userId") int userId
			, @Param("userName") String userName
			, @Param("userType") String userType
			, @Param("kidsClass") String kidsClass
			, @Param("noticeType") String noticeType
			, @Param("weather") String weather
			, @Param("title") String tilte
			, @Param("description") String description
			, @Param("endDate") String endDate);
	
	//공지 삭제
	public int deleteVote(
			@Param("id") int id
			, @Param("noticeType") String noticeType
			, @Param("userId") int userId);
	
	//투표(찬성)했는지
	public int selectCountAgree(
		@Param("userId") int userId
		, @Param("voteId") int voteId);
	
	//투표(반대)했는지
	public int selectCountDisagree(
		@Param("userId") int userId
		, @Param("voteId") int voteId);
	
	//찬성입력
	public int insertAgree(
		@Param("userId") int userId
		, @Param("voteId") int voteId);
	
	//반대입력
	public int insertDisagree(
		@Param("userId") int userId
		, @Param("voteId") int voteId);
	
	//찬성갯수
	public int countAgree(@Param("voteId") int voteId);
	
	//반대갯수
	public int countDisagree(@Param("voteId") int voteId);
	
	//찬성취소
	public int deleteAgree(
		@Param("userId") int userId
		, @Param("voteId") int voteId);
	
	//반대취소
	public int deleteDisagree(
		@Param("userId") int userId
		, @Param("voteId") int voteId);
	
	//투표 공지 삭제 + 투표 찬성 내용 삭제
	public int deleteVoteAgree(@Param("voteId") int voteId);
	
	//투표 공지 삭제 + 투표 반대 내용 삭제
	public int deleteVoteDisagree(@Param("voteId") int voteId);
}
