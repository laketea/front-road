package com.bookstore.po;

import java.sql.Date;

public class Subject {
	private Long id;
	//private Long column_id;
	private Long first ;
	private String firstname;
	private Long second ;
	private String secondname;
	private Long status;
	private Long point;
	public Long getPoint() {
		return point;
	}
	public void setPoint(Long point) {
		this.point = point;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getFirst() {
		return first;
	}
	public void setFirst(Long first) {
		this.first = first;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public Long getSecond() {
		return second;
	}
	public void setSecond(Long second) {
		this.second = second;
	}
	public String getSecondname() {
		return secondname;
	}
	public void setSecondname(String secondname) {
		this.secondname = secondname;
	}
	
	
}
