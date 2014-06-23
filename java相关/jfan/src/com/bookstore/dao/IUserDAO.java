package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.User;
import com.bookstore.po.Address;
import com.bookstore.po.Subject;

public interface IUserDAO {

	public void addUser(User user) throws DBException;
	
	public void addAddress(Address add) throws DBException;
	
	public void addSubject(Subject subject) throws DBException;
	
	public int getFavCount(String userid) throws DBException;
	
	public User getUserByName(String name) throws DBException;
	
	public User getUserByEmail(String name) throws DBException;
	
	public User getUserByEname(String name) throws DBException;
	
	//public User getUserByName(Subject subject) throws DBException;
	
	public Subject getSubjectByName(String name) throws DBException;
	
	public List getSecondByFirst(long id) throws DBException;
	
	public Subject getSubjectByName(Subject subject) throws DBException;
	
	//public Fav checkFav(String userid,String bookid) throws DBException;

	public void updateUser(User user) throws DBException;
	
	public void updateSubject(Subject subject) throws DBException;
	
	public void updateAddress(Address add) throws DBException;

	public void deleteUser(Long id) throws DBException;
		
	public void deleteAddress(Long id) throws DBException;
	
	public void deleteSubject(Long id) throws DBException;

	public User getUser(Long id) throws DBException;
	
	public Subject getSubject(Long id) throws DBException;
	
	public Address getAddress(Long id) throws DBException;

	public List getUserList() throws DBException;
	
	public List getSubjectList(int cl ) throws DBException;
	
	public List getAddressList( Long id ) throws DBException;
	
	
	public List getUserListByPage( int pagesize , int curpage) throws DBException;
	
	public List getFavListByPage( int pagesize , int curpage , String userid) throws DBException;

}