
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.Admin;
import com.szrz.service.AdminManager;




/** 
 * @author zhangwei laketea@163.com
 * @version 2012-10-16
 * 
 */
public class AdminAction extends BaseAction {
	
	protected AdminManager mgr;
	
	public List<Admin> adminLst ;
	
	public Admin admin;
	
	public Integer id;
	
	public String req ="";

	public void setAdminManager(AdminManager mgr)
	{
		this.mgr = mgr;
	}
	
	/*
	 * ����Ա�б�
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(pageNum, getNumPerPage());
		List<Admin> ss =(List<Admin>)page.getList();
		setAdminLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * ɾ������Ա
	 */
	public String delete(){
		mgr.deleteAdmin(getId());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	public String login(){
		int result =mgr.validLogin(admin.getName(), admin.getPwd());
		if(result==1){
			this.getSession().setAttribute("admin", "1");
		}
		return result==0?ajaxForwardError("�û������������!") :ajaxForwardSuccess("�����ɹ�!");
	}
	
	public String loginOut(){
		this.getSession().invalidate();
		return  "logininput";
	}
	
	public String adminLogin(){
		int result =mgr.validLogin(admin.getName(), admin.getPwd());
		if(result==1){
			this.getSession().setAttribute("admin", "1");
		}
		if(result==0){
			req="��ʾ:�û������������!";
			return "logininput";
		}else{
			return "adminindex";
		}
	}
	
	/*
	 * ��ӹ���Ա
	 */
	public String add(){
		mgr.addAdmin(getAdmin());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	public String edit(){
		 admin = mgr.getAdmin(getId());	
		return "edit";
	}
	
	public String update(){
		Admin adm = mgr.getAdmin(getId());
		admin.setId(getId());
		admin.setCreateDate(admin.getCreateDate());
		mgr.updatePwd(admin);
		return ajaxForwardSuccess("�޸ĳɹ�!");
	}
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public List<Admin> getAdminLst() {
		return adminLst;
	}
	
	


	public void setAdminLst(List<Admin> adminLst) {
		this.adminLst = adminLst;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	
	
	
	
	

}
