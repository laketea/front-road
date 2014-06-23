/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.auto.common.Utils;
import com.szrz.common.hibernate.Page;
import com.szrz.dao.GuestBookDao;
import com.szrz.domain.GuestBook;
import com.szrz.service.GuestBookManager;


public class GuestBookManagerImpl implements GuestBookManager {
	
	
	private GuestBookDao guestbookDao;
	
	public void setGuestBookDao(GuestBookDao guestbookDao){
		this.guestbookDao = guestbookDao;
	}
	
	/*
	 * ��ӹ�
	 * 
	 */
	public void add(GuestBook guestbook) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		guestbook.setGuestBookTime(create_date);
		guestbookDao.save(guestbook);
	}

	/*
	 * ɾ��
	 */
	@Override
	public void delete(Integer id) {
		guestbookDao.deleteByKey(id);
	}
	
	/* 
	 * ����id��ȡʵ��
	 */
	public GuestBook get(Integer id){
		return guestbookDao.get(id);
	}

	/* 
	 * �޸�
	 */
	@Override
	public void update(GuestBook guestbook) {
		// TODO Auto-generated method stub
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		guestbook.setReplyTime(create_date);
		guestbookDao.update(guestbook);
	}



	/* 
	 * ��ѯ����
	 */
	public List<GuestBook> findAll() {
		return  guestbookDao.findByHql("from GuestBook");
	}
	/*
	 * ��ҳ��ѯ
	 */
	public Page findByPage(GuestBook user, int pageNo, int pageSize) {
		String hql = " from GuestBook where 1=1 ";
		if (user != null) {
			if (Utils.notNull(user.getTypeId())) {
				hql += " and typeId = '" + user.getTypeId() + "'";
			}
//			if (Utils.notNull(user.getMemeberType())) {
//				hql += " and memeberType = '" + user.getMemeberType() + "'";
//			}
		}
		List lst = guestbookDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = guestbookDao.findByHql(hql);
		int totalRecords = allLst.size();
		Page page = new Page(lst);
		page.setTotalRecords(totalRecords);
		page.setPageSize(pageSize);
		page.setCurPageNumber(pageNo);
		return page;
	}
	
	public List<GuestBook> findTop(int size){
		List lst = guestbookDao.findByPageHql("from GuestBook ", 1, size);
		return lst;
	}
	
	/*
	 * ����ɾ��
	 */
	public void batchDelete(String ids){
		guestbookDao.bulkUpdate("delete from GuestBook where id in( "+ids+" )");
	}

}
