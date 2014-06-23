package com.bookstore.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.bookstore.exception.DBException;
import com.bookstore.form.PlanForm;
import com.bookstore.po.OrderItem;
import com.bookstore.po.Review;
import com.bookstore.po.Suggest;
import com.bookstore.po.User;
import com.bookstore.service.OrderService;
import com.bookstore.service.ReviewService;

public class ReviewAction extends DispatchAction {

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Review review = new Review();
		String godsid = request.getParameter("godsid");
		String godsname = request.getParameter("godsname");
		String orderitemid = request.getParameter("orderitemid");
		String orderdate = request.getParameter("orderdate");
		String title = request.getParameter("title");
		String advantage = request.getParameter("advantage");
		String defect = request.getParameter("defect");
		String view = request.getParameter("view");
		//plan.setFileaddress(planForm.getFileaddress());
		//plan.setFileaddress("aa");
		review.setAdvantage(advantage);
		review.setDefect(defect);
		review.setGodsid(Long.valueOf(godsid));
		review.setGodsname(godsname);
		review.setOrderdate(orderdate);
		review.setOrderitemid(Long.valueOf(orderitemid));
		review.setTitle(title);
		review.setView(view);
		review.setRedate(new Date(new java.util.Date().getTime()));
		User user = (User)request.getSession().getAttribute("user");
		review.setUserid((user.getId()));
		review.setUsername(user.getUsername());
		ReviewService service = new ReviewService();
		OrderService oservice = new OrderService();
		
		try{
				service.addReview(review);//添加教案
				OrderItem oitem = oservice.getOrderItem(Long.valueOf(orderitemid));
				oitem.setStatus(new Long("1"));
				oservice.UpdateOrderItem(oitem);
				return mapping.findForward("success");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}
	
	public ActionForward addsuggest(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Suggest suggest = new Suggest();
		//String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String content = request.getParameter("content");
		String contact = request.getParameter("contact");		
		suggest.setContact(contact);
		suggest.setContent(content);
		suggest.setUsername(username);
		suggest.setSdate(new Date(new java.util.Date().getTime()));
		String userid = (String)request.getSession().getAttribute("userid");
		if(userid==null){
			suggest.setUserid("0");
		}else {
			suggest.setUserid(userid);
		}
		//User user = (User)request.getSession().getAttribute("user");
		//review.setUserid((user.getId()).toString());
		//review.setUsername(user.getUsername());
		ReviewService service = new ReviewService();
		try{
				service.addSuggest(suggest);//添加教案
				return mapping.findForward("nosuccess");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}
	
	public ActionForward addusersuggest(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Suggest suggest = new Suggest();
		//String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String content = request.getParameter("content");
		String contact = request.getParameter("contact");		
		suggest.setContact(contact);
		suggest.setContent(content);
		suggest.setUsername(username);
		suggest.setSdate(new Date(new java.util.Date().getTime()));
		String userid = (String)request.getSession().getAttribute("userid");
		if(userid==null){
			suggest.setUserid("0");
		}else {
			suggest.setUserid(userid);
		}
		//User user = (User)request.getSession().getAttribute("user");
		//review.setUserid((user.getId()).toString());
		//review.setUsername(user.getUsername());
		ReviewService service = new ReviewService();
		try{
				service.addSuggest(suggest);//添加教案
				return mapping.findForward("usersucess");
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}

/*
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		PlanForm planForm = (PlanForm) form;
		String planname = planForm.getPlanname();
		PlanService service = new PlanService();
		Plan plan = null;
		try {
			plan = service.getPlanByPlanname(planname);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("loginerror");
		}
		if (plan == null || !plan.getPasswd().equals(planForm.getPasswd())) {
			return mapping.findForward("loginerror");
		}
		request.getSession().setAttribute("plan", plan);
		return mapping.findForward("loginsuccess");
	}
	*/
	
	
	
	
	public ActionForward admindelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			ReviewService service = new ReviewService();
			service.deleteReview(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("admindelsuccess");
	}
	
	public ActionForward userdelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			ReviewService service = new ReviewService();
			service.deleteReview(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("userdelsuccess");
	}
	
	public ActionForward deletesuggesta(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			ReviewService service = new ReviewService();
			service.deleteSuggest(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("admindelssuccessa");
	}
	
	public ActionForward deletesuggestb(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			ReviewService service = new ReviewService();
			service.deleteSuggest(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("admindelssuccessb");
	}
	
	public ActionForward userdelsuggest(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			ReviewService service = new ReviewService();
			service.deleteSuggest(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("userdelssuccess");
	}

	public ActionForward preModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		/*
		PlanForm planForm = new PlanForm();
		
		Plan plan = (Plan) request.getSession().getAttribute("plan");
		if (plan != null) {
			planForm.setContent(plan.getContent());
			planForm.setId(String.valueOf(plan.getId()));
		}
		request.setAttribute("planForm", planForm);
		*/
		return mapping.findForward("error");
	}
	
	public ActionForward reply(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		String reply = request.getParameter("reply");
		Long id = Long.valueOf(ids);
		ReviewService service = new ReviewService();
		try {
			Suggest suggest = service.getSuggest(id);
			suggest.setReply(reply);
			suggest.setRedate(new Date(new java.util.Date().getTime()));
			service.UpdateSuggest(suggest);
			//request.setAttribute("plan", plan);
			
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("reply");
	
	}
	
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		String ff = request.getSession().getAttribute("ff").toString();
		Long id = Long.valueOf(ids);
		PlanForm PlanForm = (PlanForm) form;
		Review plan = new Review();
		plan.setTitle(PlanForm.getTitle());
		plan.setContent(PlanForm.getContent());
		plan.setSource(PlanForm.getSource());
		plan.setAuthor(PlanForm.getAuthor());
		plan.setSubject(PlanForm.getSubject());
		plan.setGrade(PlanForm.getGrade());
		plan.setDownup(PlanForm.getDownup());
		plan.setVersion(PlanForm.getVersion());
		plan.setFileaddress(ff);
		plan.setCreatedate(new Date(new java.util.Date().getTime()));
		System.out.println(plan.getTitle());
		System.out.println(plan.getContent());
		System.out.println(plan.getSource());
		System.out.println(plan.getAuthor());
		System.out.println(plan.getSubject());
		System.out.println(plan.getGrade());
		System.out.println(plan.getFileaddress());
		plan.setId(Long.valueOf(ids));
		try {
			ReviewService service = new ReviewService();
				service.UpdatePlan(plan);
				return mapping.findForward("success");
			
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}
}
