package com.bookstore.po;

import java.sql.Date;

public class Guest {
	private Long id;
	//private Long column_id;
	private String userid;
	private String username;
	private String title;
	private String content;
	private String confirm;
	private String feedback;
	private java.util.Date guesttime;
	private String feedflag;
	
	
	public String getFeedflag() {
		return feedflag;
	}


	public void setFeedflag(String feedflag) {
		this.feedflag = feedflag;
	}


	public Guest(){}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getConfirm() {
		return confirm;
	}


	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}


	public String getFeedback() {
		return feedback;
	}


	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}


	public java.util.Date getGuesttime() {
		return guesttime;
	}


	public void setGuesttime(java.util.Date guesttime) {
		this.guesttime = guesttime;
	}
	
	

}
