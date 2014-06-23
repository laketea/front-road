
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
	 * �û��б�
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
	 * ɾ���û�
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	/*
	 * ����û�
	 */
	public String add(){
		mgr.add(getUser());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	/*
	 * �༭�û�
	 */
	public String edit(){
		 user = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * �޸��û�
	 */
	public String update(){
		User adm = mgr.get(getId());
		user.setId(getId());
//		user.setCreateDate(user.getCreateDate());
		mgr.update(user);
		return ajaxForwardSuccess("�޸ĳɹ�!");
	}
	
	/*
	 * ����ɾ��
	 */
	public String batch(){
		 mgr.batchDelete(ids);	
		return ajaxForwardSuccess("�����ɹ�!");
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
