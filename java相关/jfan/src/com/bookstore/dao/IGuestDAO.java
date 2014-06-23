package com.bookstore.dao;

import java.util.List;

import net.sf.hibernate.HibernateException;
import com.bookstore.exception.DBException;
import com.bookstore.po.Guest;

public interface IGuestDAO {
	
	//��ӽ̰�
	public void addGuest(Guest guest) throws DBException;
	
	//�޸Ľ̰�
	public void updateGuest(Guest guest) throws DBException;

	//ɾ���̰�
	public void deleteGuest(Long id) throws DBException;
	
	
	//��ȡ�̰�����
	public int getGuestCount() throws DBException;
	
	public int getGuestCountCon() throws DBException;
	
	public int getGuestFCountCon() throws DBException;

	public int getGuestCountFeed() throws DBException;
	
	public List getConListByPage(int pagesize,int curpage) throws DBException;
	
	public List getFConListByPage(int pagesize,int curpage) throws DBException;
	public List getFeedListByPage(int pagesize,int curpage) throws DBException;
	
	public int getGCount(String grade) throws DBException;
	
	//����ID��ȡ�̰�
	public Guest getGuest(Long id) throws DBException;

	//
	public Guest getGuestBySubject(String subject) throws DBException;
	
	//���ݱ����ȡ�̰�
	public Guest getGuestByTitle(String title) throws DBException;

	//��ҳ��ȡ�̰�
	public List getGuestListByPage( int pagesize , int curpage) throws DBException;

}