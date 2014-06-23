package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Suggest;

public interface INewsDAO {

	public void addNews(Suggest news) throws DBException;
	public Suggest getNewsBySubject(String subject) throws DBException;

	public void updateNews(Suggest news) throws DBException;

	public void deleteNews(Long id) throws DBException;

	public Suggest getNews(Long id) throws DBException;

	public int getNewsCountByColumn (String column) throws DBException;
	//public News getNewsByNewsname(String username) throws DBException;

	public List getNewsList(String column) throws DBException;
	public List getNewsListByPage(String column , int pagesize , int curpage) throws DBException;
	public List getOtherListByPage(String column , int pagesize , int curpage) throws DBException;
	public List getOtherListByPage(String a ,String b ,String c , int pagesize , int curpage) throws DBException;

}