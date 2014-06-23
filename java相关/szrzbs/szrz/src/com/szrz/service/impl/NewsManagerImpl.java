/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.auto.common.Utils;
import com.szrz.common.hibernate.Page;
import com.szrz.dao.NewsDao;
import com.szrz.domain.News;
import com.szrz.service.NewsManager;


public class NewsManagerImpl implements NewsManager {
	
	
	private NewsDao newsDao;
	
	public void setNewsDao(NewsDao newsDao){
		this.newsDao = newsDao;
	}
	
	/*
	 * 添加管
	 * 
	 */
	public void add(News news) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		news.setPublishTime(create_date);
		newsDao.save(news);
	}

	/*
	 * 删除
	 */
	@Override
	public void delete(Integer id) {
		newsDao.deleteByKey(id);
	}
	
	/* 
	 * 根据id获取实例
	 */
	public News get(Integer id){
		return newsDao.get(id);
	}

	/* 
	 * 修改
	 */
	@Override
	public void update(News news) {
		// TODO Auto-generated method stub
		newsDao.update(news);
	}



	/* 
	 * 查询所有
	 */
	public List<News> findAll() {
		return  newsDao.findByHql("from News");
	}
	/*
	 * 分页查询
	 */
	public Page findByPage(News user, int pageNo, int pageSize) {
		String hql = " from News where 1=1 ";
		if (user != null) {
			if (Utils.notNull(user.getTypeId())) {
				hql += " and typeId = '" + user.getTypeId() + "'";
				
			}
			
		}
		List lst = newsDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = newsDao.findByHql(hql);
		int totalRecords = allLst.size();
		Page page = new Page(lst);
		page.setTotalRecords(totalRecords);
		page.setPageSize(pageSize);
		page.setCurPageNumber(pageNo);
		return page;
	}
	
	public List<News> findTop(String type,int size){
		List lst = newsDao.findByPageHql("from News where typeId='"+type+"'", 1, size);
		
		return lst==null?(new ArrayList<News>()):lst;	
	}
	
	/*
	 * 批量删除
	 */
	public void batchDelete(String ids){
		newsDao.bulkUpdate("delete from News where id in( "+ids+" )");
	}

}
