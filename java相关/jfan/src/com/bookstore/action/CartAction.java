package com.bookstore.action;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
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
import com.bookstore.form.UserForm;
import com.bookstore.po.User;
import com.bookstore.po.Gods;
import com.bookstore.util.Cart;
import com.bookstore.util.CartItem;
import com.bookstore.service.UserService;
import com.bookstore.service.GodsService;


public class CartAction extends DispatchAction {

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int bookId = 0;
		String godsid = request.getParameter("bookid");
		String count = "1";
		if(godsid != null) {
			bookId = Integer.parseInt(godsid);
		}
		//Model model = new Model();
		GodsService service = new GodsService();
		Gods gods = new Gods();
		
		try {
			gods = service.getGods(Long.valueOf(bookId));
			Cart cart = (Cart)request.getSession().getAttribute("cart");
			if(cart == null){
				cart = new Cart();
				request.getSession().setAttribute("cart", cart);
			}
			if(bookId!=0){
				cart.addItem(bookId, gods);
				//cart.updateGodsCount(Integer.valueOf(bookId), Integer.parseInt(count));
			}
			Collection ci = cart.getItems();	
			request.getSession().setAttribute("ci", ci);
			return mapping.findForward("success");
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}
		
		public ActionForward addcart(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			int bookId = 0;
			int counts= 0;
			String godsid = request.getParameter("godid");
			String count = request.getParameter("count");
			if(godsid != null) {
				bookId = Integer.parseInt(godsid);
			}
			if(count != null) {
				counts = Integer.parseInt(count);
				if(counts <=0){ counts =1;}
				if(Long.valueOf(counts)>10){
					return mapping.findForward("cartmax");
				}
			}
			//Model model = new Model();
			//GodsService service = new GodsService();
			//Gods gods = new Gods();
			
			try {
				GodsService service = new GodsService();
				Gods gods = service.getGods(Long.valueOf(bookId));
				if(gods.getHourcount()<Long.valueOf(counts)){
					return mapping.findForward("cartmax2");
				}
				Gods godss = service.getGods(Long.valueOf(bookId));
				Cart cart = (Cart)request.getSession().getAttribute("cart");
				if(cart == null){
					cart = new Cart();
					request.getSession().setAttribute("cart", cart);
				}
				if(bookId!=0){
					cart.addItem(bookId, gods);
					cart.updateGodsCount(bookId, counts);
					//cart.updateGodsCount(Integer.valueOf(bookId), Integer.parseInt(count));
				}
				Collection ci = cart.getItems();	
				request.getSession().setAttribute("ci", ci);
				return mapping.findForward("success");
			} catch (DBException e) {
				e.printStackTrace();
				return mapping.findForward("error");
			}
		
		//request.getRequestDispatcher("cart.jsp").forward(request, response);
		
		
	}
		
		public ActionForward addorder(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			
			String userid = (String)request.getSession().getAttribute("userid");
			
			int bookId = 0;
			int counts= 0;
			String godsid = request.getParameter("godid");
			String count = request.getParameter("count");
			if(godsid != null) {
				bookId = Integer.parseInt(godsid);
			}
			if(count != null) {
				counts = Integer.parseInt(count);
				if(counts <=0){ counts =1;}
				if(Long.valueOf(counts)>10){
					return mapping.findForward("cartmax");
				}
			}
			//Model model = new Model();
			//GodsService service = new GodsService();
			//Gods gods = new Gods();
			
			try {
				GodsService service = new GodsService();
				Gods gods = service.getGods(Long.valueOf(godsid));
				if(gods.getHourcount()<Long.valueOf(count)){
					return mapping.findForward("cartmax2");
				}
				Gods godss = service.getGods(Long.valueOf(bookId));
				Cart cart = (Cart)request.getSession().getAttribute("cart");
				if(cart == null){
					cart = new Cart();
					request.getSession().setAttribute("cart", cart);
				}
				if(bookId!=0){
					cart.addItem(bookId, gods);
					cart.updateGodsCount(bookId, counts);
				}
				Collection ci = cart.getItems();	
				request.getSession().setAttribute("ci", ci);
				if(userid==null){
					request.getSession().setAttribute("url_dz", "submitorder");
					return mapping.findForward("login");
				}
				return mapping.findForward("detailsuccess");
			} catch (DBException e) {
				e.printStackTrace();
				return mapping.findForward("error");
			}
		
		//request.getRequestDispatcher("cart.jsp").forward(request, response);
		
		
	}
	
	
	/*public ActionForward addsecond(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int GodsId = 0;
		String str_GodsId = request.getParameter("id");
		String count = "1";
		if(str_GodsId != null) {
			GodsId = Integer.parseInt(str_GodsId);
		}
		//Model model = new Model();
		GodsService service = new GodsService();
		Gods Gods = new Gods();
		try {
			Gods = service.getGods(Long.valueOf(GodsId));
			Cart cart = (Cart)request.getSession().getAttribute("cart");
			if(cart == null){
				cart = new Cart();
				request.getSession().setAttribute("cart", cart);
			}
			if(GodsId!=0){
				cart.addItem(GodsId, Gods);
				cart.updateGodsCount(GodsId, Integer.valueOf(count));
			}
			Collection ci = cart.getItems();	
			request.getSession().setAttribute("ci", ci);
			return mapping.findForward("success");
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		
		//request.getRequestDispatcher("cart.jsp").forward(request, response);
		
		
	}
	*/
	
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int GodsId = 0;
		int count = 0;
		String str_GodsId = request.getParameter("Godsid");
		String str_count = request.getParameter("count");
		if(str_GodsId != null&&str_count!=null){
			GodsId = Integer.parseInt(str_GodsId);
			count = Integer.parseInt(str_count);
			if(count <=0){ count =1;}
			if(Long.valueOf(str_count)>10){
				return mapping.findForward("cartmax");
			}
			try {
				GodsService service = new GodsService();
				Gods gods = service.getGods(Long.valueOf(GodsId));
				if(gods.getHourcount()<Long.valueOf(str_count)){
					return mapping.findForward("cartmax2");
				}
			} catch (DBException e) {
				e.printStackTrace();
				return mapping.findForward("error");
			}	
		}
		
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		cart.updateGodsCount(GodsId, count);
			return mapping.findForward("success");

	}

	public ActionForward del(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int GodsId = 0;
		String str_GodsId = request.getParameter("Godsid");
		if(str_GodsId != null){
			GodsId = Integer.parseInt(str_GodsId);
		}
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		cart.deleteItem(GodsId);
		return mapping.findForward("success");

	}
	
	public ActionForward clear(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		cart.clear();
		return mapping.findForward("success");

	}
	
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserForm userForm = (UserForm) form;
		String username = userForm.getUsername();
		UserService service = new UserService();
		User user = null;
		long count=0;
		try {
			user = service.getUserByName(username);
			if (user == null || !user.getPassword().equals(userForm.getPassword())) {
				return mapping.findForward("error");
			}
			//count = user.getLogincount().longValue()+1;
			//user.setLogincount(Long.valueOf(count));
			user.setLastlogin(new Date(new java.util.Date().getTime()));
			service.UpdateUser(user);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}

		request.getSession().setAttribute("user", user);
		return mapping.findForward("loginsuccess");
	}
	
	
	public ActionForward account(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserForm userForm = (UserForm) form;
		String password = userForm.getPassword();
		String email = userForm.getEmail();
		UserService service = new UserService();
		User user = null;
		user = (User)request.getSession().getAttribute("user");
		user.setPassword(password);
		user.setEmail(email);
		try {
			//user = service.getUserByName(username);
			//if (user == null || !user.getPassword().equals(userForm.getPassword())) {
				//return mapping.findForward("error");
			service.UpdateUser(user);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}

		request.getSession().setAttribute("user", user);
		return mapping.findForward("accountsuccess");
	}
	
	/*public ActionForward contact(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserForm userForm = (UserForm) form;
		UserService service = new UserService();
		User user = null;
		user = (User)request.getSession().getAttribute("user");
		user.setRealname(userForm.getRealname());
		user.setIdcard(userForm.getIdcard());
		user.setMale(userForm.getMale());
		user.setPhone(userForm.getPhone());
		user.setMobile(userForm.getMobile());
		user.setAddress(userForm.getAddress());
		user.setZipcode(userForm.getZipcode());
		user.setOicq(userForm.getOicq());
		try {
			//user = service.getUserByName(username);
			//if (user == null || !user.getPassword().equals(userForm.getPassword())) {
				//return mapping.findForward("error");
			service.UpdateUser(user);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}

		request.getSession().setAttribute("user", user);
		return mapping.findForward("contactsuccess");
	}
	
	*/
	

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserService service = new UserService();
		List list = null;
		try {
			list = service.getUserList();
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
		UserService service = new UserService();
		int pagesize = Integer.parseInt(request.getParameter("pagesize").toString());
		int curpage = Integer.parseInt(request.getParameter("curpage").toString());
		List list = null;
		try {
			list = service.getUserListByPage(pagesize,curpage);
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
			UserService service = new UserService();
			service.deleteUser(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("success");
	}

	
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		UserForm UserForm = (UserForm) form;
		User Users=null;
     	Users=(User)request.getSession().getAttribute("User");
     	//if(!Users.getPassword().equals(UserForm.getOldpassword())){
     	//	return mapping.findForward("error");
     	//}
     	//if(!UserForm.getPassword().equals(UserForm.getAgainpassword())){
     		//return mapping.findForward("error");
     	//}
		User User = new User();
		//User.setId(Users.getId());
		//User.setName(Users.getName());
		User.setPassword(UserForm.getPassword());
		//User.setCreatedate(new Date(new java.util.Date().getTime()));
		UserService service = new UserService();
		try {
			service.UpdateUser(User);
			request.getSession().setAttribute("User", User);
			return mapping.findForward("success");
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","±£¥Ê ß∞‹");
			return mapping.findForward("error");
		}
	}
	
}
