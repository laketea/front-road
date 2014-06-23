package com.bookstore.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import java.util.Date;


import com.bookstore.exception.DBException;
import com.bookstore.form.AdminForm;
import com.bookstore.po.Admin;
import com.bookstore.service.AdminService;

public class AdminAction extends DispatchAction {

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AdminForm adminForm = (AdminForm) form;
		Admin admin = new Admin();
		
		if (adminForm.getId() != null && !adminForm.getId().equals("")) {
			admin.setId(Long.valueOf(adminForm.getId()));
		}
		admin.setName(adminForm.getName());
		admin.setPassword(adminForm.getPassword());
		admin.setCreatedate(new Date(new java.util.Date().getTime()));
		AdminService service = new AdminService();
		try {
			if (admin.getId() == null) {
				Admin admin1 = service.getAdminByName(adminForm.getName());
				if (admin1 == null) {
					service.addAdmin(admin);
					return mapping.findForward("success");
				} else {
					request.setAttribute("info","名字为为"+adminForm.getName()+"的文章已经存在");
					return mapping.findForward("error");
				}
			} else {
				// 更新用户S
				//service.addAdmin(admin);
				request.getSession().setAttribute("admin",admin);
				return mapping.findForward("error");
				//return mapping.findForward("success");
			}
		
			
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","保存失败");
			return mapping.findForward("error");
		}
	}

	
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AdminForm adminForm = (AdminForm) form;
		String adminname = adminForm.getName();
		AdminService service = new AdminService();
		Admin admin = null;
		try {
			admin = service.getAdminByName(adminname);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		if (admin == null || !admin.getPassword().equals(adminForm.getPassword())) {
			return mapping.findForward("error");
		}
		request.getSession().setAttribute("admin", admin);
		request.getSession().setAttribute("adminstatus", "a");
		return mapping.findForward("loginsuccess");
	}
	

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AdminService service = new AdminService();
		List list = null;
		try {
			list = service.getAdminList();
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
		AdminService service = new AdminService();
		int pagesize = Integer.parseInt(request.getParameter("pagesize").toString());
		int curpage = Integer.parseInt(request.getParameter("curpage").toString());
		List list = null;
		try {
			list = service.getAdminListByPage(pagesize,curpage);
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
			AdminService service = new AdminService();
			service.deleteAdmin(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("success");
	}

	
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		AdminForm adminForm = (AdminForm) form;
		Admin admins=null;
     	admins=(Admin)request.getSession().getAttribute("admin");
     	//if(!admins.getPassword().equals(adminForm.getOldpassword())){
     	//	return mapping.findForward("error");
     	//}
     	if(!adminForm.getPassword().equals(adminForm.getAgainpassword())){
     		return mapping.findForward("error");
     	}
		Admin admin = new Admin();
		admin.setId(admins.getId());
		admin.setName(admins.getName());
		admin.setPassword(adminForm.getPassword());
		admin.setCreatedate(new Date(new java.util.Date().getTime()));
		AdminService service = new AdminService();
		try {
			service.UpdateAdmin(admin);
			request.getSession().setAttribute("admin", admin);
			return mapping.findForward("success");
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","保存失败");
			return mapping.findForward("error");
		}
	}
	
}
