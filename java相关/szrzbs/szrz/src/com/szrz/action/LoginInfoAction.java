
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.LoginInfo;
import com.szrz.service.LoginInfoManager;


public class LoginInfoAction extends BaseAction {
	
	protected LoginInfoManager mgr;
	
	public List<LoginInfo> loginInfoLst ;
	
	public LoginInfo loginInfo;
	
	public Integer id;

	public void setLoginInfoManager(LoginInfoManager mgr)
	{
		this.mgr = mgr;
	}
	
	/*
	 * 登录信息列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getLoginInfo(),pageNum, getNumPerPage());
		List<LoginInfo> ss =(List<LoginInfo>)page.getList();
		setLoginInfoLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * 删除登录信息
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 添加登录信息
	 */
	public String add(){
		mgr.add(getLoginInfo());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 编辑登录信息
	 */
	public String edit(){
		 loginInfo = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * 修改登录信息
	 */
	public String update(){
		LoginInfo adm = mgr.get(getId());
		loginInfo.setId(getId());
//		loginInfo.setCreateDate(loginInfo.getCreateDate());
		mgr.update(loginInfo);
		return ajaxForwardSuccess("修改成功!");
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public List<LoginInfo> getLoginInfoLst() {
		return loginInfoLst;
	}
	
	


	public void setLoginInfoLst(List<LoginInfo> loginInfoLst) {
		this.loginInfoLst = loginInfoLst;
	}

	public LoginInfo getLoginInfo() {
		return loginInfo;
	}

	public void setLoginInfo(LoginInfo loginInfo) {
		this.loginInfo = loginInfo;
	}
	
	
	
	
	
	

}
