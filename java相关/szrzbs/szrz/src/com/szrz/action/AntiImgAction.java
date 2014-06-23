
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.AntiImg;
import com.szrz.service.AntiImgManager;


public class AntiImgAction extends BaseAction {
	
	protected AntiImgManager mgr;
	
	public List<AntiImg> antiImgLst ;
	
	public AntiImg antiImg;
	
	public Integer id;
	
	public String ids;

	public void setAntiImgManager(AntiImgManager mgr)
	{
		this.mgr = mgr;
	}
	
	/*
	 * 防伪认证图片列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getAntiImg(),pageNum, getNumPerPage());
		List<AntiImg> ss =(List<AntiImg>)page.getList();
		setAntiImgLst(ss);
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
		mgr.add(getAntiImg());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 编辑防伪认证图片
	 */
	public String edit(){
		 antiImg = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * 修改防伪认证图片
	 */
	public String update(){
		AntiImg adm = mgr.get(getId());
		antiImg.setId(getId());
		//antiImg.setCreateDate(antiImg.getCreateDate());
		mgr.update(antiImg);
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


	public List<AntiImg> getAntiImgLst() {
		return antiImgLst;
	}
	
	


	public void setAntiImgLst(List<AntiImg> antiImgLst) {
		this.antiImgLst = antiImgLst;
	}

	public AntiImg getAntiImg() {
		return antiImg;
	}

	public void setAntiImg(AntiImg antiImg) {
		this.antiImg = antiImg;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
	
	
	
	

}
