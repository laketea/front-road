package com.szrz.views;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.szrz.common.hibernate.Page;
import com.szrz.domain.GuestBook;
import com.szrz.domain.GuestBookType;
import com.szrz.service.GuestBookManager;
import com.szrz.service.GuestBookTypeManager;

public class GuestAction extends ActionSupport {

	protected GuestBookManager gmgr;
	
	protected GuestBookTypeManager gtmgr;
	
	private String id;
	
	private String page="1";
	
	private GuestBookType guestType;
	
	private String pageSize="10";
	
	private Page guestPage;
	
	private List<GuestBook> gList;
	
	private List<GuestBookType> gtList;
	
	public void setGuestBookManager(GuestBookManager gmgr) {
		this.gmgr = gmgr;
	}
	
	public void setGuestBookTypeManager(GuestBookTypeManager gmgr) {
		this.gtmgr = gmgr;
	}
	
	public String execute() throws Exception{
		gtList = gtmgr.findAll();
		if(id!=null&&!"".equals(id)){
			guestType = gtmgr.get(Integer.valueOf(id));
		}
		guestPage = gmgr.findByPage((new GuestBook(id)), Integer.valueOf(page), Integer.valueOf(pageSize));
		return "guestbook";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public GuestBookType getGuestType() {
		return guestType;
	}

	public void setGuestType(GuestBookType guestType) {
		this.guestType = guestType;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public Page getGuestPage() {
		return guestPage;
	}

	public void setGuestPage(Page guestPage) {
		this.guestPage = guestPage;
	}

	public List<GuestBook> getgList() {
		return gList;
	}

	public void setgList(List<GuestBook> gList) {
		this.gList = gList;
	}

	public List<GuestBookType> getGtList() {
		return gtList;
	}

	public void setGtList(List<GuestBookType> gtList) {
		this.gtList = gtList;
	}
	
	
	
	
}
