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
public class AdminForm extends ValidatorForm {

	// --------------------------------------------------------- Instance Variables

	/** cellphoto property */
	private String name;

	/** passwd property */
	private String password;
	
	private String id;
	
	private String oldpassword;
	
	private String againpassword;
	
	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getAgainpassword() {
		return againpassword;
	}

	public void setAgainpassword(String againpassword) {
		this.againpassword = againpassword;
	}

	public String getId() {
		return id;
	}
	
	public String setId(String id) {
		return this.id=id;
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	
}

