package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Review;
import com.bookstore.po.Test;

public interface ITestDAO {
	
	//�������
	public void addTest(Test test) throws DBException;
	
	//�޸�����
	public void updateTest(Test test) throws DBException;

	//ɾ������
	public void deleteTest(Long id) throws DBException;
	
	//�����꼶��Ŀ��ҳ��ȡ����
	public List getSearchListByPage(Test test,int pagesize,int curpage) throws DBException;
	
	public List getGRListByPage(String grade,String subject,int pagesize,int curpage) throws DBException;
	
	public List getGRTListByPage(String grade,String subject,String types,int pagesize,int curpage) throws DBException;
	//����ID��ȡ����
	public Test getTest(Long id) throws DBException;
	
	public int getGRTCount(String grade,String subject,String types) throws DBException;


	//
	public Test getTestBySubject(String subject) throws DBException;
	
	//���ݱ����ȡ����
	public Test getTestByTitle(String title) throws DBException;

	//��ҳ��ȡ����
	public List getTestListByPage( int pagesize , int curpage) throws DBException;
	
	//��ȡ�̰�����
	public int getTestCount() throws DBException;
	
	//��������������ȡ�̰�����
	public int getTestCountSearch( Test test ) throws DBException;

}