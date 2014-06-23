
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
	 * ͼƬ�����б�
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
	 * ɾ��ͼƬ����
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	/*
	 * ���ͼƬ����
	 */
	public String add(){
		mgr.add(getImgType());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	/*
	 * �༭ͼƬ����
	 */
	public String edit(){
		 imgType = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * �޸�ͼƬ����
	 */
	public String update(){
		ImgType adm = mgr.get(getId());
		imgType.setId(getId());
		//imgType.setCreateDate(imgType.getCreateDate());
		mgr.update(imgType);
		return ajaxForwardSuccess("�޸ĳɹ�!");
	}
	
	/*
	 * ����ɾ��
	 */
	public String batch(){
		 mgr.batchDelete(ids);	
		return ajaxForwardSuccess("�����ɹ�!");
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
