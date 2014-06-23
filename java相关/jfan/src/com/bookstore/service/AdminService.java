package com.bookstore.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.bookstore.dao.DAOFactory;
import com.bookstore.dao.IAdminDAO;
import com.bookstore.exception.DBException;
import com.bookstore.po.Admin;

public class AdminService {
	//static Logger log = Logger.getLogger(AdminService.class.getName());
	public void addAdmin(Admin admin) throws DBException {
		IAdminDAO dao = DAOFactory.getAdminDAO();
		//log.info("保存用户对象->用户名："+admin.getAdminname());
		dao.addAdmin(admin);
	}
	
	public Admin getAdminByName(String name) throws DBException {
		IAdminDAO dao = DAOFactory.getAdminDAO();
		return dao.getAdminByName(name);
	}
	
	public Admin getAdmin(Long id) throws DBException {
		IAdminDAO dao = DAOFactory.getAdminDAO();
		return dao.getAdmin(id);
	}

	public void UpdateAdmin(Admin admin) throws DBException {
		IAdminDAO dao = DAOFactory.getAdminDAO();
		dao.updateAdmin(admin);
	}
	
	public void deleteAdmin(Long id) throws DBException {
		IAdminDAO dao = DAOFactory.getAdminDAO();
		dao.deleteAdmin(id);
	}
	
	public List getAdminListByPage(int pagesize,int curpage)throws DBException{
		List list=null;
		IAdminDAO dao = DAOFactory.getAdminDAO();
		list=dao.getAdminListByPage(pagesize,curpage);
		return list;
	}
	
	public List getAdminList() throws DBException{
		List list=null;
		IAdminDAO dao = DAOFactory.getAdminDAO();
		list=dao.getAdminList();
		return list;
	}
}	
