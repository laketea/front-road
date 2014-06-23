/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.dao.NewsTypeDao;
import com.szrz.domain.NewsType;
import com.szrz.service.NewsTypeManager;


public class NewsTypeManagerImpl implements NewsTypeManager {
	
	
	private NewsTypeDao newstypeDao;
	
	public void setNewsTypeDao(NewsTypeDao newstypeDao){
		this.newstypeDao = newstypeDao;
	}
	
	/*
	 * ��ӹ�
	 * 
	 */
	public void add(NewsType newstype) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		newstypeDao.save(newstype);
	}

	/*
	 * ɾ��
	 */
	@Override
	public void delete(Integer id) {
		newstypeDao.deleteByKey(id);
	}
	
	/* 
	 * ����id��ȡʵ��
	 */
	public NewsType get(Integer id){
		return newstypeDao.get(id);
	}

	/* 
	 * �޸�
	 */
	@Override
	public void update(NewsType newstype) {
		// TODO Auto-generated method stub
		newstypeDao.update(newstype);
	}



	/* 
	 * ��ѯ����
	 */
	public List<NewsType> findAll() {
		return  newstypeDao.findByHql("from NewsType");
	}
	/*
	 * ��ҳ��ѯ
	 */
	public Page findByPage(NewsType user, int pageNo, int pageSize) {
		String hql = " from NewsType where 1=1 ";
		//if (user != null) {
		//	if (Utils.notNull(user.getEmail())) {
		//		hql += " and email like '%" + user.getEmail() + "%'";
		//	}
		//	if (Utils.notNull(user.getMemeberType())) {
		//		hql += " and memeberType = '" + user.getMemeberType() + "'";
		//	}
		//}
		List lst = newstypeDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = newstypeDao.findByHql(hql);
		int totalRecords = allLst.size();
		Page page = new Page(lst);
		page.setTotalRecords(totalRecords);
		page.setPageSize(pageSize);
		page.setCurPageNumber(pageNo);
		return page;
	}
	
	/*
	 * ����ɾ��
	 */
	public void batchDelete(String ids){
		newstypeDao.bulkUpdate("delete from NewsType where id in( "+ids+" )");
	}

}
