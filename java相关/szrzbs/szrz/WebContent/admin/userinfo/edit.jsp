<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/sns/admin/userInfo!update.action?navTabId=userInfoList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${userInfo.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>�ǳƣ�</label>
			<input type="text" name="userInfo.nick" value="${userInfo.nick}" class="required" size="30" />
		</p>
		<p>
			<label>���䣺</label>
			<input type="text" name="userInfo.email" value="${userInfo.email}" class="required" size="30" />
		</p>
		<p>
			<label>ͷ��ͼƬid��</label>
			<input type="text" name="userInfo.headId" value="${userInfo.headId}" class="required" size="30" />
		</p>
		<p>
			<label>�绰��</label>
			<input type="text" name="userInfo.phone" value="${userInfo.phone}" class="required" size="30" />
		</p>
		<p>
			<label>�Ա�</label>
			<input type="text" name="userInfo.male" value="${userInfo.male}" class="required" size="30" />
		</p>
		<p>
			<label>��ѧ��</label>
			<input type="text" name="userInfo.university" value="${userInfo.university}" class="required" size="30" />
		</p>
		<p>
			<label>��˾��</label>
			<input type="text" name="userInfo.company" value="${userInfo.company}" class="required" size="30" />
		</p>
		<p>
			<label>סַ��</label>
			<input type="text" name="userInfo.address" value="${userInfo.address}" class="required" size="30" />
		</p>
		<p>
			<label>qq���룺</label>
			<input type="text" name="userInfo.qq" value="${userInfo.qq}" class="required" size="30" />
		</p>
		<p>
			<label>sina΢����</label>
			<input type="text" name="userInfo.micblog" value="${userInfo.micblog}" class="required" size="30" />
		</p>
		<p>
			<label>ע��ʱ�䣺</label>
			<input type="text" name="userInfo.regTime" value="${userInfo.regTime}" class="required" size="30" />
		</p>
		<p>
			<label>״̬��</label>
			<input type="text" name="userInfo.status" value="${userInfo.status}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�޸�</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>