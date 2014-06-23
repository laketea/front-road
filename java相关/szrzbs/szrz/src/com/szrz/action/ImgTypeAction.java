
package com.szrz.action; 

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.szrz.common.hibernate.Page;
import com.szrz.domain.ImgType;
import com.szrz.service.ImgTypeManager;


public class ImgTypeAction extends BaseAction {
	
	protected ImgTypeManager mgr;
	
	public List<ImgType> imgTypeLst ;
	
	public ImgType imgType;
	
	public Integer id;
	
	public String ids;

	public void setImgTypeManager(ImgTypeManager mgr)
	{
		this.mgr = mgr;
	}
	
	/*
	 * 图片类型列表
	 */
	public String list(){
		int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
		Page page = mgr.findByPage(getImgType(),pageNum, getNumPerPage());
		List<ImgType> ss =(List<ImgType>)page.getList();
		setImgTypeLst(ss);
		this.setTotalCount(page.getTotalRecords());
		return "list";
	}
	
	/*
	 * 删除图片类型
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 添加图片类型
	 */
	public String add(){
		mgr.add(getImgType());
		return ajaxForwardSuccess("操作成功!");
	}
	
	/*
	 * 编辑图片类型
	 */
	public String edit(){
		 imgType = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * 修改图片类型
	 */
	public String update(){
		ImgType adm = mgr.get(getId());
		imgType.setId(getId());
		//imgType.setCreateDate(imgType.getCreateDate());
		mgr.update(imgType);
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


	public List<ImgType> getImgTypeLst() {
		return imgTypeLst;
	}
	
	


	public void setImgTypeLst(List<ImgType> imgTypeLst) {
		this.imgTypeLst = imgTypeLst;
	}

	public ImgType getImgType() {
		return imgType;
	}

	public void setImgType(ImgType imgType) {
		this.imgType = imgType;
	}
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
	
	
	
	
	

}
