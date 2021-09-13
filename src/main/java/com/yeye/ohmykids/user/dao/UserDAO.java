package com.yeye.ohmykids.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.user.model.User;

@Repository
public interface UserDAO {
	
	//회원가입
	public int insertUser(
			@Param("type") String type
			, @Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email);
	
	//id중복 체크
	public int selectCountById(@Param("loginId") String loginId);
	
	//로그인
	public User selectUserByIdPassword(
			@Param("type") String type
			, @Param("loginId") String loginId
			, @Param("password") String password);

}
