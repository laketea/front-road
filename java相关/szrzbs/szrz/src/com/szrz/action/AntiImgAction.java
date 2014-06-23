
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
	 * ��α��֤ͼƬ�б�
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
		mgr.add(getAntiImg());
		return ajaxForwardSuccess("�����ɹ�!");
	}
	
	/*
	 * �༭��α��֤ͼƬ
	 */
	public String edit(){
		 antiImg = mgr.get(getId());	
		return "edit";
	}
	
	/*
	 * �޸ķ�α��֤ͼƬ
	 */
	public String update(){
		AntiImg adm = mgr.get(getId());
		antiImg.setId(getId());
		//antiImg.setCreateDate(antiImg.getCreateDate());
		mgr.update(antiImg);
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
