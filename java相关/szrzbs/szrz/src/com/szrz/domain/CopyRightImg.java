package com.szrz.domain;

import java.io.Serializable;
import java.sql.Date;

/**
 * @Author zhangwei 
 * @Email  laketea@163.com 
 * @Time   2012-11-03 23:28:18
 */
public class CopyRightImg
	implements Serializable
{
	
	private Integer id;  //id

	private String imgName;  //图像名称

	private String oglPath;  //原始图片id

	private String path;  //新图片id
	
	private String typeName;  //新图片id

	private String typeId;  //类型Id

	private String startDate;  //开始时间

	private String endDate;  //结束时间

	private String validDate;  //有效期

	private String userId;  //用户Id

	private String userName;  //用户名

	private String userIdCard;  //用户身份证

	private String spendCoin;  //话费金币

	private String copyRightTime;  //认证时间

	private String status;  //状态


	
	
	public CopyRightImg(){
		
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

	public String getSpendCoin() {
		return spendCoin;
	}

	public void setSpendCoin(String spendCoin) {
		this.spendCoin = spendCoin;
	}

	public String getCopyRightTime() {
		return copyRightTime;
	}

	public void setCopyRightTime(String copyRightTime) {
		this.copyRightTime = copyRightTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	


	
}