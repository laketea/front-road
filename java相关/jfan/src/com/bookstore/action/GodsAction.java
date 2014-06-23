package com.bookstore.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;

import java.util.Date;

import com.bookstore.exception.DBException;
import com.bookstore.form.GodsForm;
import com.bookstore.form.TestForm;
import com.bookstore.po.Gods;
import com.bookstore.po.Subject;
import com.bookstore.service.GodsService;
import com.bookstore.service.UserService;
import com.bookstore.service.TestService;
import com.bookstore.util.uploadimg;
import com.bookstore.util.ConfigReader;
import com.bookstore.util.Sysinfo;

public class GodsAction extends DispatchAction {

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Gods gods = new Gods();
		GodsForm bookForm = (GodsForm) form;
		String name = bookForm.getName();
		String types = request.getParameter("types");
		gods.setName(request.getParameter("name"));
		gods.setOldprice(Double.valueOf(request.getParameter("oldprice")
				.toString()));
		gods.setNewprice(Double.valueOf(request.getParameter("newprice")
				.toString()));
		gods.setDiscript(request.getParameter("discript"));
		gods.setContent(request.getParameter("content"));
		gods.setStartdate(java.sql.Date.valueOf(request
				.getParameter("begin_time")));
		gods
				.setEnddate(java.sql.Date.valueOf(request
						.getParameter("end_time")));
		gods.setDefaultstatus(Long.valueOf(bookForm.getDefaultstatus()));
		gods.setFirststatus(Long.valueOf(bookForm.getFirststatus()));
		gods.setPoint(Long.valueOf(bookForm.getPoint()));
		gods.setStatus(new Long("0"));
		gods.setHourcount(Long.valueOf(request.getParameter("hourcount")
				.toString()));
		gods.setSellcount(new Long("0"));
		GodsService service = new GodsService();
		UserService services = new UserService();

		// Date date = new Date();
		// String dir = String.valueOf(date.getTime());
		try {
			String minp = request.getParameter("minphoto_url");
			String maxp = request.getParameter("maxphoto_url");
			String maxphotoa = request.getParameter("maxphoto_a_url");
			String maxphotob = request.getParameter("maxphoto_b_url");
			String maxphotoc = request.getParameter("maxphoto_c_url");
			String maxphotod = request.getParameter("maxphoto_d_url");
			FormFile upFile = bookForm.getMinphoto();
			FormFile upFilem = bookForm.getMaxphoto();
			FormFile upFilea = bookForm.getMaxphoto_a();
			FormFile upFileb = bookForm.getMaxphoto_b();
			FormFile upFilec = bookForm.getMaxphoto_c();
			FormFile upFiled = bookForm.getMaxphoto_d();
			// 获得上传的文件名称
			System.out.println(upFilea.getFileSize());
			// 小图
			if (minp == null || "".equals(minp)) {
				if (upFile.getFileName() == null
						|| "".equals(upFile.getFileName())) {
					minp = "0";
				} else {
					minp = uploadimg.upminimg(form, request, response);
				}
			}
			// 大图
			if (maxp == null || "".equals(maxp)) {
				if (upFilem.getFileName() == null
						|| "".equals(upFilem.getFileName())) {
					maxp = "0";
				} else {
					maxp = uploadimg.upmaximg(form, request, response);
				}
			}
			// 图片一
			if (maxphotoa == null || "".equals(maxphotoa)) {
				if (upFilea.getFileName() == null
						|| "".equals(upFilea.getFileName())) {
					maxphotoa = "0";
				} else {
					maxphotoa = uploadimg.upmaximga(form, request, response);
				}
			}
			// 图片二
			if (maxphotob == null || "".equals(maxphotob)) {
				if (upFileb.getFileName() == null
						|| "".equals(upFileb.getFileName())) {
					maxphotob = "0";
				} else {
					maxphotob = uploadimg.upmaximgb(form, request, response);
				}
			}
			// 图片三
			if (maxphotoc == null || "".equals(maxphotoc)) {
				if (upFilec.getFileName() == null
						|| "".equals(upFilec.getFileName())) {
					maxphotoc = "0";
				} else {
					maxphotoc = uploadimg.upmaximgc(form, request, response);
				}
			}
			// 图片四
			if (maxphotod == null || "".equals(maxphotod)) {
				if (upFiled.getFileName() == null
						|| "".equals(upFiled.getFileName())) {
					maxphotod = "0";
				} else {
					maxphotod = uploadimg.upmaximgd(form, request, response);
				}
			}
			gods.setMaxphoto_a(maxphotoa);
			gods.setMaxphoto_b(maxphotob);
			gods.setMaxphoto_c(maxphotoc);
			gods.setMaxphoto_d(maxphotod);

			if (minp != null) {
				gods.setMinphoto(minp);
			} else {
				request.setAttribute("info", "A文件上传错误");
				return mapping.findForward("error");
			}
			if (maxp != null) {
				gods.setMaxphoto(maxp);
			} else {
				request.setAttribute("info", "B文件上传错误");
				return mapping.findForward("error");
			}
			Subject subject = services.getSubject(Long.valueOf(types));
			if (subject.getFirst() == 0) {
				gods.setFirst(subject.getId());
				gods.setFirstname(subject.getFirstname());
				gods.setSecond(new Long("0"));
				gods.setSecondname("0");
			} else {
				gods.setFirst(subject.getFirst());
				gods.setFirstname(subject.getFirstname());
				gods.setSecond(subject.getSecond());
				gods.setSecondname(subject.getSecondname());
			}
			Gods godss = service.getGodsByName(name);
			if (godss == null) {
				service.addBook(gods);// 添加图书
				System.out.println("111111111111");
				return mapping.findForward("success");
			} else {
				request.setAttribute("info", "标题为" + "的教案已经存在");
				return mapping.findForward("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			GodsService service = new GodsService();
			service.deleteGods(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("success");
	}

	public ActionForward preModify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		/*
		 * BookForm bookForm = new BookForm();
		 * 
		 * Book book = (Book) request.getSession().getAttribute("book"); if
		 * (book != null) { bookForm.setContent(book.getContent());
		 * bookForm.setId(String.valueOf(book.getId())); }
		 * request.setAttribute("bookForm", bookForm);
		 */
		return mapping.findForward("error");
	}

	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		GodsService service = new GodsService();
		try {
			Gods gods = service.getGods(id);
			request.setAttribute("gods", gods);

		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}

		return mapping.findForward("modify");
	}
	
	public ActionForward down(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		GodsService service = new GodsService();
		try {
			Gods gods = service.getGods(id);
			gods.setStatus(new Long("1"));
			service.UpdateGods(gods);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}

		return mapping.findForward("success");
	}

	public ActionForward updateSysMail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");
		System.out.println("111111111111");
		ConfigReader.getInstance().setSysmail(name);
		System.out.println(name);
		System.out.println("111111111111");
		return mapping.findForward("sysmail");
	}

	public ActionForward updateSysContent(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		String name = request.getParameter("discript");
		ConfigReader.getInstance().setSyscontent(name);
		return mapping.findForward("syscontent");
	}

	public ActionForward updateSysImg(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			String minp = uploadimg.upminimg(form, request, response);
			if (minp != null) {
				ConfigReader.getInstance().setSysimg(minp);
				;
			} else {
				request.setAttribute("info", "A文件上传错误");
				return mapping.findForward("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}

		return mapping.findForward("sysimg");
	}

	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		GodsForm bookForm = (GodsForm) form;

		UserService services = new UserService();
		String types = request.getParameter("types");
		try {
			GodsService service = new GodsService();
			Gods gods = service.getGods(id);
			String name = bookForm.getName();
			gods.setName(request.getParameter("name"));
			gods.setOldprice(Double.valueOf(request.getParameter("oldprice").toString()));
			gods.setPoint(Long.valueOf(request.getParameter("point").toString()));
			gods.setNewprice(Double.valueOf(request.getParameter("newprice").toString()));
			gods.setDiscript(request.getParameter("discript"));
			gods.setContent(request.getParameter("content"));
			gods.setStartdate(java.sql.Date.valueOf(request.getParameter("begin_time")));
			gods.setEnddate(java.sql.Date.valueOf(request.getParameter("end_time")));
			gods.setDefaultstatus(Long.valueOf(bookForm.getDefaultstatus()));
			gods.setFirststatus(Long.valueOf(bookForm.getFirststatus()));
			gods.setStatus(Long.valueOf(bookForm.getStatus()));
			gods.setSecond(new Long("0"));
			// gods.setFirst();
			gods.setSecondname("0");
			gods.setSellcount(Long.valueOf(bookForm.getSellcount()));
			gods.setHourcount(Long.valueOf(bookForm.getHourcount()));
			Subject subject = services.getSubject(Long.valueOf(types));
			gods.setFirstname(subject.getFirstname());
			gods.setFirst(Long.valueOf(types));
			//"0".equals(topgods.getMaxphoto_a())&&topgods.getMaxphoto_a()!=null
			String pt_ma = request.getParameter("pt_ma");
			String pt_m = request.getParameter("pt_m");
			String pt_a = request.getParameter("pt_a");
			String pt_b = request.getParameter("pt_b");
			String pt_c = request.getParameter("pt_c");
			String pt_d = request.getParameter("pt_d");
			if("".equals(pt_ma)||"0".equals(pt_ma)||pt_ma==null){pt_ma="0";}
			if("".equals(pt_m)||"0".equals(pt_m)||pt_m==null){pt_m="0";}
			if("".equals(pt_a)||"0".equals(pt_a)||pt_a==null){pt_a="0";}
			if("".equals(pt_b)||"0".equals(pt_b)||pt_b==null){pt_b="0";}
			if("".equals(pt_c)||"0".equals(pt_c)||pt_c==null){pt_c="0";}
			if("".equals(pt_d)||"0".equals(pt_d)||pt_d==null){pt_d="0";}
			gods.setMinphoto(pt_m);
			gods.setMaxphoto(pt_ma);
			gods.setMaxphoto_a(pt_a);
			gods.setMaxphoto_b(pt_b);
			gods.setMaxphoto_c(pt_c);
			gods.setMaxphoto_d(pt_d);
			service.UpdateGods(gods);
			return mapping.findForward("success");

		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}
	
	public ActionForward updatesn(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		UserService services = new UserService();
		try {
			GodsService service = new GodsService();
			Gods gods = service.getGods(id);
			gods.setSn(Long.valueOf(request.getParameter("sn")));
			service.UpdateGods(gods);
			return mapping.findForward("sn");

		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}
	

}
