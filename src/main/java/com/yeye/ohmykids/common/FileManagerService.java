package com.yeye.ohmykids.common;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//private final String FILE_UPLOAD_PATH="C:\\Users\\82109\\Desktop\\spring\\spring_test\\upload\\ohmykids\\images/";
	private final String FILE_UPLOAD_PATH = "/home/ec2-user/upload_images/";
			
	//파일업로드
	public String saveFile(int userId, MultipartFile file) {
		//사용자별로 파일이름이 겹치는 것을 방지하기 위해 디렉토리 생성
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
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
			bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());// static 메소드 :  객체생성없이 사용
			Files.write(path, bytes);
		} catch (IOException e) {
			logger.error("[FileManagerService saveFile] 파일 생성 실패");
			e.printStackTrace();
			return null;
		}
		
		//파일접근이 가능한 path 리턴
		return "/images/" + directoryName + file.getOriginalFilename();
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
