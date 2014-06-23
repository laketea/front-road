/**
 * 
 */ 
package com.szrz.service; 

import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.User;


public interface UserManager {
	
	public void add(User user);
	
	public void update(User user);
	
	public void delete(Integer id);
	
	public List<User> findAll();
	
	public User get(Integer id);
	
	public Page findByPage(User user,int pageNo ,int PageSize);
	
	public void batchDelete(String ids);
	
	public User findByNamePwd(String name,String pwd );
	
	public User findByName(String name);
	
	public User findByIdCard(String name);

}
