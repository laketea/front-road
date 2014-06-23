package com.szrz.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author zhangwei 
 * @Email  laketea@163.com 
 * @Time   2012-11-04 00:24:54
 */
public class NewsType
	implements Serializable
{
	
	private Integer id;  //id

	private String name;  //新闻类型

	private String newsCount;  //拥有新闻总数

	private String status;  //状态
	
	private List<News> lst ;


	public NewsType(){
		
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

	public String getNewsCount() {
		return newsCount;
	}

	public void setNewsCount(String newsCount) {
		this.newsCount = newsCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<News> getLst() {
		return lst==null||lst.isEmpty()?(new ArrayList<News>()):lst;
	}

	public void setLst(List<News> lst) {
		this.lst = lst;
	}


	
}