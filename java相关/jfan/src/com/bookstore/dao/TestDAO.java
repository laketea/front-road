package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.Criteria;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
import net.sf.hibernate.expression.Example;
import net.sf.hibernate.expression.MatchMode;
import net.sf.hibernate.expression.Order;


import com.bookstore.exception.DBException;
import com.bookstore.po.Review;
import com.bookstore.po.Test;
import com.bookstore.util.HibernateSessionFactory;

public class TestDAO implements ITestDAO  {
	
	
//添加教案***********************************************************************
	public void addTest(Test test) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(test);
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
	
	
	//
	public Test getTestBySubject(String subject) throws DBException {
		Session session;
		Test test = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Test test where test.subject=:subject order by id desc")
					.setString("subject", subject).list();
			if (list != null && list.size() > 0) {
				test = (Test) list.get(0);
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
		return test;
	}
	
//根据标题获取教案*************************************************************************
	public Test getTestByTitle(String title) throws DBException {
		Session session;
		Test test = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Test test where test.title=:title")
					.setString("title", title).list();
			if (list != null && list.size() > 0) {
				test = (Test) list.get(0);
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
		return test;
	}
	
//删除教案**********************************************************************
	public void deleteTest(Long id) throws DBException {
		Session session;
		Test test = null;
		Transaction tx = null;
		try {
		session = HibernateSessionFactory.currentSession();
		tx = session.beginTransaction();
		test = (Test) session.load(Test.class, id);
		session.delete(test);
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
	
//修改教案**********************************************************************
	public void updateTest(Test test) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(test);
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

//根据ID获取教案**********************************************************************
	public Test getTest(Long id) throws DBException {
		Session session;
		Test test = null;
		try {
			session = HibernateSessionFactory.currentSession();
			test = (Test) session.get(Test.class, id);
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
		return test;
	}

	
//根据年级科目分页获取教案**********************************************************************
	public List getSearchListByPage( Test test,int pagesize,int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			//Criteria criteria = new Criteria();
			Example exampleTest = Example.create(test);
			exampleTest.ignoreCase().enableLike(MatchMode.ANYWHERE);
			Criteria criteria = session.createCriteria(Test.class)
								.add(exampleTest)
								.addOrder(Order.desc("id"))
								.setFirstResult((curpage-1)*pagesize)
								.setMaxResults(pagesize);
			list = criteria.list();
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
	
	public List getGRListByPage( String grade,String subject,int pagesize,int curpage) throws DBException {
		List list = null;
		Test test = new Test();
		test.setGrade(grade);
		test.setSubject(subject);
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			//Criteria criteria = new Criteria();
			Example exampleTest = Example.create(test);
			exampleTest.ignoreCase().enableLike(MatchMode.ANYWHERE);
			Criteria criteria = session.createCriteria(Test.class)
								.add(exampleTest)
								.addOrder(Order.desc("id"))
								.setFirstResult((curpage-1)*pagesize)
								.setMaxResults(pagesize);
			list = criteria.list();
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
	
	public List getGRTListByPage( String grade,String subject,String types ,int pagesize,int curpage) throws DBException {
		List list = null;
		Test test = new Test();
		test.setGrade(grade);
		test.setSubject(subject);
		test.setTypes(types);
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			//Criteria criteria = new Criteria();
			Example exampleTest = Example.create(test);
			exampleTest.ignoreCase().enableLike(MatchMode.ANYWHERE);
			Criteria criteria = session.createCriteria(Test.class)
								.add(exampleTest)
								.addOrder(Order.desc("id"))
								.setFirstResult((curpage-1)*pagesize)
								.setMaxResults(pagesize);
			list = criteria.list();
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
	
//分页获取教案**********************************************************************
	public List getTestListByPage( int pagesize , int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize-1)*curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery("from com.bookstore.po.Test test order by id desc")
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
	
	//获取教案总数
	public int getTestCount( ) throws DBException {
		int counts;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			Integer count = (Integer) session
					.createQuery("select count(*) from com.bookstore.po.Test test ")
					.uniqueResult();	
			counts   =  count.intValue(); 

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
		return counts;
	}
	
	//根据搜索条件获取教案总数
     public int getTestCountSearch( Test test ) throws DBException {
		
		int totalCount;
		Session session;
		Criteria criteria;
		try {
			session = HibernateSessionFactory.currentSession();
			Example examplePlan = Example.create(test);
			examplePlan.ignoreCase().enableLike(MatchMode.ANYWHERE);
			criteria = session.createCriteria(Test.class)
								.add(examplePlan);
			totalCount = criteria.list().size();
			
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
     
     public int getGRTCount( String grade,String subject,String types ) throws DBException {
 		List list = null;
 		Test test = new Test();
 		test.setGrade(grade);
 		test.setSubject(subject);
 		test.setTypes(types);
 		int totalCount;
 		Session session;
 		try {
 			session = HibernateSessionFactory.currentSession();
 			//Criteria criteria = new Criteria();
 			Example exampleTest = Example.create(test);
 			exampleTest.ignoreCase().enableLike(MatchMode.ANYWHERE);
 			Criteria criteria = session.createCriteria(Test.class)
 								.add(exampleTest);
 			totalCount = criteria.list().size();

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
 		return totalCount;
 	}
     
     
	
}
