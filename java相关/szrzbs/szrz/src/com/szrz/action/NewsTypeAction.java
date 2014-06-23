
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.NewsType;
import com.szrz.service.NewsTypeManager;


public class NewsTypeAction extends BaseAction {
	
	protected NewsTypeManager mgr;
	
	public List<NewsType> newsTypeLst ;
	
	public NewsType newsType;
	
	public Integer id;
	
	public String ids;

	public void setNewsTypeManager(NewsTypeManager mgr)
	{
		this.mgr = mgr;
	}
	
	/*
	 * 新闻类型列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getNewsType(),pageNum, getNumPerPage());
		List<NewsType> ss =(List<NewsType>)page.getList();
		setNewsTypeLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * 删除新闻类型
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 添加新闻类型
	 */
	public String add(){
		mgr.add(getNewsType());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 编辑新闻类型
	 */
	public String edit(){
		 newsType = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * 修改新闻类型
	 */
	public String update(){
		NewsType adm = mgr.get(getId());
		newsType.setId(getId());
		//newsType.setCreateDate(newsType.getCreateDate());
		mgr.update(newsType);
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


	public List<NewsType> getNewsTypeLst() {
		return newsTypeLst;
	}
	
	


	public void setNewsTypeLst(List<NewsType> newsTypeLst) {
		this.newsTypeLst = newsTypeLst;
	}

	public NewsType getNewsType() {
		return newsType;
	}

	public void setNewsType(NewsType newsType) {
		this.newsType = newsType;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
	
	
	
	

}
