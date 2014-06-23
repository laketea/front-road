<%@ page language="java" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>
<%@ include file="/admin/common/include.jsp"%>

<form onsubmit="return validateCallback(this, dialogAjaxDone)"
	class="pageForm required-validate"
	action="/sns/admin/userInvite!add.action?navTabId=userInviteList&callbackType=closeCurrent"
	method="post" novalidate="novalidate">



	<div layouth="58" class="pageFormContent"
		style="height: 203px; overflow: auto;">

		<p>
			<label>邮箱：</label> <input type="text" name="userInvite.email"
				class="required email" size="25" />
		</p>
		<p>
			<label>会员类型：</label>
			<select name="userInvite.memeberType" class="required combox">
					<option value="">请选择</option>
					<option value="1" >天使</option>
					<option value="0" >会员</option>
			</select>
		</p>

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
						<button class="close" type="button">取消</button>
					</div>
				</div></li>
		</ul>
	</div>
</form>