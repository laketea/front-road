package com.szrz.dao;

import java.util.List;



import com.szrz.common.hibernate.Page;
import com.szrz.domain.Admin;

public interface AdminDao {
	
	/**
	 * 根据标识属性来加载admin实例
	 * @param id 需要加载的admin实例的标识属性值
	 * @return 指定标识属性对应的admin实例
	 */
	Admin get(Integer id);

	/**
	 * 持久化指定的Admin实例
	 * @param Admin 需要被持久化的Admin实例
	 * @return Admin实例被持久化后的标识属性值
	 */
	Integer save(Admin admin);

	/**
	 * 修改指定的Admin实例
	 * @param Admin 需要被修改的Admin实例
	 */
	void update(Admin admin);

	/**
	 * 删除指定的Admin实例
	 * @param application 需要被删除的Admin实例
	 */
	void delete(Admin admin);

	/**
	 * 根据标识属性删除Admin实例
	 * @param id 需要被删除的Admin实例的标识属性值
	 */
	void delete(Integer id);

	/**
	 * 查询全部的Admin实例
	 * @return 数据库中全部的Admin实例
	 */
	List<Admin> findAll();

	/**
	 * 根据员工查询未处理的异动申请
	 * @param emp 需要查询的员工
	 * @return 该员工对应的未处理的异动申请
	 */ 
	List<Admin> findByNamePwd(String name,String pwd);
	
	List findByPage(int pageNo,int pageSize );
	
	

}
