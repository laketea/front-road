package com.bookstore.po;

import java.sql.Date;

public class Suggest {
	private Long id;
	//private Long column_id;
	private String content;
	private String contact;
	private java.util.Date sdate;
	private String userid;
	private String username;
	private String reply;
	private java.util.Date redate;
	//private Date create_time;
	
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

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Suggest(){}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public java.util.Date getSdate() {
		return sdate;
	}

	public void setSdate(java.util.Date sdate) {
		this.sdate = sdate;
	}

	public java.util.Date getRedate() {
		return redate;
	}

	public void setRedate(java.util.Date redate) {
		this.redate = redate;
	}
	
}
