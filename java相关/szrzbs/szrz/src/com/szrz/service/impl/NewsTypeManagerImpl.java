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
	 * 添加管
	 * 
	 */
	public void add(NewsType newstype) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		newstypeDao.save(newstype);
	}

	/*
	 * 删除
	 */
	@Override
	public void delete(Integer id) {
		newstypeDao.deleteByKey(id);
	}
	
	/* 
	 * 根据id获取实例
	 */
	public NewsType get(Integer id){
		return newstypeDao.get(id);
	}

	/* 
	 * 修改
	 */
	@Override
	public void update(NewsType newstype) {
		// TODO Auto-generated method stub
		newstypeDao.update(newstype);
	}



	/* 
	 * 查询所有
	 */
	public List<NewsType> findAll() {
		return  newstypeDao.findByHql("from NewsType");
	}
	/*
	 * 分页查询
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
	 * 批量删除
	 */
	public void batchDelete(String ids){
		newstypeDao.bulkUpdate("delete from NewsType where id in( "+ids+" )");
	}

}
