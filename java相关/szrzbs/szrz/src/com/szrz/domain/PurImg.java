package com.szrz.domain;

import java.io.Serializable;
import java.sql.Date;

/**
 * @Author zhangwei 
 * @Email  laketea@163.com 
 * @Time   2012-11-04 00:09:42
 */
public class PurImg
	implements Serializable
{
	
	private Integer id;  //id

	private String imgName;  //ͼ������

	private String oglPath;  //ԭʼͼƬid

	private String path;  //��ͼƬid

	private String typeId;  //����Id

	private String typeName;  //��������

	private String purUserId;  //������Id

	private String purUserName;  //������names

	private String purUserIdCard;  //�������û����֤

	private String purTime;  //�������û����֤

	private String imgId;  //ͼƬid

	private Integer valueCoin;  //�ۼ�

	private String antiTime;  //��֤ʱ��

	private String startDate;  //��ʼʱ��

	private String endDate;  //����ʱ��

	private String validDate;  //��Ч��

	private String shootPlace;  //����ص�

	private String shootTime;  //����ʱ��

	private String userId;  //�û�Id

	private String userName;  //�û���

	private String userIdCard;  //�û����֤

	private String status;  //״̬


	public PurImg(){
		
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getOglPath() {
		return oglPath;
	}

	public void setOglPath(String oglPath) {
		this.oglPath = oglPath;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getPurUserId() {
		return purUserId;
	}

	public void setPurUserId(String purUserId) {
		this.purUserId = purUserId;
	}

	public String getPurUserName() {
		return purUserName;
	}

	public void setPurUserName(String purUserName) {
		this.purUserName = purUserName;
	}

	public String getPurUserIdCard() {
		return purUserIdCard;
	}

	public void setPurUserIdCard(String purUserIdCard) {
		this.purUserIdCard = purUserIdCard;
	}

	public String getPurTime() {
		return purTime;
	}

	public void setPurTime(String purTime) {
		this.purTime = purTime;
	}

	public String getImgId() {
		return imgId;
	}

	public void setImgId(String imgId) {
		this.imgId = imgId;
	}

	public Integer getValueCoin() {
		return valueCoin;
	}

	public void setValueCoin(Integer valueCoin) {
		this.valueCoin = valueCoin;
	}

	public String getAntiTime() {
		return antiTime;
	}

	public void setAntiTime(String antiTime) {
		this.antiTime = antiTime;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getValidDate() {
		return validDate;
	}

	public void setValidDate(String validDate) {
		this.validDate = validDate;
	}

	public String getShootPlace() {
		return shootPlace;
	}

	public void setShootPlace(String shootPlace) {
		this.shootPlace = shootPlace;
	}

	public String getShootTime() {
		return shootTime;
	}

	public void setShootTime(String shootTime) {
		this.shootTime = shootTime;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserIdCard() {
		return userIdCard;
	}

	public void setUserIdCard(String userIdCard) {
		this.userIdCard = userIdCard;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	
}