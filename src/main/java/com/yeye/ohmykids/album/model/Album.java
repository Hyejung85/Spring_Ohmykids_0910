package com.yeye.ohmykids.album.model;

import java.util.Date;

public class Album {
	private int id;
	private int userId;
	private String userName;
	private String type;
	private int kidsId;
	private String kidsClass;
	private String kidsName;
	private int parentsId;
	private String weather;
	private String content;
	//private String imagePath;
	private Date createdAt;
	private Date updatedAt;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getKidsId() {
		return kidsId;
	}
	public void setKidsId(int kidsId) {
		this.kidsId = kidsId;
	}
	public String getKidsClass() {
		return kidsClass;
	}
	public void setKidsClass(String kidsClass) {
		this.kidsClass = kidsClass;
	}
	public String getKidsName() {
		return kidsName;
	}
	public void setKidsName(String kidsName) {
		this.kidsName = kidsName;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	/*
	 * public String getImagePath() { return imagePath; }
	 * 
	 * public void setImagePath(String imagePath) { this.imagePath = imagePath; }
	 */
	
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
	public int getParentsId() {
		return parentsId;
	}
	public void setParentsId(int parentsId) {
		this.parentsId = parentsId;
	}
	
	

}
