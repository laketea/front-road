/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.auto.common.Utils;
import com.szrz.common.hibernate.Page;
import com.szrz.dao.AntiImgDao;
import com.szrz.domain.AntiImg;
import com.szrz.service.AntiImgManager;


public class AntiImgManagerImpl implements AntiImgManager {
	
	
	private AntiImgDao antiimgDao;
	
	public void setAntiImgDao(AntiImgDao antiimgDao){
		this.antiimgDao = antiimgDao;
	}
	
	/*
	 * 添加管
	 * 
	 */
	public void add(AntiImg antiimg) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String create_date = sdf.format(c.getTime());
		antiimg.setAntiTime(create_date);
		antiimgDao.save(antiimg);
	}

	/*
	 * 删除
	 */
	@Override
	public void delete(Integer id) {
		antiimgDao.deleteByKey(id);
	}
	
	/* 
	 * 根据id获取实例
	 */
	public AntiImg get(Integer id){
		return antiimgDao.get(id);
	}

	/* 
	 * 修改
	 */
	@Override
	public void update(AntiImg antiimg) {
		// TODO Auto-generated method stub
		antiimgDao.update(antiimg);
	}



	/* 
	 * 查询所有
	 */
	public List<AntiImg> findAll() {
		return  antiimgDao.findByHql("from AntiImg");
	}
	/*
	 * 分页查询
	 */
	public Page findByPage(AntiImg user, int pageNo, int pageSize) {
		String hql = " from AntiImg where 1=1 ";
		if (user != null) {
			if (Utils.notNull(user.getImgName())) {
				hql += " and imgName like '%" + user.getImgName() + "%'";
				hql += " and userName like '%" + user.getImgName() + "%'";
				hql += " and userIdCard like '%" + user.getImgName() + "%'";
			}
			
		}
		List lst = antiimgDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = antiimgDao.findByHql(hql);
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
		antiimgDao.bulkUpdate("delete from AntiImg where id in( "+ids+" )");
	}

}
