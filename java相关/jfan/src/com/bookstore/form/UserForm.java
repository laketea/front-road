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
public class UserForm extends ValidatorForm {

	// --------------------------------------------------------- Instance Variables

	//private String id;
	private String username;
	private String password;
	private String checkpassword;
	private String email;
	private String code;
	private String name2;
	private String password2;
	private String oicq;
	//private java.util.Date firstlogin;
	//private java.util.Date lastlogin;
	//private Long logincount;
	/*public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	*/
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCheckpassword() {
		return checkpassword;
	}
	public void setCheckpassword(String checkpassword) {
		this.checkpassword = checkpassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getOicq() {
		return oicq;
	}
	public void setOicq(String oicq) {
		this.oicq = oicq;
	}
	
	
	

	

	
}

