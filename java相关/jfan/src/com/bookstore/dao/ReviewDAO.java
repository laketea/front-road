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
import com.bookstore.po.Suggest;
import com.bookstore.util.HibernateSessionFactory;
import com.bookstore.util.Page;

public class ReviewDAO implements IReviewDAO {

	// 添加教案***********************************************************************
	public void addReview(Review Review) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(Review);
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

	public void addSuggest(Suggest Suggest) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(Suggest);
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

	public Page getGodsReviewPage(int pagesize, int curpage, String id)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		int count;
		Page page = null;
		count = this.getGodsReviewCount(id);
		try {
			session = HibernateSessionFactory.currentSession();

			list = session
					.createQuery(
							"from com.bookstore.po.Review Review where Review.godsid=:id order by id desc  ")
					.setLong("id", Long.valueOf(id)).setFirstResult(
							(curpage - 1) * pagesize).setMaxResults(pagesize)
					.list();
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

	public int getGodsReviewCount(String id) throws DBException {

		int counts;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			Integer count = (Integer) session
					.createQuery(
							"select count(*) from com.bookstore.po.Review Review where Review.godsid=:id ")
					.setLong("id", Long.valueOf(id)).uniqueResult();
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

	public Page getReviewPage(int pagesize, int curpage)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		int count;
		Page page = null;
		count = this.getReviewCount();
		try {
			session = HibernateSessionFactory.currentSession();

			list = session
					.createQuery(
							"from com.bookstore.po.Review Review order  by id desc  ")
					.setFirstResult((curpage - 1) * pagesize).setMaxResults(pagesize)
					.list();
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

	public int getReviewCount() throws DBException {

		int counts;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			Integer count = (Integer) session
					.createQuery(
							"select count(*) from com.bookstore.po.Review   ")
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

	public Page getSuggestPage(int pagesize, int curpage, int id)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		int count;
		Page page = null;
		String sql = null;
		count = this.getSuggestCount(id);
		if (id == 1) {
			sql = "from com.bookstore.po.Suggest Suggest where Suggest.userid<>0 order by id desc  ";
		} else {
			sql = "from com.bookstore.po.Suggest Suggest where Suggest.userid=0 order by id desc  ";
		}
		try {
			session = HibernateSessionFactory.currentSession();

			list = session.createQuery(sql).setFirstResult(
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

	public int getSuggestCount(int id) throws DBException {

		int counts;
		Session session;
		String sql = null;
		if (id == 1) {
			sql = "select count(*) from com.bookstore.po.Suggest Suggest where Suggest.userid<>0 order by id desc  ";
		} else {
			sql = "select count(*) from com.bookstore.po.Suggest Suggest where Suggest.userid=0 order by id desc  ";
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

	public Page getUserReviewPage(int pagesize, int curpage, String id)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		int count;
		Page page = null;
		count = this.getUserReviewCount(id);
		try {
			session = HibernateSessionFactory.currentSession();

			list = session
					.createQuery(
							"from com.bookstore.po.Review Review where Review.userid=:id order by id desc  ")
					.setLong("id", Long.valueOf(id)).setFirstResult(
							(curpage - 1) * pagesize).setMaxResults(pagesize)
					.list();
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

	public Page getUserSuggestPage(int pagesize, int curpage, String id)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		int count;
		Page page = null;
		count = this.getUserSuggestCount(id);
		try {
			session = HibernateSessionFactory.currentSession();

			list = session
					.createQuery(
							"from com.bookstore.po.Suggest Suggest where Suggest.userid=:id order by id desc  ")
					.setString("id", id).setFirstResult(
							(curpage - 1) * pagesize).setMaxResults(pagesize)
					.list();
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

	public int getUserReviewCount(String id) throws DBException {

		int counts;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			Integer count = (Integer) session
					.createQuery(
							"select count(*) from com.bookstore.po.Review Review where Review.userid=:id ")
					.setLong("id", Long.valueOf(id)).uniqueResult();
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

	public int getUserSuggestCount(String id) throws DBException {

		int counts;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			Integer count = (Integer) session
					.createQuery(
							"select count(*) from com.bookstore.po.Suggest Suggest where Suggest.userid=:id ")
					.setString("id", id).uniqueResult();
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

	/*
	 * //根据标题获取教案*************************************************************************
	 * public Review getReviewByTitle(String title) throws DBException { Session
	 * session; Review Review = null; try { session =
	 * HibernateSessionFactory.currentSession(); List list = session
	 * .createQuery( "from com.bookstore.po.Review Review where
	 * Review.title=:title") .setString("title", title).list(); if (list != null &&
	 * list.size() > 0) { Review = (Review) list.get(0); } } catch
	 * (HibernateException e) { e.printStackTrace(); throw new
	 * DBException("获取对象失败！"); } finally { try {
	 * HibernateSessionFactory.closeSession(); } catch (HibernateException e) {
	 * e.printStackTrace(); } } return Review; }
	 * 
	 */
	// 删除教案**********************************************************************
	public void deleteReview(Long id) throws DBException {
		Session session;
		Review Review = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			Review = (Review) session.load(Review.class, id);
			session.delete(Review);
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

	public void deleteSuggest(Long id) throws DBException {
		Session session;
		Suggest Suggest = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			Suggest = (Suggest) session.load(Suggest.class, id);
			session.delete(Suggest);
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
	public void updateSuggest(Suggest Suggest) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(Suggest);
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
	public Suggest getSuggest(Long id) throws DBException {
		Session session;
		Suggest Suggest = null;
		try {
			session = HibernateSessionFactory.currentSession();
			Suggest = (Suggest) session.get(Suggest.class, id);
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
		return Suggest;
	}

	// 根据年级科目分页获取教案**********************************************************************
	public List getSearchListByPage(Review Review, int pagesize, int curpage)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			// Criteria criteria = new Criteria();
			Example exampleReview = Example.create(Review);
			exampleReview.ignoreCase().enableLike(MatchMode.ANYWHERE);
			Criteria criteria = session.createCriteria(Review.class).add(
					exampleReview).addOrder(Order.desc("id")).setFirstResult(
					(curpage - 1) * pagesize).setMaxResults(pagesize);
			list = criteria.list();
			/*
			 * list = session .createQuery("from com.bookstore.po.Review Review
			 * where Review.grade=:grade "+"and Review.subject=:subject")
			 * .setString("grade",Review.getGrade()) .setString("subject",
			 * Review.getSubject()) .setFirstResult((curpage-1)*pagesize)
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

	/*
	 * public List getGSearchListByPage( String grade,int pagesize,int curpage)
	 * throws DBException { List list = null; int Firstroll =
	 * (pagesize-1)*curpage; Session session; try { session =
	 * HibernateSessionFactory.currentSession(); list = session
	 * .createQuery("from com.bookstore.po.Review Review where
	 * Review.grade=:grade order by id desc ") .setString("grade",grade)
	 * .setFirstResult((curpage-1)*pagesize) .setMaxResults(pagesize) .list();
	 * 
	 * System.out.println(">>>>>>>>>>>>>>>>>"+list.size()); } catch
	 * (HibernateException e) { e.printStackTrace(); throw new
	 * DBException("获取对象失败！"); } finally { try {
	 * HibernateSessionFactory.closeSession(); } catch (HibernateException e) {
	 * e.printStackTrace(); throw new DBException("关闭session失败！"); } } return
	 * list; }
	 * 
	 * //分页获取教案**********************************************************************
	 * public List getReviewListByPage( int pagesize , int curpage) throws
	 * DBException { List list = null; int Firstroll = (pagesize-1)*curpage;
	 * Session session; try { session =
	 * HibernateSessionFactory.currentSession(); list = session
	 * .createQuery("from com.bookstore.po.Review Review order by id desc ")
	 * .setFirstResult((curpage-1)*pagesize) .setMaxResults(pagesize) .list();
	 * System.out.println(">>>>>>>>>>>>>>>>>"+list.size()); } catch
	 * (HibernateException e) { e.printStackTrace(); throw new
	 * DBException("获取对象失败！"); } finally { try {
	 * HibernateSessionFactory.closeSession(); } catch (HibernateException e) {
	 * e.printStackTrace(); throw new DBException("关闭session失败！"); } } return
	 * list; }
	 * 
	 * //获取教案总数 public int getReviewCount( ) throws DBException { int counts;
	 * Session session; try { session =
	 * HibernateSessionFactory.currentSession(); Integer count = (Integer)
	 * session .createQuery("select count(*) from com.bookstore.po.Review Review ")
	 * .uniqueResult(); counts = count.intValue(); } catch (HibernateException
	 * e) { e.printStackTrace(); throw new DBException("获取对象失败！"); } finally {
	 * try { HibernateSessionFactory.closeSession(); } catch (HibernateException
	 * e) { e.printStackTrace(); throw new DBException("关闭session失败！"); } }
	 * return counts; }
	 * 
	 * //根据搜索条件获取教案总数 public int getReviewCountSearch( Review Review ) throws
	 * DBException {
	 * 
	 * int totalCount; Session session; Criteria criteria; try { session =
	 * HibernateSessionFactory.currentSession(); Example exampleReview =
	 * Example.create(Review);
	 * exampleReview.ignoreCase().enableLike(MatchMode.ANYWHERE); criteria =
	 * session.createCriteria(Review.class) .add(exampleReview); totalCount =
	 * criteria.list().size(); } catch (HibernateException e) {
	 * e.printStackTrace(); throw new DBException("获取对象失败！"); } finally { try {
	 * HibernateSessionFactory.closeSession(); } catch (HibernateException e) {
	 * e.printStackTrace(); throw new DBException("关闭session失败！"); } } return
	 * totalCount; }
	 * 
	 * public int getGCount( String grade ) throws DBException {
	 * 
	 * int totalCount; List list = null; Session session; try { session =
	 * HibernateSessionFactory.currentSession(); list = session
	 * .createQuery("from com.bookstore.po.Review Review where
	 * Review.grade=:grade order by id desc ") .setString("grade",grade)
	 * .list(); totalCount = list.size(); } catch (HibernateException e) {
	 * e.printStackTrace(); throw new DBException("获取对象失败！"); } finally { try {
	 * HibernateSessionFactory.closeSession(); } catch (HibernateException e) {
	 * e.printStackTrace(); throw new DBException("关闭session失败！"); } } return
	 * totalCount; }
	 */

}
