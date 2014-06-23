
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.News;
import com.szrz.domain.NewsType;
import com.szrz.service.NewsManager;
import com.szrz.service.NewsTypeManager;


public class NewsAction extends BaseAction {
	
	protected NewsManager mgr;
	
	protected NewsTypeManager typeMgr;
	
	public List<News> newsLst ;
	
	public List<NewsType> newsTypeLst;
	
	public News news;
	
	public Integer id;
	
	public String ids;
	
	public void setNewsTypeManager(NewsTypeManager typeMgr)
	{
		this.typeMgr = typeMgr;
	}

	public void setNewsManager(NewsManager mgr)
	{
		this.mgr = mgr;
	}
	
	/*
	 * 新闻列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getNews(),pageNum, getNumPerPage());
		List<News> ss =(List<News>)page.getList();
		setNewsLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * 删除新闻
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 添加新闻
	 */
	public String save(){
		mgr.add(getNews());
		return ajaxForwardSuccess("操作成功!");
	}
	
	public String add(){
		this.newsTypeLst =typeMgr.findAll();
		return "add";
	}
	
	
	/*
	 * 编辑新闻
	 */
	public String edit(){
		 news = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * 修改新闻
	 */
	public String update(){
		News adm = mgr.get(getId());
		news.setId(getId());
		//news.setCreateDate(news.getCreateDate());
		mgr.update(news);
		return ajaxForwardSuccess("修改成功!");
	}
	
	/*
	 * 批量删除
	 */
	public String batch(){
		 mgr.batchDelete(ids);	
		return ajaxForwardSuccess("操作成功!");
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public List<News> getNewsLst() {
		return newsLst;
	}
	
	


	public void setNewsLst(List<News> newsLst) {
		this.newsLst = newsLst;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public List<NewsType> getNewsTypeLst() {
		return newsTypeLst;
	}

	public void setNewsTypeLst(List<NewsType> newsTypeLst) {
		this.newsTypeLst = newsTypeLst;
	}
	
	
	
	
	
	
	
	

}
