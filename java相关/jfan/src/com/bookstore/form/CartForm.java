//Created by MyEclipse Struts
// XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.0.0/xslt/JavaClass.xsl

package com.bookstore.form;

import org.apache.struts.validator.ValidatorForm;

/** 
 * MyEclipse Struts
 * Creation date: 12-12-2005
 * 
 * XDoclet definition:
 * @struts.form name="userForm"
 */
public class CartForm extends ValidatorForm {

	// --------------------------------------------------------- Instance Variables

	/** cellphoto property */
	private String bookid;

	
	private String count;
	

	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	
	
	
	
}

