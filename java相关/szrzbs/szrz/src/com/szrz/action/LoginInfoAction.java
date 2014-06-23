
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
	 * ��¼��Ϣ�б�
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
	 * ɾ����¼��Ϣ
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	/*
	 * ��ӵ�¼��Ϣ
	 */
	public String add(){
		mgr.add(getLoginInfo());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	/*
	 * �༭��¼��Ϣ
	 */
	public String edit(){
		 loginInfo = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * �޸ĵ�¼��Ϣ
	 */
	public String update(){
		LoginInfo adm = mgr.get(getId());
		loginInfo.setId(getId());
//		loginInfo.setCreateDate(loginInfo.getCreateDate());
		mgr.update(loginInfo);
		return ajaxForwardSuccess("�޸ĳɹ�!");
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
