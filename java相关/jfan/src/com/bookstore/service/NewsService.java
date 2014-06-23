package com.bookstore.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.bookstore.dao.DAOFactory;
import com.bookstore.dao.INewsDAO;
import com.bookstore.exception.DBException;
import com.bookstore.po.Suggest;

public class NewsService {
	//static Logger log = Logger.getLogger(NewsService.class.getName());
	public void addNews(Suggest news) throws DBException {
		INewsDAO dao = DAOFactory.getNewsDAO();
		//log.info("保存用户对象->用户名："+news.getNewsname());
		dao.addNews(news);
	}
	
	public Suggest getNewsBySubject(String subject) throws DBException {
		INewsDAO dao = DAOFactory.getNewsDAO();
		return dao.getNewsBySubject(subject);
	}
	
	public Suggest getNews(Long id) throws DBException {
		INewsDAO dao = DAOFactory.getNewsDAO();
		return dao.getNews(id);
	}

	public void UpdateNews(Suggest news) throws DBException {
		INewsDAO dao = DAOFactory.getNewsDAO();
		dao.updateNews(news);
	}
	
	public void deleteNews(Long id) throws DBException {
		INewsDAO dao = DAOFactory.getNewsDAO();
		dao.deleteNews(id);
	}
	
	public List getNewsListByPage(String column,int pagesize,int curpage)throws DBException{
		List list=null;
		INewsDAO dao = DAOFactory.getNewsDAO();
		list=dao.getNewsListByPage(column,pagesize,curpage);
		return list;
	}
	
	public List getOtherListByPage(String column,int pagesize,int curpage)throws DBException{
		List list=null;
		INewsDAO dao = DAOFactory.getNewsDAO();
		list=dao.getOtherListByPage(column,pagesize,curpage);
		return list;
	}
	
	public List getOtherRListByPage(String column,int pagesize,int curpage)throws DBException{
		List list=null;
		String a=null;
		String b=null;
		String c=null;
		if(column.equals("4")){a="6";b="6";c="7";}
		if(column.equals("5")){a="6";b="7";c="4";}
		if(column.equals("6")){a="4";b="5";c="7";}
		if(column.equals("7")){a="4";b="5";c="6";}
		
		INewsDAO dao = DAOFactory.getNewsDAO();
		list=dao.getOtherListByPage(a,b,c,pagesize,curpage);
		return list;
	}
	
	public List getOtherNListByPage(String column,int pagesize,int curpage)throws DBException{
		List list=null;
		String a=null;
		String b=null;
		String c=null;
		if(column.equals("1")){a="2";b="3";c="3";}
		if(column.equals("2")){a="1";b="1";c="3";}
		if(column.equals("3")){a="1";b="2";c="2";}
		
		INewsDAO dao = DAOFactory.getNewsDAO();
		list=dao.getOtherListByPage(a,b,c,pagesize,curpage);
		return list;
	}
	
	
	public int getNewsCountByColumn(String column)throws DBException{
		List list=null;
		INewsDAO dao = DAOFactory.getNewsDAO();
		//list=dao.getNewsCountByColumn(column);
		return dao.getNewsCountByColumn(column);
	}
	
	public List getNewsList(String column)throws DBException{
		List list=null;
		INewsDAO dao = DAOFactory.getNewsDAO();
		list=dao.getNewsList(column);
		return list;
	}
}	
