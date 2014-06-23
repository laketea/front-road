/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.CopyRightImg;


public interface CopyRightImgManager {
	
	public void add(CopyRightImg copyrightimg);
	
	public void update(CopyRightImg copyrightimg);
	
	public void delete(Integer id);
	
	public List<CopyRightImg> findAll();
	
	public CopyRightImg get(Integer id);
	
	public Page findByPage(CopyRightImg copyrightimg,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	

}
