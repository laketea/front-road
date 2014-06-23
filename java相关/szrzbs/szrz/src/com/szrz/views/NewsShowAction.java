package com.szrz.views;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.szrz.domain.News;
import com.szrz.domain.NewsType;
import com.szrz.service.GuestBookManager;
import com.szrz.service.NewsManager;
import com.szrz.service.NewsTypeManager;

public class NewsShowAction extends ActionSupport {
	
	protected NewsManager mgr;
	
	protected NewsTypeManager tmgr;
	
	private List<NewsType> typeLst;
	
	private News news;
	
	
	
	private String id;
	
	public void setNewsManager(NewsManager mgr) {
		this.mgr = mgr;
	}

	public void setNewsTypeManager(NewsTypeManager gmgr) {
		this.tmgr = gmgr;
	}
	
	public String execute() throws Exception{
		typeLst = tmgr.findAll();
		news = mgr.get(Integer.valueOf(id));
		return "newsshow";
	}



	public News getNews() {
		return news;
	}



	public void setNews(News news) {
		this.news = news;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}
	
	public List<NewsType> getTypeLst() {
		return typeLst;
	}
	public void setTypeLst(List<NewsType> typeLst) {
		this.typeLst = typeLst;
	}
	
	
	
	

}
