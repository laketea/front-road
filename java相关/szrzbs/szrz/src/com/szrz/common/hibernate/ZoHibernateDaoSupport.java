package com.szrz.common.hibernate;


import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.HibernateException;

import com.szrz.domain.Admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 * <br/>Copyright (C), 2001-2012, zhangwei
 * <br/>This program is protected by copyright laws.
 * <br/>Program Name:
 * <br/>Date:
 * @author  zhangwei laketea@163.com
 * @version  1.0
 */
public class ZoHibernateDaoSupport
	extends HibernateDaoSupport
{
	
	public List findByPageHql(String hql,int pageNo,int pageSize )
	{
		List lst = findByPage(hql , pageNo,pageSize);
		return lst;
	}
	
	public List findByHql(String hql)
	{
		return (List)getHibernateTemplate()
				.find(hql);
	}		
	/**
	 * 使用hql语句进行分页查询
	 * @param hql 需要查询的hql语句
	 * @param offset 第一条记录索引
	 * @param pageSize 每页需要显示的记录数
	 * @return 当前页的所有记录
	 */
	public List findByPage(final String hql , 
			final int pageNo, final int pageSize)
		{
			//通过一个HibernateCallback对象来执行查询
		List list = (List)getHibernateTemplate()
				.executeFind(new HibernateCallback()
			{
				//实现HibernateCallback接口必须实现的方法
				public Object doInHibernate(Session session)
					throws HibernateException, SQLException
				{
					//执行Hibernate分页查询
					List result = session.createQuery(hql)
						//为hql语句传入参数
						.setFirstResult((pageNo-1)*pageSize)
						.setMaxResults(pageSize)
						.list();
//					int totalRecords = session.createQuery(hql).list().size();
//					Page page = new Page(result);
//					page.setTotalRecords(totalRecords);
//					page.setPageSize(pageSize);
//					page.setCurPageNumber(pageNo);
					return result;
				}
			});
			return list;
		}

	

	/**
	 * 使用hql语句进行分页查询
	 * @param hql 需要查询的hql语句
	 * @param values 如果hql有多个个参数需要传入，values就是传入hql的参数数组
	 * @param offset 第一条记录索引
	 * @param pageSize 每页需要显示的记录数
	 * @return 当前页的所有记录
	 */
	public List findByPage(final String hql, final Object[] values,
		final int offset, final int pageSize)
	{
		//通过一个HibernateCallback对象来执行查询
		String aa="";
		List list = getHibernateTemplate()
			.executeFind(new HibernateCallback()
		{
			//实现HibernateCallback接口必须实现的方法
			public Object doInHibernate(Session session)
				throws HibernateException, SQLException
			{
				//执行Hibernate分页查询
				Query query = session.createQuery(hql);
				//为hql语句传入参数
				for (int i = 0 ; i < values.length ; i++)
				{
					query.setParameter( i, values[i]);
				}
				List result = query.setFirstResult(offset)
					.setMaxResults(pageSize)
					.list();
				return result;
			}
		});
		return list;
	}
	
	public List findByParams(final String hql, final Object[] values
			)
		{
			//通过一个HibernateCallback对象来执行查询
			String aa="";
			List list = getHibernateTemplate()
				.executeFind(new HibernateCallback()
			{
				//实现HibernateCallback接口必须实现的方法
				public Object doInHibernate(Session session)
					throws HibernateException, SQLException
				{
					//执行Hibernate分页查询
					Query query = session.createQuery(hql);
					//为hql语句传入参数
					for (int i = 0 ; i < values.length ; i++)
					{
						query.setParameter( i, values[i]);
					}
					List result = query.list();
					return result;
				}
			});
			return list;
		}
	
	public List findByParams(final String hql, final Object value
			)
		{
			//通过一个HibernateCallback对象来执行查询
			String aa="";
			List list = getHibernateTemplate()
				.executeFind(new HibernateCallback()
			{
				//实现HibernateCallback接口必须实现的方法
				public Object doInHibernate(Session session)
					throws HibernateException, SQLException
				{
					//执行Hibernate分页查询
					Query query = session.createQuery(hql);
					//为hql语句传入参数			
					query.setParameter( 0, value);
					List result = query.list();
					return result;
				}
			});
			return list;
		}
	
	public Integer findCountSize(final String hql,final Object value ,final Object[] values){
		List lst =null;
		if(value==null&&values==null){
			lst = getHibernateTemplate()
					.find(hql);
		}else if(value!=null&&values==null){
			lst =this.findByParams(hql,value);
		}else if(value==null&&values!=null){
			lst =this.findByParams(hql,values);
		}
		return lst==null?0:lst.size();	
	}
	
	
}
