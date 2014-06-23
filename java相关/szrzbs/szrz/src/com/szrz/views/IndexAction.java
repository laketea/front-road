package com.szrz.views;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.szrz.domain.GuestBook;
import com.szrz.domain.News;
import com.szrz.service.AdminManager;
import com.szrz.service.GuestBookManager;
import com.szrz.service.NewsManager;

public class IndexAction extends ActionSupport {
	
	protected NewsManager mgr;
	
	protected GuestBookManager gmgr;
	
	private List<News> cpNewsLst ;
	
	private List<News> hyNewsLst ;
	
	private List<GuestBook> guestLst;

	public void setNewsManager(NewsManager mgr) {
		this.mgr = mgr;
	}
	public void setGuestBookManager(GuestBookManager gmgr) {
		this.gmgr = gmgr;
	}



	public String execute() throws Exception{
		cpNewsLst = mgr.findTop("1", 6);
		hyNewsLst = mgr.findTop("2", 6);
		guestLst = gmgr.findTop(5);
		return "index";
	}
	public List<News> getCpNewsLst() {
		return cpNewsLst;
	}
	public void setCpNewsLst(List<News> cpNewsLst) {
		this.cpNewsLst = cpNewsLst;
	}
	public List<News> getHyNewsLst() {
		return hyNewsLst;
	}
	public void setHyNewsLst(List<News> hyNewsLst) {
		this.hyNewsLst = hyNewsLst;
	}
	public List<GuestBook> getGuestLst() {
		return guestLst;
	}
	public void setGuestLst(List<GuestBook> guestLst) {
		this.guestLst = guestLst;
	}
	
	
	

}
