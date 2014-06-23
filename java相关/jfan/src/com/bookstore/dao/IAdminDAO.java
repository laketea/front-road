package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Admin;

public interface IAdminDAO {

	public void addAdmin(Admin admin) throws DBException;
	
	public Admin getAdminByName(String name) throws DBException;

	public void updateAdmin(Admin admin) throws DBException;

	public void deleteAdmin(Long id) throws DBException;

	public Admin getAdmin(Long id) throws DBException;

	public List getAdminList() throws DBException;
	
	public List getAdminListByPage( int pagesize , int curpage) throws DBException;

}