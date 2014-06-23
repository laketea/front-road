/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.szrz.common.hibernate.Page;
import com.szrz.dao.ImgTypeDao;
import com.szrz.domain.ImgType;
import com.szrz.service.ImgTypeManager;


public class ImgTypeManagerImpl implements ImgTypeManager {
	
	
	private ImgTypeDao imgtypeDao;
	
	public void setImgTypeDao(ImgTypeDao imgtypeDao){
		this.imgtypeDao = imgtypeDao;
	}
	
	/*
	 * 添加管
	 * 
	 */
	public void add(ImgType imgtype) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
		String create_date = sdf.format(c.getTime());
		imgtypeDao.save(imgtype);
	}

	/*
	 * 删除
	 */
	@Override
	public void delete(Integer id) {
		imgtypeDao.deleteByKey(id);
	}
	
	/* 
	 * 根据id获取实例
	 */
	public ImgType get(Integer id){
		return imgtypeDao.get(id);
	}

	/* 
	 * 修改
	 */
	@Override
	public void update(ImgType imgtype) {
		// TODO Auto-generated method stub
		imgtypeDao.update(imgtype);
	}



	/* 
	 * 查询所有
	 */
	public List<ImgType> findAll() {
		return  imgtypeDao.findByHql("from ImgType");
	}
	/*
	 * 分页查询
	 */
	public Page findByPage(ImgType user, int pageNo, int pageSize) {
		String hql = " from ImgType where 1=1 ";
		//if (user != null) {
		//	if (Utils.notNull(user.getEmail())) {
		//		hql += " and email like '%" + user.getEmail() + "%'";
		//	}
		//	if (Utils.notNull(user.getMemeberType())) {
		//		hql += " and memeberType = '" + user.getMemeberType() + "'";
		//	}
		//}
		List lst = imgtypeDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = imgtypeDao.findByHql(hql);
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
		imgtypeDao.bulkUpdate("delete from ImgType where id in( "+ids+" )");
	}

}
