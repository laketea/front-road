
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.GuestBookType;
import com.szrz.service.GuestBookTypeManager;


public class GuestBookTypeAction extends BaseAction {
	
	protected GuestBookTypeManager mgr;
	
	public List<GuestBookType> guestBookTypeLst ;
	
	public GuestBookType guestBookType;
	
	public Integer id;
	
	public String ids;

	public void setGuestBookTypeManager(GuestBookTypeManager mgr)
	{
		this.mgr = mgr;
	}
	
	/*
	 * 留言类型列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getGuestBookType(),pageNum, getNumPerPage());
		List<GuestBookType> ss =(List<GuestBookType>)page.getList();
		setGuestBookTypeLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * 删除留言类型
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 添加留言类型
	 */
	public String add(){
		mgr.add(getGuestBookType());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 编辑留言类型
	 */
	public String edit(){
		 guestBookType = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * 修改留言类型
	 */
	public String update(){
		GuestBookType adm = mgr.get(getId());
		guestBookType.setId(getId());
		//guestBookType.setCreateDate(guestBookType.getCreateDate());
		mgr.update(guestBookType);
		return ajaxForwardSuccess("修改成功!");
	}
	
	/*
	 * 批量删除
	 */
	public String batch(){
		 mgr.batchDelete(ids);	
		return ajaxForwardSuccess("操作成功!");
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public List<GuestBookType> getGuestBookTypeLst() {
		return guestBookTypeLst;
	}
	
	


	public void setGuestBookTypeLst(List<GuestBookType> guestBookTypeLst) {
		this.guestBookTypeLst = guestBookTypeLst;
	}

	public GuestBookType getGuestBookType() {
		return guestBookType;
	}

	public void setGuestBookType(GuestBookType guestBookType) {
		this.guestBookType = guestBookType;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
	
	
	
	

}
