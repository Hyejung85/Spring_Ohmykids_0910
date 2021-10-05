package com.yeye.ohmykids.common;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.imagefile.model.ImageFile;

public class MultiFileManagerService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final String FILE_UPLOAD_PATH="C:\\Users\\82109\\Desktop\\spring\\spring_test\\upload\\ohmykids\\images/";
	
	
	//파일업로드(다중)
	public List<String> saveFile(int userId, String type, int targetId, MultipartFile[] files) {
		
		//사용자별로 파일이름이 겹치는 것을 방지하기 위해 디렉토리 생성
		String directoryName = userId + "_" + type + "_" + targetId + "_" +System.currentTimeMillis() + "/";
		
		//완전한 파일경로
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		
		//파일을 저장할 디렉토리 생성
		File directory = new File(filePath);
		
		if(directory.mkdir() == false) {
			logger.error("[FileManagerService saveFile] 디렉토리 생성 실패");
			return null;
		}
		
		//파일저장(byte 단위로 저장)
			byte[] bytes;
			try {
				//파일접근이 가능한 path를 스트링에 저장 > 리스트경로로 만든다 > 리스트에 애드한다.
				List<String> filePathList = new ArrayList<>();
				
				for(MultipartFile file : files) {
					
					bytes = file.getBytes();
					Path path = Paths.get(filePath + file.getOriginalFilename());// static 메소드 :  객체생성없이 사용
					Files.write(path, bytes);
					
					String accessiblePath=  "/images/" + directoryName + file.getOriginalFilename(); 
					
					
					filePathList.add(accessiblePath);
					
					return filePathList; //리스트 리턴
				}
				
			} catch (IOException e) {
				logger.error("[FileManagerService saveFile] 파일 생성 실패");
				e.printStackTrace();
				return null;
			}
			
		return null;
	}
	

	public void removeFile(String filePath) {
		//삭제할 파일경로
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images/", "");
		//파일을 지운다
		Path path = Paths.get(realFilePath);
		//해당파일이 있는지 확인
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("[FileManagerService saveFile] 파일 삭제 실패");
				e.printStackTrace();
			}
		}
		//디렉토리(폴더) 지우기
		path = path.getParent();
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("[FileManagerService saveFile] 파일 디렉토리 삭제 실패");
				e.printStackTrace();
			}
		}
		
	}



}
