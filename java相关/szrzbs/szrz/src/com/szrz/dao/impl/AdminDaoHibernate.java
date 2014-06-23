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
	 * ���ݱ�ʶ����������Adminʵ��
	 * @param id ��Ҫ���ص�Adminʵ���ı�ʶ����ֵ
	 * @return ָ����ʶ���Զ�Ӧ��Adminʵ��
	 */
	public Admin get(Integer id)
	{
		return getHibernateTemplate()
			.get(Admin.class , id);
	}

	/**
	 * �־û�ָ����Adminʵ��
	 * @param Admin ��Ҫ���־û���Adminʵ��
	 * @return Adminʵ�����־û���ı�ʶ����ֵ
	 */
	public Integer save(Admin admin)
	{
		return (Integer)getHibernateTemplate()
			.save(admin);
	}

	/**
	 * �޸�ָ����Adminʵ��
	 * @param Admin ��Ҫ���޸ĵ�Adminʵ��
	 */
	public void update(Admin admin)
	{
		getHibernateTemplate()
			.update(admin);
	}

	/**
	 * ɾ��ָ����Adminʵ��
	 * @param Admin ��Ҫ��ɾ����Adminʵ��
	 */
	public void delete(Admin admin)
	{
		getHibernateTemplate()
			.delete(admin);
	}

	/**
	 * ���ݱ�ʶ����ɾ��Adminʵ��
	 * @param id ��Ҫ��ɾ����Adminʵ���ı�ʶ����ֵ
	 */
	public void delete(Integer id)
	{
		getHibernateTemplate()
			.delete(get(id));
	}

	/**
	 * ��ѯȫ����Adminʵ��
	 * @return ���ݿ���ȫ����Adminʵ��
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
