/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.dao.AdminDao;
import com.szrz.domain.Admin;
import com.szrz.service.AdminManager;

/** 
 * @author zhangwei laketea@163.com
 * @version 2012-10-15
 * 
 */
public class AdminManagerImpl implements AdminManager {
	
	
	private AdminDao adminDao;
	
	public void setAdminDao(AdminDao adminDao){
		this.adminDao = adminDao;
	}
	
	
	/*
	 * 添加管理员
	 * @see com.szrz.service.AdminManager#addAdmin(com.szrz.domain.Admin)
	 */
	public void addAdmin(Admin admin) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String create_date = sdf.format(c.getTime());
		admin.setCreateDate(create_date);
		adminDao.save(admin);
	}

	/*
	 * 删除管理员
	 */
	@Override
	public void deleteAdmin(Integer id) {
		adminDao.delete(id);
	}
	
	public Admin getAdmin(Integer id){
		return adminDao.get(id);
	}

	/* 
	 * 更改密码
	 */
	@Override
	public void updatePwd(Admin admin) {
		// TODO Auto-generated method stub
		adminDao.update(admin);
	}

	/* 
	 * 登录验证
	 */
	public int validLogin(String name,String pwd) {
		// TODO Auto-generated method stub
		int status=0;
		List<Admin> lst =adminDao.findByNamePwd(name, pwd);
		status =(lst==null||lst.isEmpty())?0:1;
		return status;
	}


	/* 
	 * 查询所有
	 */
	public List<Admin> findAll() {
		return adminDao.findAll();
	}
	/*
	 * 分页查询
	 */
	public Page findByPage(int pageNo ,int pageSize) {
		List lst = adminDao.findByPage(pageNo, pageSize);
		List allLst =adminDao.findAll();
		int totalRecords = allLst.size();
		Page page = new Page(lst);
		page.setTotalRecords(totalRecords);
		page.setPageSize(pageSize);
		page.setCurPageNumber(pageNo);
		return page;
	}

}
