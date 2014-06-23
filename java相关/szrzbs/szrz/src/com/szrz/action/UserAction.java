
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.User;
import com.szrz.service.UserManager;


public class UserAction extends BaseAction {
	
	protected UserManager mgr;
	
	public List<User> userLst ;
	
	public User user;
	
	public Integer id;
	
	public String ids;

	public void setUserManager(UserManager mgr)
	{
		this.mgr = mgr;
	}
	
	 public HttpServletResponse getResponse() {
		    return ServletActionContext.getResponse();
		  }
	
	/*
	 * 用户列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getUser(),pageNum, getNumPerPage());
		List<User> ss =(List<User>)page.getList();
		setUserLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * 删除用户
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 添加用户
	 */
	public String add(){
		mgr.add(getUser());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 编辑用户
	 */
	public String edit(){
		 user = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * 修改用户
	 */
	public String update(){
		User adm = mgr.get(getId());
		user.setId(getId());
//		user.setCreateDate(user.getCreateDate());
		mgr.update(user);
		return ajaxForwardSuccess("修改成功!");
	}
	
	/*
	 * 批量删除
	 */
	public String batch(){
		 mgr.batchDelete(ids);	
		return ajaxForwardSuccess("操作成功!");
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public List<User> getUserLst() {
		return userLst;
	}
	
	


	public void setUserLst(List<User> userLst) {
		this.userLst = userLst;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
	
	
	
	

}
