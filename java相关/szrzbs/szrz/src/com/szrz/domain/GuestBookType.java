package com.szrz.domain;

import java.io.Serializable;
import java.sql.Date;

/**
 * @Author zhangwei 
 * @Email  laketea@163.com 
 * @Time   2012-11-04 00:34:55
 */
public class GuestBookType
	implements Serializable
{
	
	private Integer id;  //id

	private String name;  //留言类型

	private String gbCount="0";  //拥有留言总数

	private String status="0";  //状态


	public GuestBookType(){
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGbCount() {
		return gbCount;
	}

	public void setGbCount(String gbCount) {
		this.gbCount = gbCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	
}