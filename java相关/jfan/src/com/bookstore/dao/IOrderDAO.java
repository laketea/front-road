package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.User;
import com.bookstore.po.Orders;
import com.bookstore.po.OrderItem;

public interface IOrderDAO {

	public long addOrder(Orders orders) throws DBException;

	public void addOrderItem(OrderItem orderitem) throws DBException;

	public int getFavCount(String Orderid) throws DBException;

	public int getPayCount(String userid) throws DBException;

	public int getPayCounts(String userid) throws DBException;

	public int getCount() throws DBException;

	public int getCountT() throws DBException;

	public int getCountTh() throws DBException;

	public Orders getOrderByName(String name) throws DBException;

	// public Fav checkFav(String Orderid,String bookid) throws DBException;

	public void updateOrder(Orders orders) throws DBException;
	
	public void updateOrderItem(OrderItem orderitem) throws DBException;

	public void deleteOrder(Long id) throws DBException;

	// public void deleteFav(Long id) throws DBException;

	public Orders getOrder(Long id) throws DBException;

	public OrderItem getOrderItem(Long id) throws DBException;

	public List getOrderList() throws DBException;

	public List getOrderItemList(String orderid) throws DBException;

	public List getOrderListByPage(int pagesize, int curpage, String orderid)
			throws DBException;

	public List getPayOrderListByPage(int pagesize, int curpage, String userid)
			throws DBException;

	public List getPayOrderListByPages(int pagesize, int curpage, String userid)
			throws DBException;

	public List getOrderListPage(int pagesize, int curpage) throws DBException;

	public List getOrderListPageT(int pagesize, int curpage) throws DBException;

	public List getOrderListPageTh(int pagesize, int curpage)
			throws DBException;

	public List getFavListByPage(int pagesize, int curpage, String Orderid)
			throws DBException;

}