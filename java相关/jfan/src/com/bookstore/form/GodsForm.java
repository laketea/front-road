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
public class GodsForm extends ValidatorForm {

	// --------------------------------------------------------- Instance Variables
	private String id;
	private String name;
	private FormFile minphoto;
	private FormFile maxphoto;
	private FormFile maxphoto_a;
	private FormFile maxphoto_b;
	private FormFile maxphoto_c;
	private FormFile maxphoto_d;
	private String sellcount;
	private String begin_time;
	private String end_time;
	private String discript;
	private String content;
	private String oldprice;
	private String newprice;
	private String firststatus;
	private String defaultstatus;
	private String status;
	private String hourcount;
	private String types;
	private String point;
	
	
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public FormFile getMinphoto() {
		return minphoto;
	}
	public void setMinphoto(FormFile minphoto) {
		this.minphoto = minphoto;
	}
	public FormFile getMaxphoto() {
		return maxphoto;
	}
	public void setMaxphoto(FormFile maxphoto) {
		this.maxphoto = maxphoto;
	}
	public String getSellcount() {
		return sellcount;
	}
	public void setSellcount(String sellcount) {
		this.sellcount = sellcount;
	}
	public String getBegin_time() {
		return begin_time;
	}
	public void setBegin_time(String begin_time) {
		this.begin_time = begin_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getDiscript() {
		return discript;
	}
	public void setDiscript(String discript) {
		this.discript = discript;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOldprice() {
		return oldprice;
	}
	public void setOldprice(String oldprice) {
		this.oldprice = oldprice;
	}
	public String getNewprice() {
		return newprice;
	}
	public void setNewprice(String newprice) {
		this.newprice = newprice;
	}
	public String getFirststatus() {
		return firststatus;
	}
	public void setFirststatus(String firststatus) {
		this.firststatus = firststatus;
	}
	public String getDefaultstatus() {
		return defaultstatus;
	}
	public void setDefaultstatus(String defaultstatus) {
		this.defaultstatus = defaultstatus;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getHourcount() {
		return hourcount;
	}
	public void setHourcount(String hourcount) {
		this.hourcount = hourcount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public FormFile getMaxphoto_a() {
		return maxphoto_a;
	}
	public void setMaxphoto_a(FormFile maxphoto_a) {
		this.maxphoto_a = maxphoto_a;
	}
	public FormFile getMaxphoto_b() {
		return maxphoto_b;
	}
	public void setMaxphoto_b(FormFile maxphoto_b) {
		this.maxphoto_b = maxphoto_b;
	}
	public FormFile getMaxphoto_c() {
		return maxphoto_c;
	}
	public void setMaxphoto_c(FormFile maxphoto_c) {
		this.maxphoto_c = maxphoto_c;
	}
	public FormFile getMaxphoto_d() {
		return maxphoto_d;
	}
	public void setMaxphoto_d(FormFile maxphoto_d) {
		this.maxphoto_d = maxphoto_d;
	}
	
	
}

