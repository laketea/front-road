package com.szrz.domain;

import java.io.Serializable;
import java.sql.Date;

/**
 * @Author zhangwei
 * @Email laketea@163.com
 * @Time 2012-11-18 14:15:33
 */
public class GuestBook implements Serializable {

	private Integer id; // id

	private String title; // ����

	private String content; // ����

	private String typeId; // ����Id

	private String typeName; // ����

	private String userId; // �û�id

	private String userName; // �û���

	private String userNick; // �ǳ�

	private String replyContent; // �ظ�

	private String replyTime; // �ظ�ʱ��

	private String guestBookTime; // ����ʱ��

	private String status; // ״̬

	public GuestBook() {

	}

	public GuestBook(String typeId) {
		if(typeId!=null&&!"".equals(typeId)){
			this.typeId =typeId;
		}
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}

	public String getGuestBookTime() {
		return guestBookTime;
	}

	public void setGuestBookTime(String guestBookTime) {
		this.guestBookTime = guestBookTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}