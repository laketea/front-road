package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Review;
import com.bookstore.po.Test;

public interface ITestDAO {
	
	//添加试题
	public void addTest(Test test) throws DBException;
	
	//修改试题
	public void updateTest(Test test) throws DBException;

	//删除试题
	public void deleteTest(Long id) throws DBException;
	
	//根据年级科目分页获取试题
	public List getSearchListByPage(Test test,int pagesize,int curpage) throws DBException;
	
	public List getGRListByPage(String grade,String subject,int pagesize,int curpage) throws DBException;
	
	public List getGRTListByPage(String grade,String subject,String types,int pagesize,int curpage) throws DBException;
	//根据ID获取试题
	public Test getTest(Long id) throws DBException;
	
	public int getGRTCount(String grade,String subject,String types) throws DBException;


	//
	public Test getTestBySubject(String subject) throws DBException;
	
	//根据标题获取试题
	public Test getTestByTitle(String title) throws DBException;

	//分页获取试题
	public List getTestListByPage( int pagesize , int curpage) throws DBException;
	
	//获取教案总数
	public int getTestCount() throws DBException;
	
	//根据搜索条件获取教案总数
	public int getTestCountSearch( Test test ) throws DBException;

}