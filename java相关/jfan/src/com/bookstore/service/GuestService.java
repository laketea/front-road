package com.bookstore.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.bookstore.dao.DAOFactory;
import com.bookstore.dao.IGuestDAO;
import com.bookstore.exception.DBException;
import com.bookstore.po.Guest;

public class GuestService {
	//static Logger log = Logger.getLogger(PlanService.class.getName());
	//添加教案
	public void addGuest(Guest Guest) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		//log.info("保存用户对象->用户名："+Guest.getGuestname());
		dao.addGuest(Guest);
	}
	
	//
	public Guest getGuestBySubject(String subject) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		return dao.getGuestBySubject(subject);
	}
	
	
	//根据ID获取教案
	public Guest getGuest(Long id) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		return dao.getGuest(id);
	}
	
	//修改教案
	public void UpdateGuest(Guest Guest) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		dao.updateGuest(Guest);
	}
	
	//删除教案
	public void deleteGuest(Long id) throws DBException {
		IGuestDAO dao = DAOFactory.getGuestDAO();
		dao.deleteGuest(id);
	}
	
	//分页获取教案
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
	
	//获取教案总数
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
