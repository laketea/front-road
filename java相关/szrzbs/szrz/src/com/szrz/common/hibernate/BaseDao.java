package com.szrz.common.hibernate;

import java.util.List;


public class BaseDao extends ZoHibernateDaoSupport {
	
	public <T> T get(Class<T> c,String id)
	{
		return getHibernateTemplate()
			.get(c , id);
	}

	public <T> Integer save(T c)
	{
		return (Integer)getHibernateTemplate()
			.save(c);
	}

	public <T> void update(T entity)
	{
		getHibernateTemplate()
			.update(entity);
	}

	public <T> void delete(T entity)
	{
		getHibernateTemplate()
			.delete(entity);
	}
	
	public void batchDelete(String ids){
		getHibernateTemplate().bulkUpdate("delete from UserInvite where id in ("+ids+")");
	}
	
	public List findByPage(int pageNo,int pageSize )
	{
		List lst = findByPage(" from UserInvite " , pageNo,pageSize);
		return lst;
	}
	

}
