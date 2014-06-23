package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;
import net.sf.hibernate.Criteria;
import net.sf.hibernate.Criteria.*;
import net.sf.hibernate.expression.Expression;
import net.sf.hibernate.expression.MatchMode;
import net.sf.hibernate.expression.Order;
import net.sf.hibernate.expression.Order.*;
import net.sf.hibernate.expression.*;
import org.hibernate.criterion.Projections;

import com.bookstore.exception.DBException;
import com.bookstore.po.Gods;
import com.bookstore.po.Review;
import com.bookstore.util.Page;
import com.bookstore.util.HibernateSessionFactory;

public class GodsDAO implements IGodsDAO {

	// 添加教案***********************************************************************
	public void addGods(Gods gods) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(gods);
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

	public Gods getTopGods() throws DBException {
		Session session;
		Gods Gods = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Gods Gods where Gods.firststatus=1 order by id desc")
					.list();
			if (list != null && list.size() > 0) {
				Gods = (Gods) list.get(0);
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
		return Gods;
	}

	// 根据标题获取商品*************************************************************************
	public Gods getGodsByName(String name) throws DBException {
		Session session;
		Gods Gods = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session.createQuery(
					"from com.bookstore.po.Gods Gods where Gods.name=:name")
					.setString("name", name).list();
			if (list != null && list.size() > 0) {
				Gods = (Gods) list.get(0);
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
		return Gods;
	}

	// 删除教案**********************************************************************
	public void deleteGods(Long id) throws DBException {
		Session session;
		Gods Gods = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			Gods = (Gods) session.load(Gods.class, id);
			session.delete(Gods);
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

	// 修改教案**********************************************************************
	public void updateGods(Gods Gods) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(Gods);
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

	// 根据ID获取教案**********************************************************************
	public Gods getGods(Long id) throws DBException {
		Session session;
		Gods Gods = null;
		try {
			session = HibernateSessionFactory.currentSession();
			Gods = (Gods) session.get(Gods.class, id);
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
		return Gods;
	}

	// 根据年级科目分页获取教案**********************************************************************
	public List getSearchListByPage(Gods Gods, int pagesize, int curpage)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			// Criteria criteria = new Criteria();
			Example examplePlan = Example.create(Gods);
			examplePlan.ignoreCase().enableLike(MatchMode.ANYWHERE);
			Criteria criteria = session.createCriteria(Gods.class).add(
					examplePlan).addOrder(Order.desc("id")).setFirstResult(
					(curpage - 1) * pagesize).setMaxResults(pagesize);
			list = criteria.list();
			/*
			 * list = session .createQuery("from com.Godsstore.po.Gods Gods
			 * where Gods.grade=:grade "+"and Gods.subject=:subject")
			 * .setString("grade",Gods.getGrade()) .setString("subject",
			 * Gods.getSubject()) .setFirstResult((curpage-1)*pagesize)
			 * .setMaxResults(pagesize) .list();
			 */
			System.out.println(">>>>>>>>>>>>>>>>>" + list.size());

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

	public Page getTodayGods(String sql, int pagesize, int curpage)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		int count;
		Page page = null;
		count = this.getTodayGodsCount();
		try {
			session = HibernateSessionFactory.currentSession();

			list = session.createQuery(
					"from com.bookstore.po.Gods Gods where Gods.defaultstatus=1 and status=0   "
							+ sql).setFirstResult((curpage - 1) * pagesize)
					.setMaxResults(pagesize).list();
			page = new Page(curpage, pagesize, count, list);
			System.out.println(">>>>>>>>>>>>>>>>>" + list.size());

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
		return page;
	}

	public Page getColumnGods(String sql, long column, int pagesize, int curpage)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		int count;
		Page page = null;
		count = this.getColumnGodsCount(column);
		try {
			session = HibernateSessionFactory.currentSession();

			list = session.createQuery(
					"from com.bookstore.po.Gods Gods where Gods.first=:name and status=0  "
							+ sql).setLong("name", column).setFirstResult(
					(curpage - 1) * pagesize).setMaxResults(pagesize).list();
			page = new Page(curpage, pagesize, count, list);
			System.out.println(">>>>>>>>>>>>>>>>>" + list.size());

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
		return page;
	}

	public int getGodsCount() throws DBException {

		int counts;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			Integer count = (Integer) session.createQuery(
					"select count(*) from com.bookstore.po.Gods Gods")
					.uniqueResult();
			counts = count.intValue();
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

	public int getTodayGodsCount() throws DBException {

		int counts;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			Integer count = (Integer) session
					.createQuery(
							"select count(*) from com.bookstore.po.Gods Gods where Gods.defaultstatus=1 and status=0 ")
					.uniqueResult();
			counts = count.intValue();
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

	public int getColumnGodsCount(long column) throws DBException {

		int counts;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			Integer count = (Integer) session
					.createQuery(
							"select count(*) from com.bookstore.po.Gods Gods where Gods.first=:name and status=0 ")
					.setLong("name", column).uniqueResult();
			counts = count.intValue();
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

	public int getGodsCount(int cl) throws DBException {

		int counts;
		Session session;
		String sql = null;
		if (cl == 2) {
			sql = "select count(*) from com.bookstore.po.Gods Gods where Gods.status=0 ";
		} else if (cl == 3) {
			sql = "select count(*) from com.bookstore.po.Gods Gods where Gods.status=1 ";
		} else if (cl == 4) {
			sql = "select count(*) from com.bookstore.po.Gods Gods where Gods.status=0 and Gods.firststatus=1 ";
		} else if (cl == 5) {
			sql = "select count(*) from com.bookstore.po.Gods Gods where Gods.status=0 and Gods.defaultstatus=1 ";
		} else {
			sql = "select count(*) from com.bookstore.po.Gods Gods ";
		}
		try {
			session = HibernateSessionFactory.currentSession();
			Integer count = (Integer) session.createQuery(sql).uniqueResult();
			counts = count.intValue();
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

	public int getSearchGodsCount(Gods Gods) throws DBException {

		int totalCount;
		Session session;
		Criteria criteria;
		try {
			session = HibernateSessionFactory.currentSession();
			Example examplePlan = Example.create(Gods);
			examplePlan.ignoreCase().enableLike(MatchMode.ANYWHERE);
			criteria = session.createCriteria(Gods.class).add(examplePlan);
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

	// 分页获取教案**********************************************************************
	public List getGodsListByPage(int pagesize, int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session.createQuery(
					"from com.bookstore.po.Gods Gods order by id desc ")
					.setFirstResult((curpage - 1) * pagesize).setMaxResults(
							pagesize).list();
			System.out.println(">>>>>>>>>>>>>>>>>" + list.size());

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

	public List getGodsListByPage(int pagesize, int curpage, int cl)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		String sql = null;
		if (cl == 2) {
			sql = " from com.bookstore.po.Gods Gods where Gods.status=0  order by id desc ";
		} else if (cl == 3) {
			sql = " from com.bookstore.po.Gods Gods where Gods.status=1  order by id desc ";
		} else if (cl == 4) {
			sql = " from com.bookstore.po.Gods Gods where Gods.status=0 and Gods.firststatus=1  order by id desc ";
		} else if (cl == 5) {
			sql = " from com.bookstore.po.Gods Gods where Gods.status=0 and Gods.defaultstatus=1 order by sn asc ";
		} else {
			sql = " from com.bookstore.po.Gods Gods order by id desc  ";
		}
		try {
			session = HibernateSessionFactory.currentSession();
			list = session.createQuery(sql)
					.setFirstResult((curpage - 1) * pagesize).setMaxResults(
							pagesize).list();
			System.out.println(">>>>>>>>>>>>>>>>>" + list.size());

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
