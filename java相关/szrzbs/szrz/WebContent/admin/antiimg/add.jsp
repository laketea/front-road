<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/antiImg!add.action?navTabId=antiImgList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>ͼ�����ƣ�</label>
			<input type="text" name="antiImg.imgName" class="required" size="30" />
		</p>
		<p>
			<label>ԭʼͼƬid��</label>
			<input type="text" name="antiImg.oglPath" class="required" size="30" />
		</p>
		<p>
			<label>��ͼƬid��</label>
			<input type="text" name="antiImg.path" class="required" size="30" />
		</p>
		<p>
			<label>����Id��</label>
			<input type="text" name="antiImg.typeId" class="required" size="30" />
		</p>
		<p>
			<label>��ʼʱ�䣺</label>
			<input type="text" name="antiImg.startDate" class="required" size="30" />
		</p>
		<p>
			<label>����ʱ�䣺</label>
			<input type="text" name="antiImg.endDate" class="required" size="30" />
		</p>
		<p>
			<label>��Ч�ڣ�</label>
			<input type="text" name="antiImg.validDate" class="required" size="30" />
		</p>
		<p>
			<label>����ص㣺</label>
			<input type="text" name="antiImg.shootPlace" class="required" size="30" />
		</p>
		<p>
			<label>����ʱ�䣺</label>
			<input type="text" name="antiImg.shootTime" class="required" size="30" />
		</p>
		<p>
			<label>�û�Id��</label>
			<input type="text" name="antiImg.userId" class="required" size="30" />
		</p>
		<p>
			<label>�û�����</label>
			<input type="text" name="antiImg.userName" class="required" size="30" />
		</p>
		<p>
			<label>�û����֤��</label>
			<input type="text" name="antiImg.userIdCard" class="required" size="30" />
		</p>
		<p>
			<label>�ۼۣ�</label>
			<input type="text" name="antiImg.valueCoin" class="required" size="30" />
		</p>
		<p>
			<label>���ѽ�</label>
			<input type="text" name="antiImg.spendCoin" class="required" size="30" />
		</p>
		<p>
			<label>��֤ʱ�䣺</label>
			<input type="text" name="antiImg.antiTime" class="required" size="30" />
		</p>
		<p>
			<label>״̬��</label>
			<input type="text" name="antiImg.status" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�ύ</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>