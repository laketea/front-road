package com.bookstore.action;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.hibernate.HibernateException;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import java.sql.*;

import com.bookstore.exception.DBException;
import com.bookstore.po.Guest;
import com.bookstore.service.GuestService;
public class GuestAction extends DispatchAction {

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String title=request.getParameter("title"); //从表单获得 
		String content=request.getParameter("content");
		//String username=request.getParameter("username");
		
		Guest guest = new Guest();
		guest.setTitle(title);
		guest.setContent(content);
		guest.setConfirm("0");
		guest.setFeedflag("0");
		guest.setGuesttime(new Date(new java.util.Date().getTime()));
		GuestService service= new GuestService();
		try {
			service.addGuest(guest);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("success");

	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		GuestService service = new GuestService();
		try {
			service.deleteGuest(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("adminsuccess");

	}
	
	public ActionForward confirm(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		GuestService service = new GuestService();
		try {
			Guest guest = service.getGuest(Long.valueOf(id));
			guest.setConfirm("1");
			service.UpdateGuest(guest);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("adminsuccess");

	}
	
	public ActionForward feedback(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String feedback = request.getParameter("feedback");
		GuestService service = new GuestService();
		try {
			Guest guest = service.getGuest(Long.valueOf(id));
			guest.setFeedflag("1");
			guest.setFeedback(feedback);
			service.UpdateGuest(guest);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("adminsuccess");
	}
	
}
