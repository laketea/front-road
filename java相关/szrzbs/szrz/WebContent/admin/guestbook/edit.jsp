<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/guestBook!update.action?navTabId=guestBookList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${guestBook.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label  style="width:50px">标题：</label>
			<input type="text" name="guestBook.title" readonly="readonly" value="${guestBook.title}" class="required" size="30" />
		</p>
		<p>
			<label  style="width:50px">类型：</label>
			<input type="text" name="guestBook.typeName"  readonly="readonly" value="${guestBook.typeName}"  size="30" />
		</p>
		<p style="height:110px;">
			<label  style="width:50px">内容：</label>
			<textarea  name="guestBook.content" readonly="readonly"  class="required" rows=5" cols="40" >${guestBook.content}</textarea>
		</p>
		
			<input type="hidden" name="guestBook.typeId" value="${guestBook.typeId}"  size="30" />
		
		
		
			<input type="hidden" name="guestBook.userId" value="${guestBook.userId}"  size="30" />
		
		
			<input type="hidden" name="guestBook.userName" value="${guestBook.userName}" size="30" />
		
		
			<input type="hidden" name="guestBook.userNick" value="${guestBook.userNick}" size="30" />
		
		<p style="height:110px;">
			<label  style="width:50px">回复：</label>
			<textarea type="text" name="guestBook.replyContent"   rows="5" cols="40" >${guestBook.replyContent}</textarea>
		</p>
		
			<input type="hidden" name="guestBook.replyTime" value="${guestBook.replyTime}"  size="30" />
		
			
			<input type="hidden" name="guestBook.guestBookTime" value="${guestBook.guestBookTime}"  size="30" />
	
			<input type="hidden" name="guestBook.status" value="${guestBook.status}"  size="30" />
		
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>