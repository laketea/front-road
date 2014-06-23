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

	private String title; // 标题

	private String content; // 内容

	private String typeId; // 类型Id

	private String typeName; // 类型

	private String userId; // 用户id

	private String userName; // 用户名

	private String userNick; // 昵称

	private String replyContent; // 回复

	private String replyTime; // 回复时间

	private String guestBookTime; // 留言时间

	private String status; // 状态

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