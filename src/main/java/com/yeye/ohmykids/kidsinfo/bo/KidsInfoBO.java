package com.yeye.ohmykids.kidsinfo.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.common.FileManagerService;
import com.yeye.ohmykids.kidsinfo.dao.KidsInfoDAO;
import com.yeye.ohmykids.kidsinfo.model.KidsInfo;

@Service
public class KidsInfoBO {
	
	@Autowired
	private KidsInfoDAO kidsInfoDAO;

	//자녀정보등록
	public int addKidsInfo(int userId, String userName, String kidsName, String kidsBirth, String kidsGender
			, String kidsClass, String relationship, MultipartFile file) {
		
		//자녀사진이 없는경우 예외처리
		String filePath = null;
		
		if(file != null) {
			FileManagerService fileManager = new FileManagerService();
			filePath = fileManager.saveFile(userId, file);
			
			if(filePath == null) {
				return -1;
			}
		}
		return kidsInfoDAO.insertKidsInfo(userId, userName, kidsName, kidsBirth, kidsGender, kidsClass, relationship, filePath);
	}
	
	//자녀정보 수정
	public int updateKidsInfo(int id, int userId, String userName, String kidsName, String kidsBirth, String kidsGender
			, String kidsClass, String relationship, MultipartFile file) {
		
		//자녀사진이 없는경우 예외처리
				String filePath = null;
				
				if(file != null) {
					FileManagerService fileManager = new FileManagerService();
					filePath = fileManager.saveFile(userId, file);
					
					if(filePath == null) {
						return -1;
					}
				}
		return kidsInfoDAO.updateKidsInfo(id, userId, userName, kidsName, kidsBirth, kidsGender, kidsClass, relationship, filePath);
	}
	
	//자녀정보리스트
	public List<KidsInfo> getKidsInfoList(int userId){
		return kidsInfoDAO.selectKidsInfoList(userId);
	}
	
	//자녀정보리스트(for Teacher)
	public List<KidsInfo> getKidsInfoListForTeacher(){
		return kidsInfoDAO.selectKidsInfoListForTeacher();
		}
	
//	//자녀정보리스트(반정보 중복없이 보기)
//	public List<KidsInfo> getKidsInfoListGroupByClass(int userId){
//		return kidsInfoDAO.selectKidsInfoListByClass(userId);
//	}
//	
//	//자녀정보리스트(반 선택에 따른 이름정보 보기)
//	public List<KidsInfo> getKidsInfoName(String kidsClass){
//		return kidsInfoDAO.selectKidsInfoName(kidsClass);
//	}
	
	//자녀정보상세
	public KidsInfo getKidsInfo(int id, int userId) {
		return kidsInfoDAO.selectKidsInfo(id, userId);
	}

	
}
