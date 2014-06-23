package com.szrz.domain;

import java.io.Serializable;

public class UserReg implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7775148556155064274L;

	private Integer id;
	
	private String email;//email
	
	private String code;//验证码
	
	private String memberType;//邀请的是天使 还是会员
	
	private String senderId;//发送者的id
	
	private String senderName;//发送者的姓名
	
	private String senderType;//发送者的类型，0--管理员，1---会员
	
	private String sendDate;//发送时间
	
	private String overType;//类型0---正常,  1----成功, 2---禁止
	
	public UserReg(){
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	

	public void setSendDate(String sendDate) {
		sendDate = sendDate;
	}

	public String getOverType() {
		return overType;
	}

	public void setOverType(String overType) {
		this.overType = overType;
	}

	public String getSenderType() {
		return senderType;
	}

	public void setSenderType(String senderType) {
		this.senderType = senderType;
	}

	public String getSendDate() {
		return sendDate;
	}
	
	
	
}
