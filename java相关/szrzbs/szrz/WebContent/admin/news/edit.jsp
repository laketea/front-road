<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/news!update.action?navTabId=newsList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${news.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>���⣺</label>
			<input type="text" name="news.title" value="${news.title}" class="required" size="30" />
		</p>
		<p>
			<label>���ݣ�</label>
			<input type="text" name="news.content" value="${news.content}" class="required" size="30" />
		</p>
		<p>
			<label>����Id��</label>
			<input type="text" name="news.typeId" value="${news.typeId}" class="required" size="30" />
		</p>
		<p>
			<label>���ͣ�</label>
			<input type="text" name="news.typeName" value="${news.typeName}" class="required" size="30" />
		</p>
		<p>
			<label>���������</label>
			<input type="text" name="news.viewCount" value="${news.viewCount}" class="required" size="30" />
		</p>
		<p>
			<label>����ʱ�䣺</label>
			<input type="text" name="news.publishTime" value="${news.publishTime}" class="required" size="30" />
		</p>
		<p>
			<label>״̬��</label>
			<input type="text" name="news.status" value="${news.status}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�޸�</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>