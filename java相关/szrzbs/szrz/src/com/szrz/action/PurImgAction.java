
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.PurImg;
import com.szrz.service.PurImgManager;


public class PurImgAction extends BaseAction {
	
	protected PurImgManager mgr;
	
	public List<PurImg> purImgLst ;
	
	public PurImg purImg;
	
	public Integer id;
	
	public String ids;

	public void setPurImgManager(PurImgManager mgr)
	{
		this.mgr = mgr;
	}
	
	/*
	 * 防伪认证图片列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getPurImg(),pageNum, getNumPerPage());
		List<PurImg> ss =(List<PurImg>)page.getList();
		setPurImgLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * 删除防伪认证图片
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 添加防伪认证图片
	 */
	public String add(){
		mgr.add(getPurImg());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 编辑防伪认证图片
	 */
	public String edit(){
		 purImg = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * 修改防伪认证图片
	 */
	public String update(){
		PurImg adm = mgr.get(getId());
		purImg.setId(getId());
		//purImg.setCreateDate(purImg.getCreateDate());
		mgr.update(purImg);
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


	public List<PurImg> getPurImgLst() {
		return purImgLst;
	}
	
	


	public void setPurImgLst(List<PurImg> purImgLst) {
		this.purImgLst = purImgLst;
	}

	public PurImg getPurImg() {
		return purImg;
	}

	public void setPurImg(PurImg purImg) {
		this.purImg = purImg;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
	
	
	
	

}
