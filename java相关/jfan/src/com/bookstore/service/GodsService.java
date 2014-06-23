package com.bookstore.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.bookstore.dao.DAOFactory;
import com.bookstore.dao.IGodsDAO;
import com.bookstore.exception.DBException;
import com.bookstore.po.Gods;
import com.bookstore.util.Page;

public class GodsService {
	//static Logger log = Logger.getLogger(BookService.class.getName());
	//添加教案
	//获取顶置推荐图书
	public Gods getTopGods() throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		return dao.getTopGods();
	}
	
	//获取今日推荐图书 
	public Page getTodayGods( int status ,int pagesize,int curpage ) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		String sql = this.getDBString(status);
		return dao.getTodayGods( sql , pagesize ,curpage );
	}
	
	public String getDBString ( int status ){
		String sql = null;
		if(status==1){
			sql="order by sn asc";
		}else if( status==2 ){
			sql="order by sellcount desc";
		}else if( status==3 ) {
			sql="order by newprice desc";
		}else {
			sql="order by newprice asc";
		}
		return sql;
	}
	
	//获取一级分类图书 
	public Page getColumnGods( int status , long column ,int pagesize,int curpage ) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		String sql = this.getDBString(status);
		return dao.getColumnGods( sql , column, pagesize ,curpage);
	}
	
	
	public void addBook(Gods Gods) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		//log.info("保存用户对象->用户名："+Gods.getGodsname());
		dao.addGods(Gods);
	}
	
	/*
	public Gods getGodsBySubject(String subject) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		return dao.getGodsBySubject(subject);
	}
	
	*/
	//根据标题判断图书是否已存在
	public Gods getGodsByName(String name) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		return dao.getGodsByName(name);
	}
	
	//根据ID获取图书
	public Gods getGods(Long id) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		return dao.getGods(id);
	} 
	
	//获取图书总数
	public int getGodsCount() throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		return dao.getGodsCount();
	} 
	
	public int getGodsCount(int cl ) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		return dao.getGodsCount(cl);
	} 
	
	public int getSearchGodsCount(Gods Gods) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		return dao.getSearchGodsCount(Gods);
	} 
	
	//修改图书
	public void UpdateGods(Gods Gods) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		dao.updateGods(Gods);
	}
	
	//删除图书
	public void deleteGods(Long id) throws DBException {
		IGodsDAO dao = DAOFactory.getGodsDAO();
		dao.deleteGods(id);
	}
	
	//分页获取图书
	public List getGodsListByPage( int pagesize,int curpage)throws DBException{
		List list=null;
		IGodsDAO dao = DAOFactory.getGodsDAO();
		list=dao.getGodsListByPage(pagesize,curpage);
		return list;
	}
	
	public List getGodsListByPage( int pagesize,int curpage , int cl )throws DBException{
		List list=null;
		IGodsDAO dao = DAOFactory.getGodsDAO();
		list=dao.getGodsListByPage(pagesize,curpage,cl);
		return list;
	}
	
	//根据年级科目获取图书
	public List getSearchListByPage( Gods Gods,int pagesize,int curpage)throws DBException{
		List list=null;
		IGodsDAO dao = DAOFactory.getGodsDAO();
		list=dao.getSearchListByPage(Gods,pagesize,curpage);
		return list;
	}
	
	/*
	public List getLeftGodsListByPage( Gods Gods,int pagesize,int curpage)throws DBException{
		List list=null;
		IGodsDAO dao = DAOFactory.getGodsDAO();
		list=dao.getLeftGodsListByPage(Gods,pagesize,curpage);
		return list;
	}
	
	public List getGodsList(String column)throws DBException{
		List list=null;
		IGodsDAO dao = DAOFactory.getGodsDAO();
		list=dao.getGodsList(column);
		return list;
	}
	*/
}	
