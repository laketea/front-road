package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
import java.util.Iterator;


import com.bookstore.exception.DBException;
import com.bookstore.form.AdminForm;
import com.bookstore.po.Admin;
import com.bookstore.po.User;
import com.bookstore.po.Address;
import com.bookstore.po.Subject;
import com.bookstore.service.AdminService;
import com.bookstore.util.HibernateSessionFactory;


public class UserDAO implements IUserDAO  {

	public void addUser(User user) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(user);
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
	
	public void addAddress(Address address) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(address);
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
	
	
	public void addSubject(Subject subject) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(subject);
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
	
	
	public User getUserByName(String name) throws DBException {
		Session session;
		User user = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.User User where User.username=:name")
					.setString("name", name).list();
			if (list != null && list.size() > 0) {
				user = (User) list.get(0);
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
		return user;
	}
	
	public User getUserByEmail(String name) throws DBException {
		Session session;
		User user = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.User User where User.email=:name")
					.setString("name", name).list();
			if (list != null && list.size() > 0) {
				user = (User) list.get(0);
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
		return user;
	}
	
	public User getUserByEname(String name) throws DBException {
		Session session;
		User user = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.User User where User.email=:name or User.username=:names")
					.setString("name", name).setString("names", name).list();
			if (list != null && list.size() > 0) {
				user = (User) list.get(0);
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
		return user;
	}
	
	public Subject getSubjectByName(String name) throws DBException {
		Session session;
		Subject subject = null;
		String sql = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Subject Subject where Subject.firstname=:name or Subject.secondname=:sname")
					.setString("name", name).setString("sname", name).list();
			if (list != null && list.size() > 0) {
				subject = (Subject) list.get(0);
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
		return subject;
	}
	
	public List getSecondByFirst(long id) throws DBException {
		Session session;
		//Subject subject = null;
		//String sql = null;
		List list = null;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Subject Subject where Subject.first=:name ")
					.setLong("name", id).list();
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
		return list;
	}
	
	public List getAddressList(Long id) throws DBException {
		Session session;
		//Subject subject = null;
		//String sql = null;
		List list = null;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Address Address where Address.userid=:name order by status  desc , id desc ")
					.setLong("name", id).list();
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
		return list;
	}
	
	public Subject getSubjectByName(Subject subs) throws DBException {
		Session session;
		Subject subject = null;
		String sql = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Subject Subject where Subject.firstname=:name and Subject.secondname=:sname")
					.setString("name", subs.getFirstname()).setString("sname", subs.getSecondname()).list();
			if (list != null && list.size() > 0) {
				subject = (Subject) list.get(0);
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
		return subject;
	}
	
	/*public Fav checkFav(String bookid , String userid) throws DBException {
		Session session;
		Fav fav = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Fav Fav where Fav.bookid=:bookid and Fav.userid=:userid")
					.setString("bookid", bookid)
					.setString("userid", userid)
					.list();
			if (list != null && list.size() > 0) {
				fav = (Fav) list.get(0);
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
		return fav;
	}
	*/
	
	
	public void deleteUser(Long id) throws DBException {
		Session session;
		User user = null;
		Transaction tx = null;
		try {
		session = HibernateSessionFactory.currentSession();
		tx = session.beginTransaction();
		user = (User) session.load(User.class, id);
		session.delete(user);
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
	
	public void deleteAddress(Long id) throws DBException {
		Session session;
		Address add = null;
		Transaction tx = null;
		try {
		session = HibernateSessionFactory.currentSession();
		tx = session.beginTransaction();
		add = (Address) session.load(Address.class, id);
		session.delete(add);
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
	
	
	public void deleteSubject(Long id) throws DBException {
		Session session;
		Subject subject = null;
		Transaction tx = null;
		try {
		session = HibernateSessionFactory.currentSession();
		tx = session.beginTransaction();
		subject = (Subject) session.load(Subject.class, id);
		session.delete(subject);
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

	public void updateUser(User user) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(user);
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
	
	public void updateSubject(Subject subject) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(subject);
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
	
	public void updateAddress(Address add) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(add);
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


	public User getUser(Long id) throws DBException {
		Session session;
		User user = null;
		try {
			session = HibernateSessionFactory.currentSession();
			user = (User) session.get(User.class, id);
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
		return user;
	}
	
	public Address getAddress(Long id) throws DBException {
		Session session;
		Address address = null;
		try {
			session = HibernateSessionFactory.currentSession();
			address = (Address) session.get(Address.class, id);
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
		return address;
	}
	
	public Subject getSubject(Long id) throws DBException {
		Session session;
		Subject subject = null;
		try {
			session = HibernateSessionFactory.currentSession();
			subject = (Subject) session.get(Subject.class, id);
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
		return subject;
	}

	

	public List getUserList() throws DBException {
		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.User User  ")
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
	
	public List getSubjectList( int cl) throws DBException {
		List list = null;
		Session session;
		String sql = null;
		if(cl==1){
			sql="from com.bookstore.po.Subject Subject where first=0 order by point asc";
		}else{
			sql="from com.bookstore.po.Subject Subject where first>0 order by point asc";
		}
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(sql)
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
	
	
	
	public List getUserListByPage( int pagesize , int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.User User  ")
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
	
	public List getFavListByPage( int pagesize , int curpage , String userid) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Fav fav where fav.userid=:userid order by id desc ")
					.setString("userid",userid)
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
	
public int getFavCount( String userid ) throws DBException {
 		
 		int totalCount;
 		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Fav fav where fav.userid=:userid order by id desc ")
					.setString("userid",userid)
					.list();
 			totalCount = list.size();
 			
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
 		return  totalCount;     

 	}
}
