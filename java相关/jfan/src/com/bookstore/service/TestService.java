package com.bookstore.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.bookstore.dao.DAOFactory;
import com.bookstore.dao.IReviewDAO;
import com.bookstore.dao.ITestDAO;
import com.bookstore.exception.DBException;
import com.bookstore.po.Review;
import com.bookstore.po.Test;

public class TestService {
	//static Logger log = Logger.getLogger(TestService.class.getName());
	//��ӽ̰�
	public void addTest(Test test) throws DBException {
		ITestDAO dao = DAOFactory.getTestDAO();
		//log.info("�����û�����->�û�����"+test.getTestname());
		dao.addTest(test);
	}
	
	//
	public Test getTestBySubject(String subject) throws DBException {
		ITestDAO dao = DAOFactory.getTestDAO();
		return dao.getTestBySubject(subject);
	}
	
	//���ݱ����жϽ̰��Ƿ��Ѵ���
	public Test getTestByTitle(String title) throws DBException {
		ITestDAO dao = DAOFactory.getTestDAO();
		return dao.getTestByTitle(title);
	}
	
	//����ID��ȡ�̰�
	public Test getTest(Long id) throws DBException {
		ITestDAO dao = DAOFactory.getTestDAO();
		return dao.getTest(id);
	}
	
	//�޸Ľ̰�
	public void UpdateTest(Test test) throws DBException {
		ITestDAO dao = DAOFactory.getTestDAO();
		dao.updateTest(test);
	}
	
	//ɾ���̰�
	public void deleteTest(Long id) throws DBException {
		ITestDAO dao = DAOFactory.getTestDAO();
		dao.deleteTest(id);
	}
	
	//��ҳ��ȡ�̰�
	public List getTestListByPage( int pagesize,int curpage)throws DBException{
		List list=null;
		ITestDAO dao = DAOFactory.getTestDAO();
		list=dao.getTestListByPage(pagesize,curpage);
		return list;
	}
	
	//�����꼶��Ŀ������ȡ����
	public List getSearchListByPage(Test test,int pagesize,int curpage)throws DBException{
		List list=null;
		ITestDAO dao = DAOFactory.getTestDAO();
		list=dao.getSearchListByPage(test,pagesize,curpage);
		return list;
	}
	
	public List getGRListByPage(String grade, String subject,int pagesize,int curpage)throws DBException{
		List list=null;
		ITestDAO dao = DAOFactory.getTestDAO();
		list=dao.getGRListByPage(grade,subject,pagesize,curpage);
		return list;
	}
	
	public List getGRTListByPage(String grade, String subject,String types ,int pagesize,int curpage)throws DBException{
		List list=null;
		ITestDAO dao = DAOFactory.getTestDAO();
		list=dao.getGRTListByPage(grade,subject,types,pagesize,curpage);
		return list;
	}
	
	public int getGRTCount(String grade, String subject,String types )throws DBException{
		List list=null;
		int count = 0;
		ITestDAO dao = DAOFactory.getTestDAO();
		count=dao.getGRTCount(grade,subject,types);
		return count;
	}
	
	//��ȡ�̰�����
	public int getTestCount()throws DBException{
		int count = 0;
		ITestDAO dao = DAOFactory.getTestDAO();
		count=dao.getTestCount();
		return count;
	}
	
	public int getTestCountSearch( Test test)throws DBException{
		int count = 0;
		ITestDAO dao = DAOFactory.getTestDAO();
		count=dao.getTestCountSearch(test);
		return count;
	}
	/*
	public List getTestList(String column)throws DBException{
		List list=null;
		ITestDAO dao = DAOFactory.getTestDAO();
		list=dao.getTestList(column);
		return list;
	}
	*/
}	
