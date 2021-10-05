package com.yeye.ohmykids.imagefile.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.ohmykids.imagefile.model.ImageFile;

@Repository
public interface ImageFileDAO {
	
	//이미지 파일 저장
	public int insertImgeFiles(
			@Param("userId") int userId
			, @Param("type") String type
			, @Param("targetId") int targetId
			, @Param("imagePath") List<String> filePathList);
}
