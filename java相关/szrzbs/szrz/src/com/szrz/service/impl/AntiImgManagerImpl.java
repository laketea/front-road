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
	 * ��ӹ�
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
	 * ɾ��
	 */
	@Override
	public void delete(Integer id) {
		antiimgDao.deleteByKey(id);
	}
	
	/* 
	 * ����id��ȡʵ��
	 */
	public AntiImg get(Integer id){
		return antiimgDao.get(id);
	}

	/* 
	 * �޸�
	 */
	@Override
	public void update(AntiImg antiimg) {
		// TODO Auto-generated method stub
		antiimgDao.update(antiimg);
	}



	/* 
	 * ��ѯ����
	 */
	public List<AntiImg> findAll() {
		return  antiimgDao.findByHql("from AntiImg");
	}
	/*
	 * ��ҳ��ѯ
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
	 * ����ɾ��
	 */
	public void batchDelete(String ids){
		antiimgDao.bulkUpdate("delete from AntiImg where id in( "+ids+" )");
	}

}
