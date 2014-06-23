<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/sns/admin/attent!add.action?navTabId=attentList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>用户id：</label>
			<input type="text" name="attent.userId" class="required" size="30" />
		</p>
		<p>
			<label>用户名：</label>
			<input type="text" name="attent.userName" class="required" size="30" />
		</p>
		<p>
			<label>被关注用户id：</label>
			<input type="text" name="attent.beUserId" class="required" size="30" />
		</p>
		<p>
			<label>被关注用户名：</label>
			<input type="text" name="attent.beUserName" class="required" size="30" />
		</p>
		<p>
			<label>时间：</label>
			<input type="text" name="attent.attentTime" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>