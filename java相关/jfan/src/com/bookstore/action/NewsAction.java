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
import com.bookstore.form.NewsForm;
import com.bookstore.form.TestForm;
import com.bookstore.po.Suggest;
import com.bookstore.po.Test;
import com.bookstore.service.NewsService;
import com.bookstore.service.TestService;

public class NewsAction extends DispatchAction {

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		NewsForm newsForm = (NewsForm) form;
		Suggest news = new Suggest();
		String id = request.getParameter("id");
		String types = request.getParameter("types");
		if (types == null||types.equals("")) {
			types = "success";
		}
		if (types == "def"||types.equals("def")) {
			types = "default";
		}
		if (types == "rel"||types.equals("rel")) {
			types = "relax";
		}
		if (types == "tea"||types.equals("tea")) {
			types = "teacher";
		}
		if (types == "zs"||types.equals("zs")) {
			types = "zs";
		}
		if (id != null && !id.equals("")) {
			news.setId(Long.valueOf(id));
		}
		news.setSubject(newsForm.getSubject());
		news.setContent(newsForm.getContent());
		news.setColumnid(newsForm.getColumn());
		news.setCreatedate(new Date(new java.util.Date().getTime()));
		NewsService service = new NewsService();
		try {
			if (news.getId() == null) {
				Suggest news1 = service.getNewsBySubject(newsForm.getSubject());
				if (news1 == null) {
					service.addNews(news);
					
					return mapping.findForward(types);
				} else {
					request.setAttribute("info","标题为"+newsForm.getSubject()+"的文章已经存在");
					return mapping.findForward("error");
				}
			} else {
				// 更新用户S
				service.UpdateNews(news);
				System.out.println(">>>>>6");
				request.setAttribute("id",news.getId());
				return this.preModify(mapping,form,request,response);
				//return mapping.findForward("success");
			}
		
			
		} catch (DBException e) {
			e.printStackTrace();
			//request.setAttribute("info","保存失败");
			return mapping.findForward("error");
		}
	}

	/*
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		NewsForm newsForm = (NewsForm) form;
		String newsname = newsForm.getNewsname();
		NewsService service = new NewsService();
		News news = null;
		try {
			news = service.getNewsByNewsname(newsname);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("loginerror");
		}
		if (news == null || !news.getPasswd().equals(newsForm.getPasswd())) {
			return mapping.findForward("loginerror");
		}
		request.getSession().setAttribute("news", news);
		return mapping.findForward("loginsuccess");
	}
	*/

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		NewsService service = new NewsService();
		String column = request.getParameter("column");
		List list = null;
		try {
			list = service.getNewsList(column);
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
		NewsService service = new NewsService();
		String column = request.getParameter("column");
		int pagesize = Integer.parseInt(request.getParameter("pagesize").toString());
		int curpage = Integer.parseInt(request.getParameter("curpage").toString());
		List list = null;
		try {
			list = service.getNewsListByPage(column,pagesize,curpage);
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
		String types = request.getParameter("types");
		if (types == null||types.equals("")) {
			types = "success";
		}
		try {
			String ids = request.getParameter("newsid");
			
			Long id = Long.valueOf(ids);
			NewsService service = new NewsService();
			service.deleteNews(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward(types);
	}

	
	public ActionForward preModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
		String id = request.getParameter("id");
		NewsService newsservice = new NewsService();
		Suggest news = newsservice.getNews(Long.valueOf(id));
		request.setAttribute("news", news);
		
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		
		return mapping.findForward("modify");
	}
	
	public ActionForward modifydef(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		NewsForm newsForm = new NewsForm();
		NewsService service = new NewsService();
		try {
			Suggest news = service.getNews(id);
			request.setAttribute("news", news);
			
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		
		return mapping.findForward("modify_def");
	}
	
	public ActionForward modifyrel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		NewsForm newsForm = new NewsForm();
		NewsService service = new NewsService();
		try {
			Suggest news = service.getNews(id);
			request.setAttribute("news", news);
			
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		
		return mapping.findForward("modify_rel");
	}
	
	public ActionForward modifytea(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		NewsForm newsForm = new NewsForm();
		NewsService service = new NewsService();
		try {
			Suggest news = service.getNews(id);
			request.setAttribute("news", news);
			
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		
		return mapping.findForward("modify_tea");
	}
	
	public ActionForward modifyzs(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		NewsForm newsForm = new NewsForm();
		NewsService service = new NewsService();
		try {
			Suggest news = service.getNews(id);
			request.setAttribute("news", news);
			
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		
		return mapping.findForward("modify_zs");
	}
	
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		String types = request.getParameter("types");
		if (types == "def"||types.equals("def")) {
			types = "default";
		}
		if (types == "rel"||types.equals("rel")) {
			types = "relax";
		}
		if (types == "tea"||types.equals("tea")) {
			types = "teacher";
		}
		if (types == "zs"||types.equals("zs")) {
			types = "zs";
		}
		NewsForm newsForm = (NewsForm) form;
		Suggest news = new Suggest();
		news.setColumnid(newsForm.getColumn());
		news.setSubject(newsForm.getSubject());
		news.setContent(newsForm.getContent());
		news.setCreatedate(new Date(new java.util.Date().getTime()));
		news.setId(Long.valueOf(ids));
		try {
			NewsService service = new NewsService();
				service.UpdateNews(news);
				return mapping.findForward(types);
			
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}
	
	
}
