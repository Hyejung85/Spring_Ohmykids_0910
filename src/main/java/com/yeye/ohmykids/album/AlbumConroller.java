package com.yeye.ohmykids.album;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeye.ohmykids.album.bo.AlbumBO;
import com.yeye.ohmykids.album.model.Album;
import com.yeye.ohmykids.user.kidsinfo.bo.KidsInfoBO;
import com.yeye.ohmykids.user.kidsinfo.model.KidsInfo;

@Controller
@RequestMapping("/album")
public class AlbumConroller {
	
	@Autowired
	private KidsInfoBO kidsInfoBO;
	
	@Autowired
	private AlbumBO albumBO;
	
	//앨범 작성 화면
	@RequestMapping("/create_view")
	public String createView(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		//kidsInfoList 보여주기
		List<KidsInfo> kidsInfoList = kidsInfoBO.getKidsInfoList(userId);
		model.addAttribute("kidsInfoList", kidsInfoList);
		
		return "album/create";
	}
	
	//앨범 목록
	@RequestMapping("/list_view")
	public String listView(
			 Model model
			, HttpServletRequest request) {
		
			HttpSession session = request.getSession();
			int userId = (Integer)session.getAttribute("userId");
			
			//kidsInfoList 보여주기
			List<KidsInfo> kidsInfoList = kidsInfoBO.getKidsInfoList(userId);
			model.addAttribute("kidsInfoList", kidsInfoList);
			
			//albumList
			List<Album> albumList = albumBO.getAlbumList();
			model.addAttribute("albumList", albumList);
			
		
		return "album/list";
	}
	
	//앨범 상세 화면
		@RequestMapping("/detail_view")
		public String detailView() {
			return "album/detail";
		}
		

}
