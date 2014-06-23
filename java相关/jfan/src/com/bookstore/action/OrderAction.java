package com.bookstore.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import java.util.Date;


import com.bookstore.exception.DBException;
import com.bookstore.form.OrderForm;
import com.bookstore.po.Orders;
import com.bookstore.po.OrderItem;
import com.bookstore.po.User;
import com.bookstore.po.Gods;
import com.bookstore.service.UserService;
import com.bookstore.service.OrderService;
import com.bookstore.service.GodsService;
import com.bookstore.util.Cart;
import com.bookstore.util.CartItem;

public class OrderAction extends DispatchAction {

	public ActionForward addall(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("AA");
		//OrderForm orderForm = (OrderForm) form;
		Orders orders = new Orders();
		//添加收货人信息
		//orders.setUserid(request.getParameter("userid"));
		//orders.setUsername(request.getParameter("username"));
		orders.setAddid(Long.valueOf(request.getParameter("addid")));
		orders.setSendway(request.getParameter("sendway"));
		orders.setPayway(request.getParameter("payway"));
		//orders.setSendflag(request.getParameter("sendflag"));
		//orders.setPayflag(request.getParameter("payflag"));
		orders.setPoint(Long.valueOf(request.getParameter("gold"))*100);
		orders.setMailprice(Double.valueOf(request.getParameter("yunfei")));
		orders.setTotalprice(Double.valueOf(request.getParameter("ttprice")));
		orders.setNewprice(Double.valueOf(request.getParameter("newprice")));
		orders.setUserpoint(Long.valueOf(request.getParameter("userpoint")));
		orders.setStatus("0");
		orders.setReceived("0");
		User user = null;
		//添加发货人用户信息
		user = (User)request.getSession().getAttribute("user");
		orders.setUserid(user.getId());
		orders.setUsername(user.getUsername());
		
		//设置发货状态 付款方式
		orders.setPayflag("0");
		orders.setSendflag("0");
		orders.setOrderdate(new Date(new java.util.Date().getTime()));
		GodsService gservice = new GodsService();
		Gods gg = null ;
		Collection ci = (Collection)request.getSession().getAttribute("ci");
		List<OrderItem> item = new ArrayList<OrderItem>();
		Iterator it = ci.iterator();
		//添加订单商品
		
		try {
		while(it.hasNext()){
			CartItem cartItem = (CartItem) it.next();
			OrderItem order_Item = new OrderItem();
			order_Item.setGodsid(cartItem.getGods().getId().toString());
			order_Item.setGodsname(cartItem.getGods().getName());
			order_Item.setGodsnum(String.valueOf(cartItem.getCount()));
			order_Item.setGodsprice(String.valueOf(cartItem.getItemPrice()));
			order_Item.setPrice(cartItem.getGods().getNewprice().toString());
			order_Item.setPoints(cartItem.getGods().getPoint());
			order_Item.setGodsminphoto(cartItem.getGods().getMinphoto().toString());
			order_Item.setStatus(new Long("0"));
			item.add(order_Item);
			gg= gservice.getGods(cartItem.getGods().getId());
			System.out.println(">>>>>>>>>>>>>>>>>" + cartItem.getGods().getId());
			System.out.println(">>>>>>>>>>>>>>>>>" +gg.getHourcount());
			System.out.println(">>>>>>>>>>>>>>>>>" +cartItem.getCount());
			long gghc = gg.getHourcount();
			long ggsc = gg.getSellcount();
			gg.setHourcount(gghc-cartItem.getCount());
			gg.setSellcount(ggsc+cartItem.getCount());
			gservice.UpdateGods(gg);
		}
		//orders.setOrderItem(item);
		long orderid; 
		OrderService service = new OrderService();
		
					orderid = service.addOrder(orders,item);
					request.getSession().setAttribute("orderid", orderid);
					Cart cart = (Cart)request.getSession().getAttribute("cart");
					cart.clear();
			
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","保存失败");
			return mapping.findForward("error");
		}
		return mapping.findForward("submitsuccess");
	}
	
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		OrderService service = new OrderService();
		List list = null;
		try {
			list = service.getOrderList();
			request.setAttribute("list", list);
			System.out.println(">>>>>>>>>>>>>>>>>" + list.size());
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("success");
	}
	
	public ActionForward listByPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		OrderService service = new OrderService();
		int pagesize = Integer.parseInt(request.getParameter("pagesize").toString());
		int curpage = Integer.parseInt(request.getParameter("curpage").toString());
		List list = null;
		try {
			list = service.getOrderListByPage(pagesize,curpage,"1");
			request.setAttribute("list", list);
			System.out.println(">>>>>>>>>>>>>>>>>" + list.size());
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("success");
	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			OrderService service = new OrderService();
			service.deleteOrder(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("userorder");
	}
	
	public ActionForward userdel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			OrderService service = new OrderService();
			service.deleteOrder(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("userdel");
	}
	
	public ActionForward confirmpay(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			OrderService service = new OrderService();
			Orders orders = service.getOrder(id);
			orders.setPayflag("1");
			service.UpdateOrder(orders);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("paysuccess");
	}
	
	public ActionForward confirmsend(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			String mailaddress = request.getParameter("mailassress");
			String mailcompany = request.getParameter("mailcompany");
			String mailid = request.getParameter("mailid");
			Long id = Long.valueOf(ids);
			OrderService service = new OrderService();
			Orders orders = service.getOrder(id);
			orders.setSendflag("1");
			orders.setMailaddress(mailaddress);
			orders.setMailcompany(mailcompany);
			orders.setMailid(mailid);
			service.UpdateOrder(orders);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("sendsuccess");
	}
	
	
	public ActionForward checklogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String url_dz= "sburl";
			String userid = (String)request.getSession().getAttribute("userid");
			if(userid!=null){
				request.getSession().setAttribute("url_dz", url_dz);;
				return mapping.findForward("submitorder");
			}
			else{
				
				request.getSession().setAttribute("url_dz", url_dz);
				return mapping.findForward("login");
			}
		
			
	}
	
	public ActionForward cklogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
			String userid = (String)request.getSession().getAttribute("userid");
			if(userid!=null){
				return mapping.findForward("submitorder");
			}
			else{
				
				return mapping.findForward("cklogin");
			}
		
			
	}
	
	
	
}
