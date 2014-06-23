/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.auto.common.Utils;
import com.szrz.common.hibernate.Page;
import com.szrz.dao.UserDao;
import com.szrz.domain.Admin;
import com.szrz.domain.User;
import com.szrz.service.UserManager;


public class UserManagerImpl implements UserManager {
	
	
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	/*
	 * 添加管
	 * 
	 */
	public void add(User user) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		user.setRegTime(create_date);
		userDao.save(user);
	}

	/*
	 * 删除
	 */
	@Override
	public void delete(Integer id) {
		userDao.deleteByKey(id);
	}
	
	/* 
	 * 根据id获取实例
	 */
	public User get(Integer id){
		return userDao.get(id);
	}

	/* 
	 * 修改
	 */
	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}



	/* 
	 * 查询所有
	 */
	public List<User> findAll() {
		return  userDao.findByHql("from User");
	}
	/*
	 * 分页查询
	 */
	public Page findByPage(User user, int pageNo, int pageSize) {
		String hql = " from User where 1=1 ";
		if (user != null) {
			if (Utils.notNull(user.getName())) {
				hql += " and name like '%" + user.getName() + "%' ";
				hql += " and nick like '%" + user.getName() + "%' ";
				hql += " and email like '%" + user.getName() + "%' ";
				hql += " and idCard like '%" + user.getName() + "%' ";
				hql += " and userWork like '%" + user.getName() + "%' ";
			}
			
		}
		List lst = userDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = userDao.findByHql(hql);
		int totalRecords = allLst.size();
		Page page = new Page(lst);
		page.setTotalRecords(totalRecords);
		page.setPageSize(pageSize);
		page.setCurPageNumber(pageNo);
		return page;
	}
	
	public User findByNamePwd(String name,String pwd )
	{
		List lst = userDao.find("from User as a where  a.nick='"+name+"' and a.passward='"+pwd+"'" );
		if(lst==null||lst.size()<1){
			return null;
		}else{
			return (User)lst.get(0);
		}
		
	}
	
	public User findByName(String name)
	{
		List lst = userDao.find("from User as a where  a.nick='"+name+"' " );
		if(lst==null||lst.size()<1){
			return null;
		}else{
			return (User)lst.get(0);
		}
	}
	
	public User findByIdCard(String idCard)
	{
		List lst = userDao.find("from User as a where  a.idCard='"+idCard+"' " );
		if(lst==null||lst.size()<1){
			return null;
		}else{
			return (User)lst.get(0);
		}
	}
	
	/*
	 * 批量删除
	 */
	public void batchDelete(String ids){
		userDao.bulkUpdate("delete from User where id in( "+ids+" )");
	}

}
