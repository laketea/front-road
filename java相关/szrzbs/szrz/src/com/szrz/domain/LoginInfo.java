package com.szrz.domain;

import java.io.Serializable;
import java.sql.Date;

/**
 * @Author zhangwei 
 * @Email  laketea@163.com 
 * @Time   2012-10-31 23:22:18
 */
public class LoginInfo
	implements Serializable
{
	
	private Integer id;  //id

	private String userId;  //�û�id

	private String nick;  //�û�����

	private String email;  //����

	private String phone;  //�绰

	private String password;  //����

	private String lastLogin;  //�����¼

	private Integer loginCount;  //��¼����


	public LoginInfo(){
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}


	
}