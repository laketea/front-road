/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.auto.common.Utils;
import com.szrz.common.hibernate.Page;
import com.szrz.dao.PurImgDao;
import com.szrz.domain.PurImg;
import com.szrz.service.PurImgManager;


public class PurImgManagerImpl implements PurImgManager {
	
	
	private PurImgDao purimgDao;
	
	public void setPurImgDao(PurImgDao purimgDao){
		this.purimgDao = purimgDao;
	}
	
	/*
	 * 添加管
	 * 
	 */
	public void add(PurImg purimg) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		purimg.setPurTime(create_date);
		purimgDao.save(purimg);
	}

	/*
	 * 删除
	 */
	@Override
	public void delete(Integer id) {
		purimgDao.deleteByKey(id);
	}
	
	/* 
	 * 根据id获取实例
	 */
	public PurImg get(Integer id){
		return purimgDao.get(id);
	}

	/* 
	 * 修改
	 */
	@Override
	public void update(PurImg purimg) {
		// TODO Auto-generated method stub
		purimgDao.update(purimg);
	}



	/* 
	 * 查询所有
	 */
	public List<PurImg> findAll() {
		return  purimgDao.findByHql("from PurImg");
	}
	/*
	 * 分页查询
	 */
	public Page findByPage(PurImg user, int pageNo, int pageSize) {
		String hql = " from PurImg where 1=1 ";
		if (user != null) {
			if (Utils.notNull(user.getImgName())) {
				hql += " and imgName like '%" + user.getImgName() + "%'";
				hql += " and userName like '%" + user.getImgName() + "%'";
				hql += " and userIdCard like '%" + user.getImgName() + "%'";
			}
			
		}
		List lst = purimgDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = purimgDao.findByHql(hql);
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
		purimgDao.bulkUpdate("delete from PurImg where id in( "+ids+" )");
	}

}
