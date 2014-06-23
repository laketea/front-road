package com.bookstore.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.bookstore.dao.DAOFactory;
import com.bookstore.dao.IGuestDAO;
import com.bookstore.exception.DBException;
import com.bookstore.po.Guest;

public class GuestService {
	//static Logger log = Logger.getLogger(PlanService.class.getName());
	//��ӽ̰�
	public void addGuest(Guest Guest) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		//log.info("�����û�����->�û�����"+Guest.getGuestname());
		dao.addGuest(Guest);
	}
	
	//
	public Guest getGuestBySubject(String subject) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		return dao.getGuestBySubject(subject);
	}
	
	
	//����ID��ȡ�̰�
	public Guest getGuest(Long id) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		return dao.getGuest(id);
	}
	
	//�޸Ľ̰�
	public void UpdateGuest(Guest Guest) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		dao.updateGuest(Guest);
	}
	
	//ɾ���̰�
	public void deleteGuest(Long id) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		dao.deleteGuest(id);
	}
	
	//��ҳ��ȡ�̰�
	public List getGuestListByPage( int pagesize,int curpage)throws DBException{
		List list=null;
		IGuestDAO dao = DAOFactory.getGuestDAO();
		list=dao.getGuestListByPage(pagesize,curpage);
		return list;
	}
	
	public List getConListByPage( int pagesize,int curpage)throws DBException{
		List list=null;
		IGuestDAO dao = DAOFactory.getGuestDAO();
		list=dao.getConListByPage(pagesize,curpage);
		return list;
	}
	
	public List getFConListByPage( int pagesize,int curpage)throws DBException{
		List list=null;
		IGuestDAO dao = DAOFactory.getGuestDAO();
		list=dao.getFConListByPage(pagesize,curpage);
		return list;
	}
	
	public List getFeedListByPage( int pagesize,int curpage)throws DBException{
		List list=null;
		IGuestDAO dao = DAOFactory.getGuestDAO();
		list=dao.getFeedListByPage(pagesize,curpage);
		return list;
	}
	
	//��ȡ�̰�����
	public int getGuestCount()throws DBException{
		int count = 0;
		IGuestDAO dao = DAOFactory.getGuestDAO();
		count=dao.getGuestCount();
		return count;
	}
	
	public int getGuestCountCon()throws DBException{
		int count = 0;
		IGuestDAO dao = DAOFactory.getGuestDAO();
		count=dao.getGuestCountCon();
		return count;
	}
	
	public int getGuestFCountCon()throws DBException{
		int count = 0;
		IGuestDAO dao = DAOFactory.getGuestDAO();
		count=dao.getGuestFCountCon();
		return count;
	}
	
	public int getGuestCountFeed()throws DBException{
		int count = 0;
		IGuestDAO dao = DAOFactory.getGuestDAO();
		count=dao.getGuestCountFeed();
		return count;
	}
	
	
	
	
	
	
	
	
	
	
}	
