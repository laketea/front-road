<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/guestBookType!update.action?navTabId=guestBookTypeList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${guestBookType.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>留言类型：</label>
			<input type="text" name="guestBookType.name" value="${guestBookType.name}" class="required" size="30" />
		</p>
		<p>
			<label>拥有留言总数：</label>
			<input type="text" name="guestBookType.gbCount" value="${guestBookType.gbCount}" class="required" size="30" />
		</p>
		
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>