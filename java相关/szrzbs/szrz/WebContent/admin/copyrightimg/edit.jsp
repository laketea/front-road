<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/copyRightImg!update.action?navTabId=copyRightImgList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${copyRightImg.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>ͼ�����ƣ�</label>
			<input type="text" name="copyRightImg.imgName" value="${copyRightImg.imgName}" class="required" size="30" />
		</p>
		<p>
			<label>ԭʼͼƬid��</label>
			<input type="text" name="copyRightImg.oglPath" value="${copyRightImg.oglPath}" class="required" size="30" />
		</p>
		<p>
			<label>��ͼƬid��</label>
			<input type="text" name="copyRightImg.path" value="${copyRightImg.path}" class="required" size="30" />
		</p>
		<p>
			<label>����Id��</label>
			<input type="text" name="copyRightImg.typeId" value="${copyRightImg.typeId}" class="required" size="30" />
		</p>
		<p>
			<label>��ʼʱ�䣺</label>
			<input type="text" name="copyRightImg.startDate" value="${copyRightImg.startDate}" class="required" size="30" />
		</p>
		<p>
			<label>����ʱ�䣺</label>
			<input type="text" name="copyRightImg.endDate" value="${copyRightImg.endDate}" class="required" size="30" />
		</p>
		<p>
			<label>��Ч�ڣ�</label>
			<input type="text" name="copyRightImg.validDate" value="${copyRightImg.validDate}" class="required" size="30" />
		</p>
		<p>
			<label>�û�Id��</label>
			<input type="text" name="copyRightImg.userId" value="${copyRightImg.userId}" class="required" size="30" />
		</p>
		<p>
			<label>�û�����</label>
			<input type="text" name="copyRightImg.userName" value="${copyRightImg.userName}" class="required" size="30" />
		</p>
		<p>
			<label>�û����֤��</label>
			<input type="text" name="copyRightImg.userIdCard" value="${copyRightImg.userIdCard}" class="required" size="30" />
		</p>
		<p>
			<label>���ѽ�ң�</label>
			<input type="text" name="copyRightImg.spendCoin" value="${copyRightImg.spendCoin}" class="required" size="30" />
		</p>
		<p>
			<label>��֤ʱ�䣺</label>
			<input type="text" name="copyRightImg.copyRightTime" value="${copyRightImg.copyRightTime}" class="required" size="30" />
		</p>
		<p>
			<label>״̬��</label>
			<input type="text" name="copyRightImg.status" value="${copyRightImg.status}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�޸�</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>