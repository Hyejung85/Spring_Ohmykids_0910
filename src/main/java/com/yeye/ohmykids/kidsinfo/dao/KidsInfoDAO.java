package com.yeye.ohmykids.kidsinfo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.kidsinfo.model.KidsInfo;

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
	
	 //자녀정보수정
	 public int updateKidsInfo(
			@Param("id") int id
			, @Param("userId") int userId
			, @Param("userName") String userName
			, @Param("kidsName") String kidsName
			, @Param("kidsBirth") String kidsBirth
			, @Param("kidsGender") String kidsGender
			, @Param("kidsClass") String kidsClass
			, @Param("relationship") String relationship
			, @Param("imagePath") String imagePath);
	
	 //자녀정보목록
	 public List<KidsInfo> selectKidsInfoList(@Param("userId") int userId);
	 
	//자녀정보목록
	 public List<KidsInfo> selectKidsInfoListForTeacher();
	 
//	 //자녀정보리스트(반정보 중복없이 보기)
//	 public List<KidsInfo> selectKidsInfoListByClass(@Param("userId") int userId);
//	 
//	 //자녀정보리스트(반 선택에 따른 이름정보 보기)
//	 public List<KidsInfo> selectKidsInfoName(@Param("kidsClass") String kidsClass);
	 
	 //자녀정보상세
	 public KidsInfo selectKidsInfo(
			 @Param("id") int id);
	
}
