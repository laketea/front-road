
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.CopyRightImg;
import com.szrz.service.CopyRightImgManager;


public class CopyRightImgAction extends BaseAction {
	
	protected CopyRightImgManager mgr;
	
	public List<CopyRightImg> copyRightImgLst ;
	
	public CopyRightImg copyRightImg;
	
	public Integer id;
	
	public String ids;

	public void setCopyRightImgManager(CopyRightImgManager mgr)
	{
		this.mgr = mgr;
	}
	
	/*
	 * 版权保护图片列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getCopyRightImg(),pageNum, getNumPerPage());
		List<CopyRightImg> ss =(List<CopyRightImg>)page.getList();
		setCopyRightImgLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * 删除版权保护图片
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 添加版权保护图片
	 */
	public String add(){
		mgr.add(getCopyRightImg());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 编辑版权保护图片
	 */
	public String edit(){
		 copyRightImg = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * 修改版权保护图片
	 */
	public String update(){
		CopyRightImg adm = mgr.get(getId());
		copyRightImg.setId(getId());
		mgr.update(copyRightImg);
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


	public List<CopyRightImg> getCopyRightImgLst() {
		return copyRightImgLst;
	}
	
	


	public void setCopyRightImgLst(List<CopyRightImg> copyRightImgLst) {
		this.copyRightImgLst = copyRightImgLst;
	}

	public CopyRightImg getCopyRightImg() {
		return copyRightImg;
	}

	public void setCopyRightImg(CopyRightImg copyRightImg) {
		this.copyRightImg = copyRightImg;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
	
	
	
	

}
