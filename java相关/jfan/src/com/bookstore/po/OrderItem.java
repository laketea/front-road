package com.bookstore.po;

import java.sql.Date;

public class OrderItem {
	private Long id;
	//private Long column_id;
	private String orderid;
	private String godsid;
	private String godsname;
	private String godsprice;
	private String godsnum;
	private String price;
	private String godsminphoto;
	private Long points;
	private Long status;
	
	
	
	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public Long getPoints() {
		return points;
	}

	public void setPoints(Long points) {
		this.points = points;
	}

	public String getGodsminphoto() {
		return godsminphoto;
	}

	public void setGodsminphoto(String godsminphoto) {
		this.godsminphoto = godsminphoto;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public OrderItem(){}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getGodsid() {
		return godsid;
	}

	public void setGodsid(String godsid) {
		this.godsid = godsid;
	}

	public String getGodsname() {
		return godsname;
	}

	public void setGodsname(String godsname) {
		this.godsname = godsname;
	}

	public String getGodsprice() {
		return godsprice;
	}

	public void setGodsprice(String godsprice) {
		this.godsprice = godsprice;
	}

	public String getGodsnum() {
		return godsnum;
	}

	public void setGodsnum(String godsnum) {
		this.godsnum = godsnum;
	}

	

	

	
	
}
