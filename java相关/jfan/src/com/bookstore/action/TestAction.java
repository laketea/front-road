package com.bookstore.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
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
import com.bookstore.form.PlanForm;
import com.bookstore.form.TestForm;
import com.bookstore.po.Suggest;
import com.bookstore.po.Review;
import com.bookstore.po.Test;
import com.bookstore.service.ReviewService;
import com.bookstore.service.TestService;

public class TestAction extends DispatchAction {

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TestForm testForm = (TestForm) form;
		Test test = new Test();
		test.setTitle(testForm.getTitle());
		test.setContent(testForm.getContent());
		test.setSource(testForm.getSource());
		test.setAuthor(testForm.getAuthor());
		test.setSubject(testForm.getSubject());
		test.setGrade(testForm.getGrade());
		test.setTypes(testForm.getTypes());
		//test.setFileaddress(testForm.getFileaddress());
		//test.setFileaddress("aa");
		test.setCreatedate(new Date(new java.util.Date().getTime()));
		TestService service = new TestService();
		Date date = new Date();
		String dir = String.valueOf(date.getTime());
		String filename = null;
		try {
			// 获得上传的相片文件
			
			FormFile upFile = testForm.getFileaddress();
			// 获得上传的文件名称
			filename = upFile.getFileName();
			String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
			Calendar calendar = Calendar.getInstance();
			filename = String.valueOf(calendar.getTimeInMillis())+"."+ext;
			int filesize = upFile.getFileSize();
			if(filesize>1024*1024*2){
				System.out.println("SSSSSSSS");
				return mapping.getInputForward(); 
			}
			String path = request.getRealPath("/files");
			// 以订单id为目录创建相片存储的文件夹
			//path=path+"\\"+orderId;
			// 如果该目录不存在，则创建该目录
			File file=new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			InputStream fin = upFile.getInputStream();
			OutputStream fout = new FileOutputStream(path + "\\"
					+filename);
			byte[] buffer = new byte[8192];
			int readByte = 0;
			while ((readByte = fin.read(buffer, 0, 8192)) > 0) {
				fout.write(buffer, 0, readByte);
			}
			fin.close();
			fout.close();
			test.setFileaddress(filename);
			Test test1 = service.getTestByTitle(testForm.getTitle());
			if (test1 == null) {
				service.addTest(test);//添加试题
				return mapping.findForward("success");
			} else {
				request.setAttribute("info","标题为"+testForm.getSubject()+"的教案已经存在");
				return mapping.findForward("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}

/*
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TestForm testForm = (TestForm) form;
		String testname = testForm.getTestname();
		TestService service = new TestService();
		Test test = null;
		try {
			test = service.getTestByTestname(testname);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("loginerror");
		}
		if (test == null || !test.getPasswd().equals(testForm.getPasswd())) {
			return mapping.findForward("loginerror");
		}
		request.getSession().setAttribute("test", test);
		return mapping.findForward("loginsuccess");
	}
	
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TestService service = new TestService();
		String column = request.getParameter("column");
		List list = null;
		try {
			list = service.getTestList(column);
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
		TestService service = new TestService();
		String column = request.getParameter("column");
		int pagesize = Integer.parseInt(request.getParameter("pagesize").toString());
		int curpage = Integer.parseInt(request.getParameter("curpage").toString());
		List list = null;
		try {
			list = service.getTestListByPage(column,pagesize,curpage);
			request.setAttribute("list", list);
			System.out.println(">>>>>>>>>>>>>>>>>" + list.size());
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("success");
	}
	*/
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String ids = request.getParameter("id");
			Long id = Long.valueOf(ids);
			TestService service = new TestService();
			service.deleteTest(id);
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		return mapping.findForward("success");
	}
	
	public ActionForward search(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TestForm testForm = (TestForm) form;
		Test test = new Test();
		test.setGrade(testForm.getGrade());
		test.setSubject(testForm.getSubject());
		test.setTitle(testForm.getTitle());
		System.out.println(testForm.getGrade());
		System.out.println(testForm.getSubject());
		System.out.println(testForm.getTitle());
		request.getSession().setAttribute("test", test);
		request.setAttribute("testForm", testForm);
		return mapping.findForward("search");
	}

	
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		Long id = Long.valueOf(ids);
		TestForm testForm = new TestForm();
		TestService service = new TestService();
		try {
			Test test = service.getTest(id);
			request.setAttribute("test", test);
			
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
		
		return mapping.findForward("modify");
	}
	
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String ids = request.getParameter("id");
		String ff = request.getSession().getAttribute("ff").toString();
		Long id = Long.valueOf(ids);
		TestForm testForm = (TestForm) form;
		Test test = new Test();
		test.setTitle(testForm.getTitle());
		test.setContent(testForm.getContent());
		test.setSource(testForm.getSource());
		test.setAuthor(testForm.getAuthor());
		test.setSubject(testForm.getSubject());
		test.setGrade(testForm.getGrade());
		test.setTypes(testForm.getTypes());
		test.setFileaddress(ff);
		test.setCreatedate(new Date(new java.util.Date().getTime()));
		System.out.println(test.getTitle());
		System.out.println(test.getContent());
		System.out.println(test.getSource());
		System.out.println(test.getAuthor());
		System.out.println(test.getSubject());
		System.out.println(test.getGrade());
		System.out.println(test.getFileaddress());
		test.setId(Long.valueOf(ids));
		try {
			TestService service = new TestService();
				service.UpdateTest(test);
				return mapping.findForward("success");
			
		} catch (DBException e) {
			e.printStackTrace();
			return mapping.findForward("error");
		}
	}
	
	
}
