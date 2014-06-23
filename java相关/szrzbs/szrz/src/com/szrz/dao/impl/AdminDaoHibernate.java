package com.szrz.dao.impl;

import java.util.*; 

import com.szrz.domain.*;
import com.szrz.common.hibernate.*;
import com.szrz.dao.*;


 
public class AdminDaoHibernate
	extends ZoHibernateDaoSupport
	implements AdminDao
{
	/**
	 * 根据标识属性来加载Admin实例
	 * @param id 需要加载的Admin实例的标识属性值
	 * @return 指定标识属性对应的Admin实例
	 */
	public Admin get(Integer id)
	{
		return getHibernateTemplate()
			.get(Admin.class , id);
	}

	/**
	 * 持久化指定的Admin实例
	 * @param Admin 需要被持久化的Admin实例
	 * @return Admin实例被持久化后的标识属性值
	 */
	public Integer save(Admin admin)
	{
		return (Integer)getHibernateTemplate()
			.save(admin);
	}

	/**
	 * 修改指定的Admin实例
	 * @param Admin 需要被修改的Admin实例
	 */
	public void update(Admin admin)
	{
		getHibernateTemplate()
			.update(admin);
	}

	/**
	 * 删除指定的Admin实例
	 * @param Admin 需要被删除的Admin实例
	 */
	public void delete(Admin admin)
	{
		getHibernateTemplate()
			.delete(admin);
	}

	/**
	 * 根据标识属性删除Admin实例
	 * @param id 需要被删除的Admin实例的标识属性值
	 */
	public void delete(Integer id)
	{
		getHibernateTemplate()
			.delete(get(id));
	}

	/**
	 * 查询全部的Admin实例
	 * @return 数据库中全部的Admin实例
	 */
	public List<Admin> findAll()
	{
		return (List<Admin>)getHibernateTemplate()
			.find("from Admin");
	}

	
	public List<Admin> findByNamePwd(String name,String pwd )
	{
		return (List<Admin>)getHibernateTemplate()
			.find("from Admin as a where "
			+ "a.name=? and a.pwd=?" , name,pwd);
	}
		
	public List findByPage(int pageNo,int pageSize )
	{
		List lst = findByPage(" from Admin " , pageNo,pageSize);
		return lst;
	}
}
