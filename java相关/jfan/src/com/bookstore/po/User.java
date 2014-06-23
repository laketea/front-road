package com.bookstore.po;

import java.sql.Date;

public class User {
	private Long id;
	private String username;
	private String password;
	private String email;
	private String code;
	private java.util.Date lastlogin;
	private Long status;
	private Long point;
	
	public Long getPoint() {
		return point;
	}

	public void setPoint(Long point) {
		this.point = point;
	}

	public User(){}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public java.util.Date getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(java.util.Date lastlogin) {
		this.lastlogin = lastlogin;
	}
	
}
