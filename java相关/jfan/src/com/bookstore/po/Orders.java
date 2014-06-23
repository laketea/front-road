package com.bookstore.po;

import java.sql.Date;
import java.util.List;

public class Orders {
	private Long id;
	private String username;
	private Long userid;
	private Long addid;
	private Long point;
	//private List orderItem;
	private String payflag;
	private String sendflag;
	private java.util.Date orderdate;
	private String payway;
	private String sendway;
	private Double totalprice;
	private Double mailprice;
	private Double newprice;
	private Long userpoint;
	private String received;
	private String status;
	private String mailaddress;
	private String mailcompany;
	private String mailid;
	private String zfbuser;
	private Double zfbprice;
	private String zfbstatus;
	private String zfbid;
	private String zfbdate;
	
	
	public String getZfbdate() {
		return zfbdate;
	}

	public void setZfbdate(String zfbdate) {
		this.zfbdate = zfbdate;
	}

	public String getZfbid() {
		return zfbid;
	}

	public void setZfbid(String zfbid) {
		this.zfbid = zfbid;
	}

	public String getMailaddress() {
		return mailaddress;
	}

	public void setMailaddress(String mailaddress) {
		this.mailaddress = mailaddress;
	}

	public String getMailcompany() {
		return mailcompany;
	}

	public void setMailcompany(String mailcompany) {
		this.mailcompany = mailcompany;
	}

	public String getMailid() {
		return mailid;
	}

	public void setMailid(String mailid) {
		this.mailid = mailid;
	}

	public String getReceived() {
		return received;
	}

	public void setReceived(String received) {
		this.received = received;
	}

	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getUserpoint() {
		return userpoint;
	}

	public void setUserpoint(Long userpoint) {
		this.userpoint = userpoint;
	}

	public Orders(){}

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

	public Long getAddid() {
		return addid;
	}

	public void setAddid(Long addid) {
		this.addid = addid;
	}

	public Long getPoint() {
		return point;
	}

	public void setPoint(Long point) {
		this.point = point;
	}

	public String getPayflag() {
		return payflag;
	}

	public void setPayflag(String payflag) {
		this.payflag = payflag;
	}

	public String getSendflag() {
		return sendflag;
	}

	public void setSendflag(String sendflag) {
		this.sendflag = sendflag;
	}

	public java.util.Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(java.util.Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getPayway() {
		return payway;
	}

	public void setPayway(String payway) {
		this.payway = payway;
	}

	public String getSendway() {
		return sendway;
	}

	public void setSendway(String sendway) {
		this.sendway = sendway;
	}

	public Double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}

	public Double getMailprice() {
		return mailprice;
	}

	public void setMailprice(Double mailprice) {
		this.mailprice = mailprice;
	}

	public Double getNewprice() {
		return newprice;
	}

	public void setNewprice(Double newprice) {
		this.newprice = newprice;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public String getZfbuser() {
		return zfbuser;
	}

	public void setZfbuser(String zfbuser) {
		this.zfbuser = zfbuser;
	}

	public Double getZfbprice() {
		return zfbprice;
	}

	public void setZfbprice(Double zfbprice) {
		this.zfbprice = zfbprice;
	}

	public String getZfbstatus() {
		return zfbstatus;
	}

	public void setZfbstatus(String zfbstatus) {
		this.zfbstatus = zfbstatus;
	}

	
	


	
	
	
	
}
