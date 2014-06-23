<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/loginInfo!add.action?navTabId=loginInfoList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>用户id：</label>
			<input type="text" name="loginInfo.userId" class="required" size="30" />
		</p>
		<p>
			<label>用户名称：</label>
			<input type="text" name="loginInfo.nick" class="required" size="30" />
		</p>
		<p>
			<label>邮箱：</label>
			<input type="text" name="loginInfo.email" class="required" size="30" />
		</p>
		<p>
			<label>电话：</label>
			<input type="text" name="loginInfo.phone" class="required" size="30" />
		</p>
		<p>
			<label>密码：</label>
			<input type="text" name="loginInfo.password" class="required" size="30" />
		</p>
		<p>
			<label>最近登录：</label>
			<input type="text" name="loginInfo.lastLogin" class="required" size="30" />
		</p>
		<p>
			<label>登录次数：</label>
			<input type="text" name="loginInfo.loginCount" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>