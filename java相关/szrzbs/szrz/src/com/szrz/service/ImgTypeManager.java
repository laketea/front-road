/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.ImgType;


public interface ImgTypeManager {
	
	public void add(ImgType imgtype);
	
	public void update(ImgType imgtype);
	
	public void delete(Integer id);
	
	public List<ImgType> findAll();
	
	public ImgType get(Integer id);
	
	public Page findByPage(ImgType imgtype,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	

}
