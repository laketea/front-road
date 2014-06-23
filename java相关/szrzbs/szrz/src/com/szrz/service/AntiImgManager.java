/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.AntiImg;


public interface AntiImgManager {
	
	public void add(AntiImg antiimg);
	
	public void update(AntiImg antiimg);
	
	public void delete(Integer id);
	
	public List<AntiImg> findAll();
	
	public AntiImg get(Integer id);
	
	public Page findByPage(AntiImg antiimg,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	

}
