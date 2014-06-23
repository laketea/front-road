/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.dao.GuestBookTypeDao;
import com.szrz.domain.GuestBookType;
import com.szrz.service.GuestBookTypeManager;


public class GuestBookTypeManagerImpl implements GuestBookTypeManager {
	
	
	private GuestBookTypeDao guestbooktypeDao;
	
	public void setGuestBookTypeDao(GuestBookTypeDao guestbooktypeDao){
		this.guestbooktypeDao = guestbooktypeDao;
	}
	
	/*
	 * 添加管
	 * 
	 */
	public void add(GuestBookType guestbooktype) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		guestbooktypeDao.save(guestbooktype);
	}

	/*
	 * 删除
	 */
	@Override
	public void delete(Integer id) {
		guestbooktypeDao.deleteByKey(id);
	}
	
	/* 
	 * 根据id获取实例
	 */
	public GuestBookType get(Integer id){
		return guestbooktypeDao.get(id);
	}

	/* 
	 * 修改
	 */
	@Override
	public void update(GuestBookType guestbooktype) {
		// TODO Auto-generated method stub
		guestbooktypeDao.update(guestbooktype);
	}



	/* 
	 * 查询所有
	 */
	public List<GuestBookType> findAll() {
		return  guestbooktypeDao.findByHql("from GuestBookType");
	}
	/*
	 * 分页查询
	 */
	public Page findByPage(GuestBookType user, int pageNo, int pageSize) {
		String hql = " from GuestBookType where 1=1 ";
		//if (user != null) {
		//	if (Utils.notNull(user.getEmail())) {
		//		hql += " and email like '%" + user.getEmail() + "%'";
		//	}
		//	if (Utils.notNull(user.getMemeberType())) {
		//		hql += " and memeberType = '" + user.getMemeberType() + "'";
		//	}
		//}
		List lst = guestbooktypeDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = guestbooktypeDao.findByHql(hql);
		int totalRecords = allLst.size();
		Page page = new Page(lst);
		page.setTotalRecords(totalRecords);
		page.setPageSize(pageSize);
		page.setCurPageNumber(pageNo);
		return page;
	}
	
	/*
	 * 批量删除
	 */
	public void batchDelete(String ids){
		guestbooktypeDao.bulkUpdate("delete from GuestBookType where id in( "+ids+" )");
	}

}
