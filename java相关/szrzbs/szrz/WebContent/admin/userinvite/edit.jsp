<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/sns/admin/userInvite!update.action?navTabId=userInviteList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${userInvite.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>���䣺</label>
			<input type="text" name="userInvite.email" value="${userInvite.email}" class="required email" size="30" />
		</p>
		<p>
			<label>��֤�룺</label>
			<input type="text" name="userInvite.code" value="${userInvite.code}" class="required" size="30" />
		</p>
		<p>
			<label>��Ա���ͣ�</label>
			<input type="text" name="userInvite.memeberType" value="${userInvite.memeberType}" class="required" size="30" />
		</p>
		<p>
			<label>���뷢�������ͣ�</label>
			<input type="text" name="userInvite.admin" value="${userInvite.admin}" class="required" size="30" />
		</p>
		<p>
			<label>������id��</label>
			<input type="text" name="userInvite.userId" value="${userInvite.userId}" class="required" size="30" />
		</p>
		<p>
			<label>������name��</label>
			<input type="text" name="userInvite.userName" value="${userInvite.userName}" class="required" size="30" />
		</p>
		<p>
			<label>����ʱ�䣺</label>
			<input type="text" name="userInvite.inviteTime" value="${userInvite.inviteTime}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�޸�</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>