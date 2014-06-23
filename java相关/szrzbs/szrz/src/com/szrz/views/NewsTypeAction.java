package com.szrz.views;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.szrz.common.hibernate.Page;
import com.szrz.domain.News;
import com.szrz.domain.NewsType;
import com.szrz.service.GuestBookManager;
import com.szrz.service.NewsManager;
import com.szrz.service.NewsTypeManager;

public class NewsTypeAction extends ActionSupport {
	
	protected NewsManager mgr;
	
	protected NewsTypeManager tmgr;
	
	private NewsType  newsType;
	
	private List<NewsType> typeLst;
	
	private Page newsPage;
	
	private String id;
	
	private String page ="1";
	
	private String pageSize ="12";
	
	public void setNewsManager(NewsManager mgr) {
		this.mgr = mgr;
	}
	public void setNewsTypeManager(NewsTypeManager gmgr) {
		this.tmgr = gmgr;
	}
	
	
	public String execute() throws Exception{
		typeLst = tmgr.findAll();
		newsType = tmgr.get(Integer.valueOf(id));
		newsPage = mgr.findByPage((new News(id)), Integer.valueOf(page), Integer.valueOf(pageSize));
		return "newstype";
	}
	public NewsType getNewsType() {
		return newsType;
	}
	public void setNewsType(NewsType newsType) {
		this.newsType = newsType;
	}
	public Page getNewsPage() {
		return newsPage;
	}
	public void setNewsPage(Page newsPage) {
		this.newsPage = newsPage;
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
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	public List<NewsType> getTypeLst() {
		return typeLst;
	}
	public void setTypeLst(List<NewsType> typeLst) {
		this.typeLst = typeLst;
	}
	
	
	
	

}
