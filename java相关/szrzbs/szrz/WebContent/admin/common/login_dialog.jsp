<%@ page language="java" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>
<%@ include file="/admin/common/include.jsp"%>
<div class="pageContent">

	<form method="post" action="/szrz/admin/admin!login.action?callbackType=closeCurrent" class="pageForm"
		onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>�û�����</label> <input type="text" name="admin.name" size="30"
					class="required" />
			</div>
			<div class="unit">
				<label>���룺</label> <input type="password" name="admin.pwd" size="30"
					class="required" />
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">�ύ</button>
							
					
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">ȡ��</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>

</div>

