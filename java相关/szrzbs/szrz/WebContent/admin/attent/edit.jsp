<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/sns/admin/attent!update.action?navTabId=attentList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${attent.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>�û�id��</label>
			<input type="text" name="attent.userId" value="${attent.userId}" class="required" size="30" />
		</p>
		<p>
			<label>�û�����</label>
			<input type="text" name="attent.userName" value="${attent.userName}" class="required" size="30" />
		</p>
		<p>
			<label>����ע�û�id��</label>
			<input type="text" name="attent.beUserId" value="${attent.beUserId}" class="required" size="30" />
		</p>
		<p>
			<label>����ע�û�����</label>
			<input type="text" name="attent.beUserName" value="${attent.beUserName}" class="required" size="30" />
		</p>
		<p>
			<label>ʱ�䣺</label>
			<input type="text" name="attent.attentTime" value="${attent.attentTime}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�޸�</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>