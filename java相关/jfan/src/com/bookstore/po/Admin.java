package com.bookstore.po;

import java.sql.Date;

public class Admin {
	private Long id;
	private String name;
	private String password;
	private java.util.Date createdate;
	//private Date create_time;
	
	public Admin(){}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public java.util.Date getCreatedate()
    {
        return this.createdate;
    }

    public void setCreatedate(java.util.Date createdate)
    {
        this.createdate = createdate;
    }
}
