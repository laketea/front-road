/**
 * 
 */ 
package com.szrz.common.hibernate; 

import java.util.List;

/** 
 * @author zhangwei laketea@163.com
 * @version 2012-10-16
 * 
 */
public class Page {
	
	
	
	private int curPageNumber ;
	
	private int pageSize;
	
	private int pageCount ;
	
	private int totalRecords;
	
	private List list;
	
	public Page (List list){
		this.list = list;
	}
	
	

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getCurPageNumber() {
		return curPageNumber;
	}

	public void setCurPageNumber(int curPageNumber) {
		this.curPageNumber = curPageNumber;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		if(this.pageCount==0&&this.totalRecords!=0&&pageSize!=0){
			pageCount =totalRecords/pageSize+totalRecords%pageSize==0?0:1;
		}
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	} 
	
	
	
	

}
