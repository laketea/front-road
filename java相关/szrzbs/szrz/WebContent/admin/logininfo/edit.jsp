<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/loginInfo!update.action?navTabId=loginInfoList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${loginInfo.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>�û�id��</label>
			<input type="text" name="loginInfo.userId" value="${loginInfo.userId}" class="required" size="30" />
		</p>
		<p>
			<label>�û����ƣ�</label>
			<input type="text" name="loginInfo.nick" value="${loginInfo.nick}" class="required" size="30" />
		</p>
		<p>
			<label>���䣺</label>
			<input type="text" name="loginInfo.email" value="${loginInfo.email}" class="required" size="30" />
		</p>
		<p>
			<label>�绰��</label>
			<input type="text" name="loginInfo.phone" value="${loginInfo.phone}" class="required" size="30" />
		</p>
		<p>
			<label>���룺</label>
			<input type="text" name="loginInfo.password" value="${loginInfo.password}" class="required" size="30" />
		</p>
		<p>
			<label>�����¼��</label>
			<input type="text" name="loginInfo.lastLogin" value="${loginInfo.lastLogin}" class="required" size="30" />
		</p>
		<p>
			<label>��¼������</label>
			<input type="text" name="loginInfo.loginCount" value="${loginInfo.loginCount}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�޸�</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>