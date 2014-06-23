package com.szrz.dao;

import java.util.List;



import com.szrz.common.hibernate.Page;
import com.szrz.domain.Admin;

public interface AdminDao {
	
	/**
	 * ���ݱ�ʶ����������adminʵ��
	 * @param id ��Ҫ���ص�adminʵ���ı�ʶ����ֵ
	 * @return ָ����ʶ���Զ�Ӧ��adminʵ��
	 */
	Admin get(Integer id);

	/**
	 * �־û�ָ����Adminʵ��
	 * @param Admin ��Ҫ���־û���Adminʵ��
	 * @return Adminʵ�����־û���ı�ʶ����ֵ
	 */
	Integer save(Admin admin);

	/**
	 * �޸�ָ����Adminʵ��
	 * @param Admin ��Ҫ���޸ĵ�Adminʵ��
	 */
	void update(Admin admin);

	/**
	 * ɾ��ָ����Adminʵ��
	 * @param application ��Ҫ��ɾ����Adminʵ��
	 */
	void delete(Admin admin);

	/**
	 * ���ݱ�ʶ����ɾ��Adminʵ��
	 * @param id ��Ҫ��ɾ����Adminʵ���ı�ʶ����ֵ
	 */
	void delete(Integer id);

	/**
	 * ��ѯȫ����Adminʵ��
	 * @return ���ݿ���ȫ����Adminʵ��
	 */
	List<Admin> findAll();

	/**
	 * ����Ա����ѯδ������춯����
	 * @param emp ��Ҫ��ѯ��Ա��
	 * @return ��Ա����Ӧ��δ������춯����
	 */ 
	List<Admin> findByNamePwd(String name,String pwd);
	
	List findByPage(int pageNo,int pageSize );
	
	

}
