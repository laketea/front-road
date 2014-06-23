package com.szrz.views;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.szrz.domain.User;
import com.szrz.service.NewsManager;
import com.szrz.service.UserManager;

public class UserAction extends ActionSupport {

	protected UserManager mgr;

	private String name;

	private String pwd;
	
	private User user;
	
	private String errMsg;

	public void setUserManager(UserManager mgr) {
		this.mgr = mgr;
	}

	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}
	
	public HttpSession getSession()
	  {
	    return ServletActionContext.getRequest().getSession(true);
	  }

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	public String getParameter(String name) {
		return getRequest().getParameter(name);
	}

	public void login() {
		HttpServletResponse response = this.getResponse();
		response.setContentType("text/html;charset=gbk");
		User nuser = mgr.findByNamePwd(getParameter("name"),getParameter("pwd"));
		String req = "0";
		if (nuser != null) {
			req = "1";
			this.getSession().setAttribute("login", "1");
			this.getSession().setAttribute("user", nuser);
		}
		try {
			response.getWriter().write(req);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public String loginOut(){
		 getSession().setAttribute("login", "0");
		 return "index";
		
	}
	
	public String reg(){
		User ouser = mgr.findByName(user.getNick());
		if(ouser!=null){
			errMsg="提示:用户名已存在，请使用其他注册名!";
			return "input";
		}
		User iuser = mgr.findByIdCard(user.getIdCard());
		if(iuser!=null){
			errMsg="提示:身份证信息已存在，请勿重复注册!";
			return "input";
		}
		mgr.add(user);
		this.getSession().setAttribute("login", "1");
		this.getSession().setAttribute("user", "user");
		
		return "index";
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	
	
	

}
