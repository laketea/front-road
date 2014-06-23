package com.szrz.views;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.szrz.domain.News;
import com.szrz.domain.NewsType;
import com.szrz.service.GuestBookManager;
import com.szrz.service.NewsManager;
import com.szrz.service.NewsTypeManager;

public class NewsAction extends ActionSupport {
	
protected NewsManager mgr;
	
	protected NewsTypeManager tmgr;
	
	public void setNewsManager(NewsManager mgr) {
		this.mgr = mgr;
	}
	public void setNewsTypeManager(NewsTypeManager gmgr) {
		this.tmgr = gmgr;
	}
	
	List<NewsType> typeLst;
	
	List<List<News>> newsLst;
	
	public String execute() throws Exception{
		typeLst = tmgr.findAll();
		if(typeLst!=null&&!typeLst.isEmpty()){
			for(NewsType ntype:typeLst){
				ntype.setLst(mgr.findTop(String.valueOf(ntype.getId()), 6));
			}
		}
		return "news";
	}
	public List<NewsType> getTypeLst() {
		return typeLst;
	}
	public void setTypeLst(List<NewsType> typeLst) {
		this.typeLst = typeLst;
	}
	
	

}
