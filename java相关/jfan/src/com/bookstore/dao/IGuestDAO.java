package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Guest;

public interface IGuestDAO {
	
	//添加教案
	public void addGuest(Guest guest) throws DBException;
	
	//修改教案
	public void updateGuest(Guest guest) throws DBException;

	//删除教案
	public void deleteGuest(Long id) throws DBException;
	
	
	//获取教案总数
	public int getGuestCount() throws DBException;
	
	public int getGuestCountCon() throws DBException;
	
	public int getGuestFCountCon() throws DBException;

	public int getGuestCountFeed() throws DBException;
	
	public List getConListByPage(int pagesize,int curpage) throws DBException;
	
	public List getFConListByPage(int pagesize,int curpage) throws DBException;
	public List getFeedListByPage(int pagesize,int curpage) throws DBException;
	
	public int getGCount(String grade) throws DBException;
	
	//根据ID获取教案
	public Guest getGuest(Long id) throws DBException;

	//
	public Guest getGuestBySubject(String subject) throws DBException;
	
	//根据标题获取教案
	public Guest getGuestByTitle(String title) throws DBException;

	//分页获取教案
	public List getGuestListByPage( int pagesize , int curpage) throws DBException;

}