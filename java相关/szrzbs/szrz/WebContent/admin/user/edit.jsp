<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/user!update.action?navTabId=userList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${user.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>昵称：</label>
			<input type="text" name="user.nick" value="${user.nick}" class="required" size="30" />
		</p>
		<p>
			<label>用户姓名：</label>
			<input type="text" name="user.name" value="${user.name}" class="required" size="30" />
		</p>
		<p>
			<label>身份证：</label>
			<input type="text" name="user.idCard" value="${user.idCard}" class="required" size="30" />
		</p>
		<p>
			<label>密码：</label>
			<input type="text" name="user.passward" value="${user.passward}" class="required" size="30" />
		</p>
		<p>
			<label>邮箱：</label>
			<input type="text" name="user.email" value="${user.email}" class="required" size="30" />
		</p>
		<p>
			<label>年龄：</label>
			<input type="text" name="user.age" value="${user.age}" class="required" size="30" />
		</p>
		<p>
			<label>性别：</label>
			<input type="text" name="user.male" value="${user.male}" class="required" size="30" />
		</p>
		<p>
			<label>职业：</label>
			<input type="text" name="user.userWork" value="${user.userWork}" class="required" size="30" />
		</p>
		<p>
			<label>金币：</label>
			<input type="text" name="user.goldCoin" value="${user.goldCoin}" class="required" size="30" />
		</p>
		<p>
			<label>状态：</label>
			<input type="text" name="user.status" value="${user.status}" class="required" size="30" />
		</p>
		<p>
			<label>注册时间：</label>
			<input type="text" name="user.regTime" value="${user.regTime}" class="required" size="30" />
		</p>
		<p>
			<label>登录次数：</label>
			<input type="text" name="user.loginCount" value="${user.loginCount}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>