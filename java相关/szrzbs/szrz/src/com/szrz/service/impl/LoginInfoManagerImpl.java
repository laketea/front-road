/**
 * 
 */ 
package com.szrz.service.impl; 

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.auto.common.Utils;
import com.szrz.common.hibernate.Page;
import com.szrz.dao.LoginInfoDao;
import com.szrz.domain.LoginInfo;
import com.szrz.service.LoginInfoManager;


public class LoginInfoManagerImpl implements LoginInfoManager {
	
	
	private LoginInfoDao logininfoDao;
	
	public void setLoginInfoDao(LoginInfoDao logininfoDao){
		this.logininfoDao = logininfoDao;
	}
	
	/*
	 * ��ӹ�
	 * 
	 */
	public void add(LoginInfo logininfo) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new  SimpleDateFormat("yyyy-MM-dd");
//		String create_date = sdf.format(c.getTime());
//		logininfo.setCreateDate(create_date);
		logininfoDao.save(logininfo);
	}

	/*
	 * ɾ��
	 */
	@Override
	public void delete(Integer id) {
		logininfoDao.deleteByKey(id);
	}
	
	/* 
	 * ����id��ȡʵ��
	 */
	public LoginInfo get(Integer id){
		return logininfoDao.get(id);
	}

	/* 
	 * �޸�
	 */
	@Override
	public void update(LoginInfo logininfo) {
		// TODO Auto-generated method stub
		logininfoDao.update(logininfo);
	}



	/* 
	 * ��ѯ����
	 */
	public List<LoginInfo> findAll() {
		return  logininfoDao.findByHql("from LoginInfo");
	}
	/*
	 * ��ҳ��ѯ
	 */
	public Page findByPage(LoginInfo user, int pageNo, int pageSize) {
		String hql = " from LoginInfo where 1=1 ";
		if (user != null) {
			if (Utils.notNull(user.getNick())) {
				hql += " and ( nick like '%" + user.getNick() + "%' or email like '%"+user.getNick()+"%' or phone like '%"+user.getNick()+"%' )";
			}
		}
		List lst = logininfoDao.findByPageHql(hql, pageNo, pageSize);
		List allLst = logininfoDao.findByHql(hql);
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
		logininfoDao.bulkUpdate("delete from LoginInfo where id in( "+ids+" )");
	}

}
