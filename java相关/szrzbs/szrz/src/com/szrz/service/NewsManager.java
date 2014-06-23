/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.News;


public interface NewsManager {
	
	public void add(News news);
	
	public void update(News news);
	
	public void delete(Integer id);
	
	public List<News> findAll();
	
	public News get(Integer id);
	
	public Page findByPage(News news,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	public List<News> findTop(String type,int size);
	
}
