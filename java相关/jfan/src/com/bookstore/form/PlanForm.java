//Created by MyEclipse Struts
// XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.0.0/xslt/JavaClass.xsl

package com.bookstore.form;
import org.apache.struts.upload.FormFile;
import org.apache.struts.validator.ValidatorForm;

/** 
 * MyEclipse Struts
 * Creation date: 12-12-2005
 * 
 * XDoclet definition:
 * @struts.form name="userForm"
 */
public class PlanForm extends ValidatorForm {

	// --------------------------------------------------------- Instance Variables
	private String id;
	private String title;
	private String content;
	private String source;
	private String author;
	private String version;
	private String grade;
	private String downup;
	private FormFile fileaddress;
	private String subject;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getDownup() {
		return downup;
	}
	public void setDownup(String downup) {
		this.downup = downup;
	}
	public FormFile getFileaddress() {
		return fileaddress;
	}
	public void setFileaddress(FormFile fileaddress) {
		this.fileaddress = fileaddress;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	


	

	
}

