package com.bookstore.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.bookstore.dao.DAOFactory;
import com.bookstore.dao.IOrderDAO;
import com.bookstore.exception.DBException;
import com.bookstore.po.User;
import com.bookstore.po.Orders;
import com.bookstore.po.OrderItem;

public class OrderService {
	//static Logger log = Logger.getLogger(AdminService.class.getName());
	public long addOrder(Orders orders , List item) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		//log.info("保存用户对象->用户名："+Order.getOrdername());
		long id = dao.addOrder(orders);
		//List orderItem = order.getOrderItem();//得到所有订单项
		for(int i=0;i<item.size();i++) {
			OrderItem orderItems = (OrderItem)item.get(i);
			orderItems.setOrderid(id+"");
			dao.addOrderItem(orderItems);
		}
		return id;
	}
	
	
	public Orders getOrderByName(String name) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		return dao.getOrderByName(name);
	}
	
	
	
	public Orders getOrder(Long id) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		return dao.getOrder(id);
	}
	
	public OrderItem getOrderItem(Long id) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		return dao.getOrderItem(id);
	}
	
	public int getFavCount(String Orderid) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		return dao.getFavCount(Orderid);
	}
	
	public int getPayCount(String userid) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		return dao.getPayCount(userid);
	}
	
	public int getPayCounts(String userid) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		return dao.getPayCounts(userid);
	}
	
	public int getCount() throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		return dao.getCount();
	}
	
	public int getCountT() throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		return dao.getCountT();
	}
	
	public int getCountTh() throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		return dao.getCountTh();
	}

	public void UpdateOrderItem(OrderItem orderitem) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		dao.updateOrderItem(orderitem);
	}
	
	public void UpdateOrder(Orders orders) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		dao.updateOrder(orders);
	}
	
	public void deleteOrder(Long id) throws DBException {
		IOrderDAO dao = DAOFactory.getOrderDAO();
		dao.deleteOrder(id);
	}
	

	
	//根据用户ID 查询用户所有订单
	public List getOrderListByPage(int pagesize,int curpage,String orderid)throws DBException{
		List list=null;
		IOrderDAO dao = DAOFactory.getOrderDAO();
		list=dao.getOrderListByPage(pagesize,curpage,orderid);
		return list;
	}
	
	//根据用户ID 查询用户已付款订单
	public List getPayOrderListByPage(int pagesize,int curpage,String orderid)throws DBException{
		List list=null;
		IOrderDAO dao = DAOFactory.getOrderDAO();
		list=dao.getPayOrderListByPage(pagesize,curpage,orderid);
		return list;
	}
	
	//根据用户ID 查询用户未付款订单
	public List getPayOrderListByPages(int pagesize,int curpage,String orderid)throws DBException{
		List list=null;
		IOrderDAO dao = DAOFactory.getOrderDAO();
		list=dao.getPayOrderListByPages(pagesize,curpage,orderid);
		return list;
	}
	
	public List getOrderListPage(int pagesize,int curpage )throws DBException{
		List list=null;
		IOrderDAO dao = DAOFactory.getOrderDAO();
		list=dao.getOrderListPage(pagesize,curpage);
		return list;
	}
	
	public List getOrderListPageT(int pagesize,int curpage )throws DBException{
		List list=null;
		IOrderDAO dao = DAOFactory.getOrderDAO();
		list=dao.getOrderListPageT(pagesize,curpage);
		return list;
	}
	
	public List getOrderListPageTh(int pagesize,int curpage )throws DBException{
		List list=null;
		IOrderDAO dao = DAOFactory.getOrderDAO();
		list=dao.getOrderListPageTh(pagesize,curpage);
		return list;
	}
	
	public List getOrderItemList(String orderid)throws DBException{
		List list=null;
		IOrderDAO dao = DAOFactory.getOrderDAO();
		list=dao.getOrderItemList(orderid);
		return list;
	}
	
	public List getFavListByPage(int pagesize,int curpage, String Orderid)throws DBException{
		List list=null;
		IOrderDAO dao = DAOFactory.getOrderDAO();
		list=dao.getFavListByPage(pagesize,curpage,Orderid);
		return list;
	}
	
	
	public List getOrderList() throws DBException{
		List list=null;
		IOrderDAO dao = DAOFactory.getOrderDAO();
		list=dao.getOrderList();
		return list;
	}
}	
