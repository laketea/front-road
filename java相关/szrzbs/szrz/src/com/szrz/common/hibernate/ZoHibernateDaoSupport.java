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
	 * ʹ��hql�����з�ҳ��ѯ
	 * @param hql ��Ҫ��ѯ��hql���
	 * @param offset ��һ����¼����
	 * @param pageSize ÿҳ��Ҫ��ʾ�ļ�¼��
	 * @return ��ǰҳ�����м�¼
	 */
	public List findByPage(final String hql , 
			final int pageNo, final int pageSize)
		{
			//ͨ��һ��HibernateCallback������ִ�в�ѯ
		List list = (List)getHibernateTemplate()
				.executeFind(new HibernateCallback()
			{
				//ʵ��HibernateCallback�ӿڱ���ʵ�ֵķ���
				public Object doInHibernate(Session session)
					throws HibernateException, SQLException
				{
					//ִ��Hibernate��ҳ��ѯ
					List result = session.createQuery(hql)
						//Ϊhql��䴫�����
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
	 * ʹ��hql�����з�ҳ��ѯ
	 * @param hql ��Ҫ��ѯ��hql���
	 * @param values ���hql�ж����������Ҫ���룬values���Ǵ���hql�Ĳ�������
	 * @param offset ��һ����¼����
	 * @param pageSize ÿҳ��Ҫ��ʾ�ļ�¼��
	 * @return ��ǰҳ�����м�¼
	 */
	public List findByPage(final String hql, final Object[] values,
		final int offset, final int pageSize)
	{
		//ͨ��һ��HibernateCallback������ִ�в�ѯ
		String aa="";
		List list = getHibernateTemplate()
			.executeFind(new HibernateCallback()
		{
			//ʵ��HibernateCallback�ӿڱ���ʵ�ֵķ���
			public Object doInHibernate(Session session)
				throws HibernateException, SQLException
			{
				//ִ��Hibernate��ҳ��ѯ
				Query query = session.createQuery(hql);
				//Ϊhql��䴫�����
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
			//ͨ��һ��HibernateCallback������ִ�в�ѯ
			String aa="";
			List list = getHibernateTemplate()
				.executeFind(new HibernateCallback()
			{
				//ʵ��HibernateCallback�ӿڱ���ʵ�ֵķ���
				public Object doInHibernate(Session session)
					throws HibernateException, SQLException
				{
					//ִ��Hibernate��ҳ��ѯ
					Query query = session.createQuery(hql);
					//Ϊhql��䴫�����
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
			//ͨ��һ��HibernateCallback������ִ�в�ѯ
			String aa="";
			List list = getHibernateTemplate()
				.executeFind(new HibernateCallback()
			{
				//ʵ��HibernateCallback�ӿڱ���ʵ�ֵķ���
				public Object doInHibernate(Session session)
					throws HibernateException, SQLException
				{
					//ִ��Hibernate��ҳ��ѯ
					Query query = session.createQuery(hql);
					//Ϊhql��䴫�����			
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
