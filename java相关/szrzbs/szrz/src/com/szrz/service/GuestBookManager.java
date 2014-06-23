/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.GuestBook;


public interface GuestBookManager {
	
	public void add(GuestBook guestbook);
	
	public void update(GuestBook guestbook);
	
	public void delete(Integer id);
	
	public List<GuestBook> findAll();
	
	public GuestBook get(Integer id);
	
	public Page findByPage(GuestBook guestbook,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	public List<GuestBook> findTop(int size);
	
	

}
