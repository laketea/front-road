package com.szrz.domain;

import java.io.Serializable;
import java.sql.Date;

/**
 * @Author zhangwei 
 * @Email  laketea@163.com 
 * @Time   2012-11-03 23:56:19
 */
public class ImgType
	implements Serializable
{
	
	private Integer id;  //id

	private String name;  //类型名称

	private String imgCount;  //拥有图片总数

	private String status;  //状态


	public ImgType(){
		
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

	public String getImgCount() {
		return imgCount;
	}

	public void setImgCount(String imgCount) {
		this.imgCount = imgCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	
}