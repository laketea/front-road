
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.GuestBook;
import com.szrz.domain.GuestBookType;
import com.szrz.service.GuestBookManager;
import com.szrz.service.GuestBookTypeManager;


public class GuestBookAction extends BaseAction {
	
	protected GuestBookManager mgr;
	
	protected GuestBookTypeManager tmgr;
	
	public List<GuestBook> guestBookLst ;
	
	private List<GuestBookType> guestBookTypeLst;
	
	public GuestBook guestBook;
	
	public Integer id;
	
	public String ids;

	public void setGuestBookManager(GuestBookManager mgr)
	{
		this.mgr = mgr;
	}
	
	public void setGuestBookTypeManager(GuestBookTypeManager mgr)
	{
		this.tmgr = mgr;
	}
	
	/*
	 * 留言列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getGuestBook(),pageNum, getNumPerPage());
		List<GuestBook> ss =(List<GuestBook>)page.getList();
		setGuestBookLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * 删除留言
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 添加留言
	 */
	public String save(){
		mgr.add(getGuestBook());
		return ajaxForwardSuccess("操作成功!");
	}
	
	public String add(){
		guestBookTypeLst =tmgr.findAll();
		return "add";
		
	}
	
	/*
	 * 编辑留言
	 */
	public String edit(){
		 guestBook = mgr.get(getId());	
		 guestBookTypeLst =tmgr.findAll();
		return "edit";
	}
	
	/*
	 * 修改留言
	 */
	public String update(){
		GuestBook adm = mgr.get(getId());
		guestBook.setId(getId());
		adm.setReplyContent(guestBook.getReplyContent());
		//guestBook.setCreateDate(guestBook.getCreateDate());
		mgr.update(guestBook);
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


	public List<GuestBook> getGuestBookLst() {
		return guestBookLst;
	}
	
	


	public void setGuestBookLst(List<GuestBook> guestBookLst) {
		this.guestBookLst = guestBookLst;
	}

	public GuestBook getGuestBook() {
		return guestBook;
	}

	public void setGuestBook(GuestBook guestBook) {
		this.guestBook = guestBook;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public List<GuestBookType> getGuestBookTypeLst() {
		return guestBookTypeLst;
	}

	public void setGuestBookTypeLst(List<GuestBookType> guestBookTypeLst) {
		this.guestBookTypeLst = guestBookTypeLst;
	}
	
	public void setNumPerPage(String num) {
		if(num!=null&&!"".equals(num)){
			this.setNumPerPage(Integer.valueOf(num));
		}
	}
	
	
	
	
	
	
	
	
	
	

}
