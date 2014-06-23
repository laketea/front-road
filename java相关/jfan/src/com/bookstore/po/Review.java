package com.bookstore.po;

import java.sql.Date;

public class Review {
	private Long id;
	//private Long column_id;
	private Long userid;
	private String username;
	private Long godsid;
	private String godsname;
	private String title;
	private String advantage;
	private String defect;
	private String view;
	//private String redate;
	private java.util.Date redate;
	private String orderdate;
	private Long orderitemid;
	
	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	public Long getOrderitemid() {
		return orderitemid;
	}

	public void setOrderitemid(Long orderitemid) {
		this.orderitemid = orderitemid;
	}

	public Review(){}
	
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


	public String getGodsname() {
		return godsname;
	}

	public void setGodsname(String godsname) {
		this.godsname = godsname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAdvantage() {
		return advantage;
	}

	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}

	public String getDefect() {
		return defect;
	}

	public void setDefect(String defect) {
		this.defect = defect;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public java.util.Date getRedate() {
		return redate;
	}

	public void setRedate(java.util.Date redate) {
		this.redate = redate;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public Long getGodsid() {
		return godsid;
	}

	public void setGodsid(Long godsid) {
		this.godsid = godsid;
	}

	
	
}
