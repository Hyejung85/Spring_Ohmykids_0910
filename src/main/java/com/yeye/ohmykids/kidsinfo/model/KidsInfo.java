package com.yeye.ohmykids.kidsinfo.model;

import java.util.Date;

public class KidsInfo {
	private int id;
	private int userId;
	private String userName;
	private String kidsName;
	private Date kidsBirth;
	private String kidsGender;
	private String kidsClass;
	private String relationship;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getKidsName() {
		return kidsName;
	}
	public void setKidsName(String kidsName) {
		this.kidsName = kidsName;
	}
	public Date getKidsBirth() {
		return kidsBirth;
	}
	public void setKidsBirth(Date kidsBirth) {
		this.kidsBirth = kidsBirth;
	}
	public String getKidsGender() {
		return kidsGender;
	}
	public void setKidsGender(String kidsGender) {
		this.kidsGender = kidsGender;
	}
	public String getKidsClass() {
		return kidsClass;
	}
	public void setKidsClass(String kidsClass) {
		this.kidsClass = kidsClass;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	
	
}
