package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;


import com.bookstore.exception.DBException;
import com.bookstore.po.Admin;
import com.bookstore.util.HibernateSessionFactory;

public class AdminDAO implements IAdminDAO  {

	public void addAdmin(Admin admin) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(admin);
			tx.commit();
		} catch (HibernateException e) {

			try {
				tx.rollback();

			} catch (HibernateException e1) {
				e1.printStackTrace();

			}
			e.printStackTrace();
			throw new DBException("保存对象失败！");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
	}
	
	public Admin getAdminByName(String name) throws DBException {
		Session session;
		Admin admin = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Admin admin where admin.name=:name")
					.setString("name", name).list();
			if (list != null && list.size() > 0) {
				admin = (Admin) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("获取对象失败！");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
		return admin;
	}
	
	public void deleteAdmin(Long id) throws DBException {
		Session session;
		Admin admin = null;
		Transaction tx = null;
		try {
		session = HibernateSessionFactory.currentSession();
		tx = session.beginTransaction();
		admin = (Admin) session.load(Admin.class, id);
		session.delete(admin);
		tx.commit();
		} catch (HibernateException e) {

			try {
				tx.rollback();

			} catch (HibernateException e1) {
				e1.printStackTrace();

			}
			e.printStackTrace();
			throw new DBException("更新对象失败！");
		} finally {
			try {
		HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
	}

	public void updateAdmin(Admin admin) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(admin);
			tx.commit();
		} catch (HibernateException e) {

			try {
				tx.rollback();

			} catch (HibernateException e1) {
				e1.printStackTrace();

			}
			e.printStackTrace();
			throw new DBException("获取对象失败！");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
	}


	public Admin getAdmin(Long id) throws DBException {
		Session session;
		Admin admin = null;
		try {
			session = HibernateSessionFactory.currentSession();
			admin = (Admin) session.get(Admin.class, id);
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("获取对象失败！");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
		return admin;
	}

	

	public List getAdminList() throws DBException {
		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Admin admin  ")
					.list();
			System.out.println(">>>>>>>>>>>>>>>>>"+list.size());

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("获取对象失败！");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("关闭session失败！");
			}
		}
		return list;
	}
	
	public List getAdminListByPage( int pagesize , int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Admin admin  ")
					.setFirstResult((curpage-1)*pagesize)
					.setMaxResults(pagesize)
					.list();
			System.out.println(">>>>>>>>>>>>>>>>>"+list.size());

		} catch (HibernateException e) {
			e.printStackTrace();
			throw new DBException("获取对象失败！");
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new DBException("关闭session失败！");
			}
		}
		return list;
	}
}
