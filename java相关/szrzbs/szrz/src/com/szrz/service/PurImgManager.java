/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.PurImg;


public interface PurImgManager {
	
	public void add(PurImg purimg);
	
	public void update(PurImg purimg);
	
	public void delete(Integer id);
	
	public List<PurImg> findAll();
	
	public PurImg get(Integer id);
	
	public Page findByPage(PurImg purimg,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	

}
