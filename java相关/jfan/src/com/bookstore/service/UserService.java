package com.bookstore.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.bookstore.dao.DAOFactory;
import com.bookstore.dao.IUserDAO;
import com.bookstore.exception.DBException;
import com.bookstore.po.User;
import com.bookstore.po.Address;
import com.bookstore.po.Subject;

public class UserService {
	//static Logger log = Logger.getLogger(AdminService.class.getName());
	public void addUser(User user) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		//log.info("保存用户对象->用户名："+User.getUsername());
		dao.addUser(user);
	}
	
	public void addAddress(Address add) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		//log.info("保存用户对象->用户名："+User.getUsername());
		dao.addAddress(add);
	}
	
	public void addSubject(Subject subject) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		//log.info("保存用户对象->用户名："+User.getUsername());
		dao.addSubject(subject);
	}
	
	public Subject getSubjectByName(String name) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getSubjectByName(name);
	}
	
	public List getAddressList( Long id) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getAddressList(id);
	}
	
	public Address getAddress( Long id) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getAddress(id);
	}
	
	public void deleteAddress( Long id) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		dao.deleteAddress(id);
	}
	
	public void setAddressFirst(Address add ) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		dao.updateAddress(add);
		//dao.setAddressFirst(add.getId());
		//return dao.deleteAddress(id);
	}
	
	public Subject getSubjectByName(Subject subject) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getSubjectByName(subject);
	}
	
	public List getSecondByFirst(long id) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getSecondByFirst(id);
	}
	
	public User getUserByName(String name) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getUserByName(name);
	}
	
	public User getUserByEmail(String name) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getUserByEmail(name);
	}
	
	public User getUserByEname(String name) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getUserByEname(name);
	}

	/*
	public Fav checkFav(String bookid , String userid) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.checkFav(bookid,userid);
	}
	*/
	
	public User getUser(Long id) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getUser(id);
	}
	
	public Subject getSubject(Long id) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getSubject(id);
	}
	
	public int getFavCount(String userid) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		return dao.getFavCount(userid);
	}

	public void UpdateUser(User user) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		dao.updateUser(user);
	}
	
	public void UpdateSubject(Subject Subject) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		dao.updateSubject(Subject);
	}
	
	public void deleteUser(Long id) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		dao.deleteUser(id);
	}
	
	public void deleteSubject(Long id) throws DBException {
		IUserDAO dao = DAOFactory.getUserDAO();
		dao.deleteSubject(id);
	}
	
	public List getUserListByPage(int pagesize,int curpage)throws DBException{
		List list=null;
		IUserDAO dao = DAOFactory.getUserDAO();
		list=dao.getUserListByPage(pagesize,curpage);
		return list;
	}
	
	public List getFavListByPage(int pagesize,int curpage, String userid)throws DBException{
		List list=null;
		IUserDAO dao = DAOFactory.getUserDAO();
		list=dao.getFavListByPage(pagesize,curpage,userid);
		return list;
	}
	
	public List getUserList() throws DBException{
		List list=null;
		IUserDAO dao = DAOFactory.getUserDAO();
		list=dao.getUserList();
		return list;
	}
	
	public List getSubjectList( int cl) throws DBException{
		List list=null;
		IUserDAO dao = DAOFactory.getUserDAO();
		list=dao.getSubjectList(cl );
		return list;
	}
}	
