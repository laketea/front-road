package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Gods;
import com.bookstore.util.Page;

public interface IGodsDAO {
	
	public Gods getTopGods() throws DBException;
	
	//�޸�ͼ��
	public Page getTodayGods( String sql , int pagesize , int curpage ) throws DBException;

	//ɾ��ͼ��
	public Page getColumnGods(String sql , long column , int pagesize , int curpage ) throws DBException;
	
	//���ͼ��
	public void addGods(Gods Gods) throws DBException;
	
	//�޸�ͼ��
	public void updateGods(Gods news) throws DBException;

	//ɾ��ͼ��
	public void deleteGods(Long id) throws DBException;
	
	//�����꼶��Ŀ��ҳ��ȡͼ��
	public List getSearchListByPage(Gods Gods,int pagesize,int curpage) throws DBException;
	
	//����ID��ȡͼ��
	public Gods getGods(Long id) throws DBException;
	
	public int getGodsCount() throws DBException;
	
	public int getGodsCount( int cl ) throws DBException;
	
	public int getSearchGodsCount( Gods Gods ) throws DBException;

	//public List getLeftGodsListByPage(Gods Gods,int pagesize,int curpage) throws DBException;
	//
	//public Gods getGodsBySubject(String subject) throws DBException;
	
	//���ݱ����ȡͼ��
	public Gods getGodsByName(String name) throws DBException;

	//��ҳ��ȡͼ��
	public List getGodsListByPage( int pagesize , int curpage) throws DBException;
	
	public List getGodsListByPage( int pagesize , int curpage , int cl) throws DBException;

}