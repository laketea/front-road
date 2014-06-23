/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.NewsType;


public interface NewsTypeManager {
	
	public void add(NewsType newstype);
	
	public void update(NewsType newstype);
	
	public void delete(Integer id);
	
	public List<NewsType> findAll();
	
	public NewsType get(Integer id);
	
	public Page findByPage(NewsType newstype,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	

}
