package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Gods;
import com.bookstore.util.Page;

public interface IGodsDAO {
	
	public Gods getTopGods() throws DBException;
	
	//修改图书
	public Page getTodayGods( String sql , int pagesize , int curpage ) throws DBException;

	//删除图书
	public Page getColumnGods(String sql , long column , int pagesize , int curpage ) throws DBException;
	
	//添加图书
	public void addGods(Gods Gods) throws DBException;
	
	//修改图书
	public void updateGods(Gods news) throws DBException;

	//删除图书
	public void deleteGods(Long id) throws DBException;
	
	//根据年级科目分页获取图书
	public List getSearchListByPage(Gods Gods,int pagesize,int curpage) throws DBException;
	
	//根据ID获取图书
	public Gods getGods(Long id) throws DBException;
	
	public int getGodsCount() throws DBException;
	
	public int getGodsCount( int cl ) throws DBException;
	
	public int getSearchGodsCount( Gods Gods ) throws DBException;

	//public List getLeftGodsListByPage(Gods Gods,int pagesize,int curpage) throws DBException;
	//
	//public Gods getGodsBySubject(String subject) throws DBException;
	
	//根据标题获取图书
	public Gods getGodsByName(String name) throws DBException;

	//分页获取图书
	public List getGodsListByPage( int pagesize , int curpage) throws DBException;
	
	public List getGodsListByPage( int pagesize , int curpage , int cl) throws DBException;

}