package com.yeye.ohmykids.user.kidsinfo.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface KidsInfoDAO {

	//자녀정보등록
	public int insertKidsInfo(
			@Param("userId") int userId
			, @Param("userName") String userName
			, @Param("kidsName") String kidsName
			, @Param("kidsBirth") String kidsBirth
			, @Param("kidsGender") String kidsGender
			, @Param("kidsClass") String kidsClass
			, @Param("relationship") String relationship
			, @Param("imagePath") String imagePath);
}
