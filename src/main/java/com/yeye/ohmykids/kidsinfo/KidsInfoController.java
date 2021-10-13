package com.yeye.ohmykids.kidsinfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeye.ohmykids.kidsinfo.bo.KidsInfoBO;
import com.yeye.ohmykids.kidsinfo.model.KidsInfo;

@Controller
@RequestMapping("/kidsinfo")
public class KidsInfoController {
	
	@Autowired
	private KidsInfoBO kidsInfoBO;
	
	//자녀정보 입력화면
	@RequestMapping("/create_view")
	public String kidsInfoCreateView(){
		return "user/kidsinfo_create";
	}
	
	//자녀정보 상세, 수정화면
	@RequestMapping("/detail_view")
	public String kidsInfoDetailView(
			@RequestParam("id") int id
			, Model model
			, HttpServletRequest request) {
		//로그인한 본인의 자녀정보만 볼 수있게 한다.
		HttpSession session = request.getSession();
		int userId = (Integer) session.getAttribute("userId");
		
		KidsInfo kidsInfo = kidsInfoBO.getKidsInfo(id, userId);
		model.addAttribute("kidsInfo", kidsInfo);
		
		return "user/kidsinfo_detail";
	}
	
	//자녀정보 리스트
	@RequestMapping("/list_view")
	public String kidsInfoListView(
			Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		//for parents
		List<KidsInfo> kidsInfoList = kidsInfoBO.getKidsInfoList(userId);
		//for teacher
		List<KidsInfo> kidsInfoListForTeacher = kidsInfoBO.getKidsInfoListForTeacher();
		
		model.addAttribute("kidsInfoList", kidsInfoList);
		model.addAttribute("kidsInfoListForTeacher", kidsInfoListForTeacher);
		
		return "user/kidsinfo_list";
	}
	
}
