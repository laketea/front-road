<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/newsType!add.action?navTabId=newsTypeList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>�������ͣ�</label>
			<input type="text" name="newsType.name" class="required" size="30" />
		</p>
		<p>
			<label>ӵ������������</label>
			<input type="text" name="newsType.newsCount" class="required" size="30" />
		</p>
		<p>
			<label>״̬��</label>
			<input type="text" name="newsType.status" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�ύ</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>