/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.auto.common.Utils;
import com.szrz.common.hibernate.Page;
import com.szrz.dao.CopyRightImgDao;
import com.szrz.domain.CopyRightImg;
import com.szrz.service.CopyRightImgManager;


public class CopyRightImgManagerImpl implements CopyRightImgManager {
	
	
	private CopyRightImgDao copyrightimgDao;
	
	public void setCopyRightImgDao(CopyRightImgDao copyrightimgDao){
		this.copyrightimgDao = copyrightimgDao;
	}
	
	/*
	 * 添加管
	 * 
	 */
	public void add(CopyRightImg copyrightimg) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		copyrightimg.setCopyRightTime(create_date);
		copyrightimgDao.save(copyrightimg);
	}

	/*
	 * 删除
	 */
	@Override
	public void delete(Integer id) {
		copyrightimgDao.deleteByKey(id);
	}
	
	/* 
	 * 根据id获取实例
	 */
	public CopyRightImg get(Integer id){
		return copyrightimgDao.get(id);
	}

	/* 
	 * 修改
	 */
	@Override
	public void update(CopyRightImg copyrightimg) {
		// TODO Auto-generated method stub
		copyrightimgDao.update(copyrightimg);
	}



	/* 
	 * 查询所有
	 */
	public List<CopyRightImg> findAll() {
		return  copyrightimgDao.findByHql("from CopyRightImg");
	}
	/*
	 * 分页查询
	 */
	public Page findByPage(CopyRightImg user, int pageNo, int pageSize) {
		String hql = " from CopyRightImg where 1=1 ";
		if (user != null) {
			if (Utils.notNull(user.getImgName())) {
				hql += " and imgName like '%" + user.getImgName() + "%'";
				hql += " and userName like '%" + user.getImgName() + "%'";
				hql += " and userIdCard like '%" + user.getImgName() + "%'";
			}
			
		}
		List lst = copyrightimgDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = copyrightimgDao.findByHql(hql);
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
		copyrightimgDao.bulkUpdate("delete from CopyRightImg where id in( "+ids+" )");
	}

}
