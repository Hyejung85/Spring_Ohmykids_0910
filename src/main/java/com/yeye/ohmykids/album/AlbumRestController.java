package com.yeye.ohmykids.album;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.album.bo.AlbumBO;

@RestController
@RequestMapping("/album")
public class AlbumRestController {

	@Autowired
	private AlbumBO albumBO;
	//앨범작성
	@RequestMapping("/create")
	public Map<String, String> create(
			@RequestParam("type") String type
			, @RequestParam("kidsId") int kidsId
			, @RequestParam("kidsClass") String kidsClass
			, @RequestParam("kidsName") String kidsName
			, @RequestParam(value="weather" , required=false) String weather
			, @RequestParam(value="content", required=false) String content
			, @RequestParam("file") MultipartFile file
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Map<String, String> result = new HashMap<>();
		
		int count = albumBO.createAlbum(userId, userName, type, kidsId, kidsClass, kidsName, weather, content, file);
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
}
