package com.yeye.ohmykids.album;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.album.bo.AlbumBO;
import com.yeye.ohmykids.album.model.Album;

@RestController
@RequestMapping("/album")
public class AlbumRestController {

	@Autowired
	private AlbumBO albumBO;
	//앨범작성
	@RequestMapping("/create")
	public Map<String, String> create(
			@ModelAttribute Album album
			/*
			 * @RequestParam("type") String type 
			 * , @RequestParam("kidsId") int kidsId
			 * , @RequestParam("kidsClass") String kidsClass 
			 * , @RequestParam("kidsName") String kidsName 
			 * , @RequestParam("parentsId") int parentsId
			 * , @RequestParam(value="weather" , required=false) String weather 
			 * , @RequestParam(value="content", required=false) String content
			 */
			, @RequestParam("files") MultipartFile[] files //멀티파일
			, HttpServletRequest request ){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		//album 객체에 userId, userName 주입
		album.setUserId(userId);
		album.setUserName(userName);
	
		Map<String, String> result = new HashMap<>();
		
			if(albumBO.createAlbum(album, files)) {
				result.put("result", "success");
			}else {
				result.put("result", "fail");
			}
		
		return result;
	}
	
	//앨범수정
	@RequestMapping("/update")
	public Map<String, String> update(
			@RequestParam("type") String type
			, @RequestParam("targetId") int targetId
			, @RequestParam("kidsId") int kidsId
			, @RequestParam("kidsClass") String kidsClass
			, @RequestParam("kidsName") String kidsName
			, @RequestParam("parentsId") int parentsId
			, @RequestParam(value="weather" , required=false) String weather
			, @RequestParam(value="content", required=false) String content
			, @RequestParam(value="files", required=false) MultipartFile[] files // 사진은 업데이트하지 않을수 있으므로
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Map<String, String> result = new HashMap<>();
	
		if(albumBO.updateAlbum(userId, type, targetId, kidsId, kidsClass, kidsName, parentsId, weather, content, files)) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	
	
	}
	
	//앨범삭제
	  @GetMapping("/delete") 
	  public Map<String, String> delete(
			  @RequestParam("targetId") int targetId 
			  , @RequestParam("type") String type ,
			  HttpServletRequest request){
	  
	  HttpSession session = request.getSession(); int userId =
	  (Integer)session.getAttribute("userId");
	  
	  Map<String, String> result = new HashMap<>();
	  
	  if(albumBO.deleteAlbum(targetId, type, userId)) { 
		  result.put("result", "success"); 
		  }else { 
			  result.put("result", "fail"); 
	  } return result; 
	  }
	 
}
