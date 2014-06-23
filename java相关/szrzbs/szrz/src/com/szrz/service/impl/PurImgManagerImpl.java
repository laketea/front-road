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
	 * ��ӹ�
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
	 * ɾ��
	 */
	@Override
	public void delete(Integer id) {
		purimgDao.deleteByKey(id);
	}
	
	/* 
	 * ����id��ȡʵ��
	 */
	public PurImg get(Integer id){
		return purimgDao.get(id);
	}

	/* 
	 * �޸�
	 */
	@Override
	public void update(PurImg purimg) {
		// TODO Auto-generated method stub
		purimgDao.update(purimg);
	}



	/* 
	 * ��ѯ����
	 */
	public List<PurImg> findAll() {
		return  purimgDao.findByHql("from PurImg");
	}
	/*
	 * ��ҳ��ѯ
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
	 * ����ɾ��
	 */
	public void batchDelete(String ids){
		purimgDao.bulkUpdate("delete from PurImg where id in( "+ids+" )");
	}

}
