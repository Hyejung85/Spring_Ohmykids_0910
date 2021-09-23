package com.yeye.ohmykids.note;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.ohmykids.note.bo.NoteBO;
import com.yeye.ohmykids.user.kidsinfo.bo.KidsInfoBO;
import com.yeye.ohmykids.user.kidsinfo.model.KidsInfo;

@RestController
@RequestMapping("/note")
public class NoteRestController {
	
	@Autowired
	private NoteBO noteBO;
	
	@Autowired
	private KidsInfoBO kidsInfoBO;
	
	//알림장 입력
	@RequestMapping("/create")
	public Map<String, String> noteCreate(
			@RequestParam("kidsId") int kidsId
			, @RequestParam("kidsClass") String kidsClass
			, @RequestParam("kidsName") String kidsName
			, @RequestParam(value="weather", required=false) String weather
			, @RequestParam(value="content", required=false) String content
			, @RequestParam(value="file", required=false) MultipartFile file
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
	
		
		Map<String, String> result = new HashMap<>();
		
		int count = noteBO.noteCreate(userId, userName, kidsId, kidsClass, kidsName, weather, content, file);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	//학생정보 셀렉터 
	@GetMapping("/select_kidsInfo")
	public Map<String, String> selectKidsInfo(@RequestParam("kidsClass") String kidsClass){
		
		Map<String, String> result = new HashMap<>();
		List<KidsInfo> kidsNameList = kidsInfoBO.getKidsInfoName(kidsClass);
		
		if(kidsNameList != null) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}

}
