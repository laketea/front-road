package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;

import com.bookstore.exception.DBException;
import com.bookstore.po.Orders;
import com.bookstore.po.OrderItem;
import com.bookstore.util.HibernateSessionFactory;

public class OrderDAO implements IOrderDAO {

	public long addOrder(Orders orders) throws DBException {
		Session session;
		Transaction tx = null;
		long id;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(orders);
			id = orders.getId();
			tx.commit();
			return id;
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

	public void addOrderItem(OrderItem orderitem) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(orderitem);
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

	public Orders getOrderByName(String name) throws DBException {
		Session session;
		Orders Order = null;
		try {
			session = HibernateSessionFactory.currentSession();
			List list = session
					.createQuery(
							"from com.bookstore.po.Orders Orders where Orders.name=:name")
					.setString("name", name).list();
			if (list != null && list.size() > 0) {
				Order = (Orders) list.get(0);
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
		return Order;
	}

	/*
	 * public Fav checkFav(String bookid , String Orderid) throws DBException {
	 * Session session; Fav fav = null; try { session =
	 * HibernateSessionFactory.currentSession(); List list = session
	 * .createQuery( "from com.bookstore.po.Fav Fav where Fav.bookid=:bookid and
	 * Fav.Orderid=:Orderid") .setString("bookid", bookid) .setString("Orderid",
	 * Orderid) .list(); if (list != null && list.size() > 0) { fav = (Fav)
	 * list.get(0); } } catch (HibernateException e) { e.printStackTrace();
	 * throw new DBException("获取对象失败！"); } finally { try {
	 * HibernateSessionFactory.closeSession(); } catch (HibernateException e) {
	 * e.printStackTrace(); } } return fav; }
	 */

	public void deleteOrder(Long id) throws DBException {
		Session session;
		Orders orders = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			orders = (Orders) session.load(Orders.class, id);
			session.delete(orders);
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

	/*
	 * public void deleteFav(Long id) throws DBException { Session session; Fav
	 * fav = null; Transaction tx = null; try { session =
	 * HibernateSessionFactory.currentSession(); tx =
	 * session.beginTransaction(); fav = (Fav) session.load(Fav.class, id);
	 * session.delete(fav); tx.commit(); } catch (HibernateException e) {
	 * 
	 * try { tx.rollback();
	 *  } catch (HibernateException e1) { e1.printStackTrace();
	 *  } e.printStackTrace(); throw new DBException("更新对象失败！"); } finally { try {
	 * HibernateSessionFactory.closeSession(); } catch (HibernateException e) {
	 * e.printStackTrace(); } } }
	 */
	public void updateOrderItem(OrderItem OrderItem) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(OrderItem);
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
	
	public void updateOrder(Orders Orders) throws DBException {
		Session session;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.currentSession();
			tx = session.beginTransaction();
			session.update(Orders);
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

	public Orders getOrder(Long id) throws DBException {
		Session session;
		Orders Orders = null;
		try {
			session = HibernateSessionFactory.currentSession();
			Orders = (Orders) session.get(Orders.class, id);
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
		return Orders;
	}

	public OrderItem getOrderItem(Long id) throws DBException {
		Session session;
		OrderItem OrderItem = null;
		try {
			session = HibernateSessionFactory.currentSession();
			OrderItem = (OrderItem) session.get(OrderItem.class, id);
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
		return OrderItem;
	}

	public List getOrderList() throws DBException {
		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session.createQuery("from com.bookstore.po.Orders Orders  ")
					.list();
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

	public List getOrderItemList(String orderid) throws DBException {
		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.OrderItem orderitem where orderitem.orderid=:orderid")
					.setString("orderid", orderid).list();
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

	public List getOrderListByPage(int pagesize, int curpage, String userid)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders Orders where Orders.userid=:userid order by id desc ")
					.setString("userid", userid).setFirstResult(
							(curpage - 1) * pagesize).setMaxResults(pagesize)
					.list();
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

	public List getPayOrderListByPage(int pagesize, int curpage, String userid)
			throws DBException {
		List list = null;
		String flag = "1";
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders Orders where Orders.userid=:userid and Orders.payflag=:flag order by id desc ")
					.setString("userid", userid).setString("flag", flag)
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

	public List getPayOrderListByPages(int pagesize, int curpage, String userid)
			throws DBException {
		List list = null;
		String flag = "0";
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders Orders where Orders.userid=:userid and Orders.payflag=:flag order by id desc ")
					.setString("userid", userid).setString("flag", flag)
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

	public List getOrderListPage(int pagesize, int curpage) throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session.createQuery(
					"from com.bookstore.po.Orders  order by id desc ")
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

	public List getOrderListPageT(int pagesize, int curpage) throws DBException {
		List list = null;
		String payflag = "0";
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders orders where orders.payflag=:payflag ")
					.setString("payflag", payflag).setFirstResult(
							(curpage - 1) * pagesize).setMaxResults(pagesize)
					.list();
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

	public List getOrderListPageTh(int pagesize, int curpage)
			throws DBException {
		List list = null;
		String sendflag = "0";
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders orders where orders.sendflag=:sendflag and orders.payflag=:payflag order by id desc ")
					.setString("sendflag", "0").setString("payflag", "1")
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

	public List getFavListByPage(int pagesize, int curpage, String Orderid)
			throws DBException {
		List list = null;
		int Firstroll = (pagesize - 1) * curpage;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Fav fav where fav.Orderid=:Orderid order by id desc ")
					.setString("Orderid", Orderid).setFirstResult(
							(curpage - 1) * pagesize).setMaxResults(pagesize)
					.list();
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

	public int getFavCount(String userid) throws DBException {

		int totalCount;
		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders orders where orders.userid=:userid order by id desc ")
					.setString("userid", userid).list();
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
		return totalCount;

	}

	public int getPayCount(String userid) throws DBException {

		int totalCount;
		List list = null;
		String flag = "1";
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders orders where orders.userid=:userid and orders.payflag=:flag order by id desc ")
					.setString("userid", userid).setString("flag", flag).list();
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
		return totalCount;

	}

	public int getPayCounts(String userid) throws DBException {

		int totalCount;
		List list = null;
		String flag = "0";
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders orders where orders.userid=:userid and orders.payflag=:flag order by id desc ")
					.setString("userid", userid).setString("flag", flag).list();
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
		return totalCount;

	}

	public int getCount() throws DBException {

		int totalCount;
		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session.createQuery(
					"from com.bookstore.po.Orders orders order by id desc ")
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
		return totalCount;

	}

	public int getCountT() throws DBException {

		int totalCount;
		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders orders where orders.payflag=:payflag order by id desc ")
					.setString("payflag", "0").list();
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
		return totalCount;

	}

	public int getCountTh() throws DBException {

		int totalCount;
		List list = null;
		Session session;
		try {
			session = HibernateSessionFactory.currentSession();
			list = session
					.createQuery(
							"from com.bookstore.po.Orders orders where orders.sendflag=:sendflag and orders.payflag=:payflag order by id desc ")
					.setString("sendflag", "0").setString("payflag", "1")
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
		return totalCount;

	}

}
