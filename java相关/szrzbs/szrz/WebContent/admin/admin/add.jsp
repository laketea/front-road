<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/admin!add.action?navTabId=adminList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
	
		<p>
			<label>�û�����</label>
			<input type="text" name="admin.name" class="required" size="10" minlength="6" maxlength="20"/>
		</p>
		
		<p>
			<label>����</label>
			<input type="text" name="admin.pwd" class="required" size="30" value=""/>
		</p>
		<p>
			<label>��������Ա</label>
			<select name="admin.supers">	
				<option value="1">��</option>
				<option value="1">��</option>
			</select>
		</p>
		
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�ύ</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>