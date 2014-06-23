/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.UserInfo;


public interface UserInfoManager {
	
	public void add(UserInfo userinfo);
	
	public void update(UserInfo userinfo);
	
	public void delete(Integer id);
	
	public List<UserInfo> findAll();
	
	public UserInfo get(Integer id);
	
	public Page findByPage(UserInfo userinfo,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	

}
