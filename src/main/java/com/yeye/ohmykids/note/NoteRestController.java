package com.yeye.ohmykids.note;

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

import com.yeye.ohmykids.note.bo.NoteBO;

@RestController
@RequestMapping("/note")
public class NoteRestController {
	
	@Autowired
	private NoteBO noteBO;
	
	//알림장 입력
	@PostMapping("/create")
	public Map<String, String> noteCreate(
			@RequestParam("kidsClass") String kidsClass
			, @RequestParam("kidsName") String kidsName
			, @RequestParam(value="weather", required=false) String weather
			, @RequestParam(value="content", required=false) String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		Map<String, String> result = new HashMap<>();
		
		int count = noteBO.noteCreate(userId, userName, kidsClass, kidsName, weather, content, file);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
		
	}

}
