<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/copyRightImg!add.action?navTabId=copyRightImgList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>ͼ�����ƣ�</label>
			<input type="text" name="copyRightImg.imgName" class="required" size="30" />
		</p>
		<p>
			<label>ԭʼͼƬid��</label>
			<input type="text" name="copyRightImg.oglPath" class="required" size="30" />
		</p>
		<p>
			<label>��ͼƬid��</label>
			<input type="text" name="copyRightImg.path" class="required" size="30" />
		</p>
		<p>
			<label>����Id��</label>
			<input type="text" name="copyRightImg.typeId" class="required" size="30" />
		</p>
		<p>
			<label>��ʼʱ�䣺</label>
			<input type="text" name="copyRightImg.startDate" class="required" size="30" />
		</p>
		<p>
			<label>����ʱ�䣺</label>
			<input type="text" name="copyRightImg.endDate" class="required" size="30" />
		</p>
		<p>
			<label>��Ч�ڣ�</label>
			<input type="text" name="copyRightImg.validDate" class="required" size="30" />
		</p>
		<p>
			<label>�û�Id��</label>
			<input type="text" name="copyRightImg.userId" class="required" size="30" />
		</p>
		<p>
			<label>�û�����</label>
			<input type="text" name="copyRightImg.userName" class="required" size="30" />
		</p>
		<p>
			<label>�û����֤��</label>
			<input type="text" name="copyRightImg.userIdCard" class="required" size="30" />
		</p>
		<p>
			<label>���ѽ�ң�</label>
			<input type="text" name="copyRightImg.spendCoin" class="required" size="30" />
		</p>
		<p>
			<label>��֤ʱ�䣺</label>
			<input type="text" name="copyRightImg.copyRightTime" class="required" size="30" />
		</p>
		<p>
			<label>״̬��</label>
			<input type="text" name="copyRightImg.status" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�ύ</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>