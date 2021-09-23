package com.yeye.ohmykids.note.model;

import java.util.List;

import com.yeye.ohmykids.user.kidsinfo.model.KidsInfo;

public class NoteWithKidsInfo {
	private Note note;
	private List<KidsInfo> kidsInfoList;
	
	public Note getNote() {
		return note;
	}
	public void setNote(Note note) {
		this.note = note;
	}
	public List<KidsInfo> getKidsInfoList() {
		return kidsInfoList;
	}
	public void setKidsInfoList(List<KidsInfo> kidsInfoList) {
		this.kidsInfoList = kidsInfoList;
	}
	
	
	
	

}
