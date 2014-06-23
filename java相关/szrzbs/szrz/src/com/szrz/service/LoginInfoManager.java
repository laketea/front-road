/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.LoginInfo;


public interface LoginInfoManager {
	
	public void add(LoginInfo logininfo);
	
	public void update(LoginInfo logininfo);
	
	public void delete(Integer id);
	
	public List<LoginInfo> findAll();
	
	public LoginInfo get(Integer id);
	
	public Page findByPage(LoginInfo logininfo,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	

}
