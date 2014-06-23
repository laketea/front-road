<%@ page language="java" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>
<%@ include file="/admin/common/include.jsp"%>
<div class="pageContent">

	<form method="post" action="/szrz/admin/admin!login.action?callbackType=closeCurrent" class="pageForm"
		onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
			<div class="unit">
				<label>用户名：</label> <input type="text" name="admin.name" size="30"
					class="required" />
			</div>
			<div class="unit">
				<label>密码：</label> <input type="password" name="admin.pwd" size="30"
					class="required" />
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">提交</button>
							
					
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>

</div>

