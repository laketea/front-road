/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.GuestBookType;


public interface GuestBookTypeManager {
	
	public void add(GuestBookType guestbooktype);
	
	public void update(GuestBookType guestbooktype);
	
	public void delete(Integer id);
	
	public List<GuestBookType> findAll();
	
	public GuestBookType get(Integer id);
	
	public Page findByPage(GuestBookType guestbooktype,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	

}
