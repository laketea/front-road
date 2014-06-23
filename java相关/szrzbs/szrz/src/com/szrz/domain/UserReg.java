package com.szrz.domain;

import java.io.Serializable;

public class UserReg implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7775148556155064274L;

	private Integer id;
	
	private String email;//email
	
	private String code;//��֤��
	
	private String memberType;//���������ʹ ���ǻ�Ա
	
	private String senderId;//�����ߵ�id
	
	private String senderName;//�����ߵ�����
	
	private String senderType;//�����ߵ����ͣ�0--����Ա��1---��Ա
	
	private String sendDate;//����ʱ��
	
	private String overType;//����0---����,  1----�ɹ�, 2---��ֹ
	
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
