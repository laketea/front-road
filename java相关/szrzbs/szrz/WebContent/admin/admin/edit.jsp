<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/admin!update.action?navTabId=adminList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${admin.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
	
		<p>
			<label>用户名：</label>
			<input type="text" name="admin.name" class="required" size="10" minlength="6" maxlength="20" value="${admin.name}"/>
		</p>
		
		<p>
			<label>密码</label>
			<input type="text" name="admin.pwd" class="required" size="30" value="${admin.name}"/>
		</p>
		<p>
			<label>超级管理员</label>
			<select name="admin.supers">	
				<option value="1">是</option>
				<option value="0">否</option>
			</select>
		</p>
		
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>