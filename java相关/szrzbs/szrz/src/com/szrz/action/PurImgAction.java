
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
	 * ��α��֤ͼƬ�б�
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
	 * ɾ����α��֤ͼƬ
	 */
	public String delete(){
		mgr.delete(getId());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	/*
	 * ��ӷ�α��֤ͼƬ
	 */
	public String add(){
		mgr.add(getPurImg());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	/*
	 * �༭��α��֤ͼƬ
	 */
	public String edit(){
		 purImg = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * �޸ķ�α��֤ͼƬ
	 */
	public String update(){
		PurImg adm = mgr.get(getId());
		purImg.setId(getId());
		//purImg.setCreateDate(purImg.getCreateDate());
		mgr.update(purImg);
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
