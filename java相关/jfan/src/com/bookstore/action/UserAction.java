package com.bookstore.action;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import java.util.Date;


import com.bookstore.exception.DBException;
import com.bookstore.form.AdminForm;
import com.bookstore.form.UserForm;
import com.bookstore.po.Admin;
import com.bookstore.po.User;
import com.bookstore.po.Subject;
import com.bookstore.po.Gods;
import com.bookstore.po.Address;
import com.bookstore.util.UtilFun;
import com.bookstore.util.Generator;
import com.bookstore.util.ImageUtiles;
import com.bookstore.util.MailUtil;
import com.bookstore.service.AdminService;
import com.bookstore.service.UserService;
import com.bookstore.service.GodsService;

public class UserAction extends DispatchAction {

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String codes = request.getParameter("code");
		UserForm userForm = (UserForm) form;
		User user = new User();
		user.setUsername(userForm.getUsername());
		user.setPassword(userForm.getPassword());
		user.setEmail(userForm.getEmail());
		user.setStatus(new Long("0"));
		String emailcode = Generator.getEmailCode();
		user.setCode(emailcode);
		user.setPoint(new Long("0"));
		UserService service = new UserService();
		//String body = "<a href=\"http://jfanfan.com/userAction.do?method=active&amp;id="+user.getUsername()+"&amp;code="+emailcode+"\">"+user.getUsername()+"您好！欢迎您注册今凡网，请点击以下链接激活账户</a>";
		String codess = (String)request.getSession().getAttribute("rand_jsp");
		
		if((codes.toUpperCase()).equals(codess)){
			
		}else{
			request.getSession().setAttribute("reg_name", userForm.getUsername());
			request.getSession().setAttribute("reg_email", userForm.getEmail());
			request.getSession().setAttribute("reg_pwd", userForm.getPassword());
			return mapping.findForward("regerrorcode");
		}
		try {
				User User1 = service.getUserByName(userForm.getUsername());
				User User2 = service.getUserByEmail(userForm.getEmail());
				//User User2 = null;
				if (User1 == null&&User2==null) {
					//MailUtil.sendEmail(user.getEmail(),"恭喜您在今网注册请点击以下链接完成激活！",body);
					service.addUser(user);
					User us = service.getUserByEname(user.getUsername());
					request.getSession().setAttribute("user",us);
					request.getSession().setAttribute("userid",us.getId().toString());
					return mapping.findForward("regsuccess");
				} else {
					request.setAttribute("info","该用户名或Email已经存在");
					return mapping.findForward("regerroron");
				}
		
			
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","保存失败");
			return mapping.findForward("regerror");
		}
	}
	
	
	public ActionForward addAddress(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Address add = new Address();
		System.out.println("sssssssZZZZZ");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String street = request.getParameter("street");
		String area = request.getParameter("area");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String mobile = request.getParameter("mobile");
		String zipcode = request.getParameter("zipcode");
		Long userid = Long.valueOf(request.getParameter("userid").toString());
		add.setProvince(province);
		add.setCity(city);
		add.setArea(area);
		add.setStreet(street);
		add.setName(name);
		add.setPhone(phone);
		add.setMobile(mobile);
		add.setZipcode(zipcode);
		add.setUserid(userid);
		add.setStatus(new Long("0"));
		UserService service = new UserService();
		//String codess = (String)request.getSession().getAttribute("rand");
		try {
			/*if (codes.equals(codess)){}
			else{
				return mapping.findForward("yzmerror");
			}
			*/
			
					service.addAddress(add);
					return mapping.findForward("addsuccess");
				
			
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","保存失败");
			return mapping.findForward("error");
		}
	}

	public ActionForward addall(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Address add = new Address();
		System.out.println("sssssss");
		
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String street = request.getParameter("street");
		String area = request.getParameter("area");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String mobile = request.getParameter("mobile");
		String zipcode = request.getParameter("zipcode");
		String userids = (String)request.getSession().getAttribute("userid");
		Long userid = Long.valueOf(userids);
		add.setProvince(province);
		add.setCity(city);
		add.setArea(area);
		add.setStreet(street);
		add.setName(name);
		add.setPhone(phone);
		add.setMobile(mobile);
		add.setZipcode(zipcode);
		add.setUserid(userid);
		add.setStatus(new Long("1"));
		UserService service = new UserService();
		//String codess = (String)request.getSession().getAttribute("rand");
		try {
					service.addAddress(add);
					return mapping.findForward("ordersuccess");
				
			
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","保存失败");
			return mapping.findForward("error");
		}
	}
	
	public ActionForward active(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
     	String id = request.getParameter("id");
     	String code = request.getParameter("code").toString();
     	//User users = null ;
     	//String id = Long.valueOf(ids);
		User user = new User();
		UserService service = new UserService();
		try {
			user = service.getUserByName(id);
			if(user.getCode().equals(code)){
				user.setStatus(new Long("1"));
				service.UpdateUser(user);
				request.getSession().setAttribute("user", user);
				return mapping.findForward("activesucess");
				}
			else
				{return mapping.findForward("error");
				}
			
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","保存失败");
			return mapping.findForward("error");
		}
	}
	
	
	public void velifyImg(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {	
	response.setContentType("image/gif");
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	try {
	String checkedImage = ImageUtiles.getPicture(59, 19, response.getOutputStream());
		request.getSession().setAttribute("ci",checkedImage);
	} catch (IOException e) {
			e.printStackTrace();
	}
	
	}
	public ActionForward addfirstsubject(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String firstname=request.getParameter("username");
		String point=request.getParameter("point");
		Subject subject = new Subject();
		subject.setFirstname(firstname);
		subject.setPoint(Long.valueOf(point));
		subject.setSecondname("0");
		subject.setSecond(new Long("0"));//1为二级分类
		subject.setFirst(new Long("0"));//0为一级分类 其他则为二级分类
		subject.setStatus(new Long("0"));
		UserService service = new UserService();
			try {
					Subject subjects = service.getSubjectByName(firstname);
					if (subjects == null) {
						service.addSubject(subject);
						return mapping.findForward("subsucessa");
					} else {
						request.setAttribute("info","商品分类已经存在");
						return mapping.findForward("error");
					}
			
				
			} catch (DBException e) {
				e.printStackTrace();
				request.setAttribute("info","保存失败");
				return mapping.findForward("error");
			}
		}
	
	
	public ActionForward modsubject(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String firstname=request.getParameter("username");
		String point=request.getParameter("points");
		String id=request.getParameter("id");
		UserService service = new UserService();
			try {
					Subject subjects = service.getSubject(Long.valueOf(id));
					if (subjects != null) {
						subjects.setFirstname(firstname);
						subjects.setPoint(Long.valueOf(point));
						service.UpdateSubject(subjects);
						return mapping.findForward("subsucessa");
					} else {
						request.setAttribute("info","商品分类已经存在");
						return mapping.findForward("error");
					}
			
				
			} catch (DBException e) {
				e.printStackTrace();
				request.setAttribute("info","保存失败");
				return mapping.findForward("error");
			}
		}
	
	public ActionForward addsecondsubject(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String firsts=request.getParameter("username");
		String secondname=request.getParameter("email");
		Long first = Long.valueOf(firsts);
		Subject subject = new Subject();
		//subject.setFirstname("firstname");
		subject.setSecondname(secondname);
		System.out.println(">>>>>>>>>>>>>>>>>" + secondname);
		subject.setSecond(new Long("1"));//1为二级分类
		subject.setFirst(first);//0为一级分类 其他则为二级分类
		subject.setStatus(new Long("0"));
		UserService service = new UserService();
			try {
					Subject sus = service.getSubject(first);
					subject.setFirstname(sus.getFirstname());
					Subject subjects = service.getSubjectByName(subject);
					if (subjects == null) {
						service.addSubject(subject);
						return mapping.findForward("subsucessb");
					} else {
						request.setAttribute("info","商品分类已经存在");
						return mapping.findForward("error");
					}
			
				
			} catch (DBException e) {
				e.printStackTrace();
				request.setAttribute("info","保存失败");
				return mapping.findForward("error");
			}
		}

	
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserForm userForm = (UserForm) form;
		String username = userForm.getName2();
		String password2 = userForm.getPassword2();
		//String eamil = userForm.getP();
		UserService service = new UserService();
		User user = null;
		String userid="1";
		long count=0;
		if(username==null||password2==null||"".equals(username)||"".equals(password2)){
			return mapping.findForward("loginerror");
		}
		//String code = (String)request.getSession().getAttribute("rand");
		try {
			user = service.getUserByEname(username.trim());
			//user2 = service.getUserByEmail(username);
			//if (user.getStatus()==0){return mapping.findForward("nojihuo");}//如果为激活提示先激活
			if(user==null){
				return mapping.findForward("loginerrorcz");
			}
			if (!user.getPassword().equals(userForm.getPassword2().trim())) {
				request.getSession().setAttribute("login_name",username);
				return mapping.findForward("loginerror");
			}
			user.setLastlogin(new Date(new java.util.Date().getTime()));
			System.out.println(user);
			service.UpdateUser(user);
			//return mapping.findForward("loginerror");
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("loginerror");
		}

		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("userid", user.getId().toString());
		return mapping.findForward("loginsuccess");
	}
	
	public ActionForward orderlogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserForm userForm = (UserForm) form;
		String username = userForm.getName2();
		//String eamil = userForm.getP();
		UserService service = new UserService();
		User user = null;
		String userid="1";
		long count=0;
		String password2 = userForm.getPassword2();
		if(username==null||password2==null||"".equals(username)||"".equals(password2)){
			return mapping.findForward("loginerror");
		}
		//String code = (String)request.getSession().getAttribute("rand");
		try {
			user = service.getUserByEname(username.trim());
	
			if(user==null){
				return mapping.findForward("loginerror");
			}
			if (!user.getPassword().equals(userForm.getPassword2().trim())) {
				return mapping.findForward("loginerror");
			}
			user.setLastlogin(new Date(new java.util.Date().getTime()));
			System.out.println(user);
			service.UpdateUser(user);
			//return mapping.findForward("loginerror");
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("loginerror");
		}

		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("userid", user.getId().toString());
		return mapping.findForward("ordersuccess");
	}
	
	public ActionForward cartlogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserForm userForm = (UserForm) form;
		String username = userForm.getName2();
		//String eamil = userForm.getP();
		UserService service = new UserService();
		User user = null;
		String userid="1";
		long count=0;
		String password2 = userForm.getPassword2();
		if(username==null||password2==null||"".equals(username)||"".equals(password2)){
			return mapping.findForward("cartloginerror");
		}
		//String code = (String)request.getSession().getAttribute("rand");
		try {
			user = service.getUserByEname(username.trim());
	
			if(user==null){
				return mapping.findForward("cartloginerror");
			}
			if (!user.getPassword().equals(userForm.getPassword2().trim())) {
				return mapping.findForward("cartloginerror");
			}
			user.setLastlogin(new Date(new java.util.Date().getTime()));
			System.out.println(user);
			service.UpdateUser(user);
			//return mapping.findForward("loginerror");
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("cartloginerror");
		}

		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("userid", user.getId().toString());
		return mapping.findForward("cartsuccess");
	}
	
	
	/*public ActionForward delogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserForm userForm = (UserForm) form;
		String username = userForm.getName2();
		UserService service = new UserService();
		User user = null;
		String userid="1";
		long count=0;
		try {
			user = service.getUserByName(username);
			if (user == null || !user.getPassword().equals(userForm.getPassword2())) {
				return mapping.findForward("error");
			}
			count = user.getLogincount().longValue()+1;
			user.setLogincount(Long.valueOf(count));
			user.setLastlogin(new Date(new java.util.Date().getTime()));
			service.UpdateUser(user);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}

		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("userid", userid);
		return mapping.findForward("loginsuccess");
	}
	*/
	
	
	public ActionForward account(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UserForm userForm = (UserForm) form;
		String password = userForm.getPassword();
		//String password2 = userForm.getPassword2();
		//String email = userForm.getEmail();
		UserService service = new UserService();
		User user = null;
		user = (User)request.getSession().getAttribute("user");
		user.setPassword(password);
		//user.setEmail(email);
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
		request.getSession().setAttribute("userid", user.getId().toString());
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
	
	public ActionForward checklogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String userids=(String)request.getSession().getAttribute("userid");
		if (userids == null||userids.equals("")){
			return mapping.findForward("relogin");
		}
		return mapping.findForward("checkright");
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
		return mapping.findForward("adminsuccess");
	}
	
	public ActionForward deladd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			UserService service = new UserService();
			service.deleteAddress(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("addsuccess");
	}
	
	public ActionForward setaddfirst(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			UserService service = new UserService();
			Address add = service.getAddress(id);
			add.setStatus(new Long("1"));
			service.setAddressFirst(add);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("addsuccess");
	}
	
	public ActionForward delsubject(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			UserService service = new UserService();
			service.deleteSubject(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("subsucessa");
	}

	
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		UserForm UserForm = (UserForm) form;
		User Users=null;
     	Users=(User)request.getSession().getAttribute("user");
     	//if(!Users.getPassword().equals(UserForm.getOldpassword())){
     	//	return mapping.findForward("error");
     	//}
     	//if(!UserForm.getPassword().equals(UserForm.getAgainpassword())){
     		//return mapping.findForward("error");
     	//}
		User user = new User();
		//User.setId(Users.getId());
		//User.setName(Users.getName());
		user.setPassword(UserForm.getPassword());
		//User.setCreatedate(new Date(new java.util.Date().getTime()));
		UserService service = new UserService();
		try {
			service.UpdateUser(user);
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("userid", user.getId().toString());
			return mapping.findForward("success");
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","保存失败");
			return mapping.findForward("error");
		}
	}
	
}
