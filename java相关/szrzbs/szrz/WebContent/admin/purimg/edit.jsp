<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/purImg!update.action?navTabId=purImgList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${purImg.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>ͼ�����ƣ�</label>
			<input type="text" name="purImg.imgName" value="${purImg.imgName}" class="required" size="30" />
		</p>
		<p>
			<label>ԭʼͼƬid��</label>
			<input type="text" name="purImg.oglPath" value="${purImg.oglPath}" class="required" size="30" />
		</p>
		<p>
			<label>��ͼƬid��</label>
			<input type="text" name="purImg.path" value="${purImg.path}" class="required" size="30" />
		</p>
		<p>
			<label>����Id��</label>
			<input type="text" name="purImg.typeId" value="${purImg.typeId}" class="required" size="30" />
		</p>
		<p>
			<label>�������ƣ�</label>
			<input type="text" name="purImg.typeName" value="${purImg.typeName}" class="required" size="30" />
		</p>
		<p>
			<label>������Id��</label>
			<input type="text" name="purImg.purUserId" value="${purImg.purUserId}" class="required" size="30" />
		</p>
		<p>
			<label>������names��</label>
			<input type="text" name="purImg.purUserName" value="${purImg.purUserName}" class="required" size="30" />
		</p>
		<p>
			<label>�������û����֤��</label>
			<input type="text" name="purImg.purUserIdCard" value="${purImg.purUserIdCard}" class="required" size="30" />
		</p>
		<p>
			<label>�������û����֤��</label>
			<input type="text" name="purImg.purTime" value="${purImg.purTime}" class="required" size="30" />
		</p>
		<p>
			<label>ͼƬid��</label>
			<input type="text" name="purImg.imgId" value="${purImg.imgId}" class="required" size="30" />
		</p>
		<p>
			<label>�ۼۣ�</label>
			<input type="text" name="purImg.valueCoin" value="${purImg.valueCoin}" class="required" size="30" />
		</p>
		<p>
			<label>��֤ʱ�䣺</label>
			<input type="text" name="purImg.antiTime" value="${purImg.antiTime}" class="required" size="30" />
		</p>
		<p>
			<label>��ʼʱ�䣺</label>
			<input type="text" name="purImg.startDate" value="${purImg.startDate}" class="required" size="30" />
		</p>
		<p>
			<label>����ʱ�䣺</label>
			<input type="text" name="purImg.endDate" value="${purImg.endDate}" class="required" size="30" />
		</p>
		<p>
			<label>��Ч�ڣ�</label>
			<input type="text" name="purImg.validDate" value="${purImg.validDate}" class="required" size="30" />
		</p>
		<p>
			<label>����ص㣺</label>
			<input type="text" name="purImg.shootPlace" value="${purImg.shootPlace}" class="required" size="30" />
		</p>
		<p>
			<label>����ʱ�䣺</label>
			<input type="text" name="purImg.shootTime" value="${purImg.shootTime}" class="required" size="30" />
		</p>
		<p>
			<label>�û�Id��</label>
			<input type="text" name="purImg.userId" value="${purImg.userId}" class="required" size="30" />
		</p>
		<p>
			<label>�û�����</label>
			<input type="text" name="purImg.userName" value="${purImg.userName}" class="required" size="30" />
		</p>
		<p>
			<label>�û����֤��</label>
			<input type="text" name="purImg.userIdCard" value="${purImg.userIdCard}" class="required" size="30" />
		</p>
		<p>
			<label>״̬��</label>
			<input type="text" name="purImg.status" value="${purImg.status}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�޸�</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>