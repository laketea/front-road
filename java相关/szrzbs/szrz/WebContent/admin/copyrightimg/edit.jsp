<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/copyRightImg!update.action?navTabId=copyRightImgList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${copyRightImg.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>图像名称：</label>
			<input type="text" name="copyRightImg.imgName" value="${copyRightImg.imgName}" class="required" size="30" />
		</p>
		<p>
			<label>原始图片id：</label>
			<input type="text" name="copyRightImg.oglPath" value="${copyRightImg.oglPath}" class="required" size="30" />
		</p>
		<p>
			<label>新图片id：</label>
			<input type="text" name="copyRightImg.path" value="${copyRightImg.path}" class="required" size="30" />
		</p>
		<p>
			<label>类型Id：</label>
			<input type="text" name="copyRightImg.typeId" value="${copyRightImg.typeId}" class="required" size="30" />
		</p>
		<p>
			<label>开始时间：</label>
			<input type="text" name="copyRightImg.startDate" value="${copyRightImg.startDate}" class="required" size="30" />
		</p>
		<p>
			<label>结束时间：</label>
			<input type="text" name="copyRightImg.endDate" value="${copyRightImg.endDate}" class="required" size="30" />
		</p>
		<p>
			<label>有效期：</label>
			<input type="text" name="copyRightImg.validDate" value="${copyRightImg.validDate}" class="required" size="30" />
		</p>
		<p>
			<label>用户Id：</label>
			<input type="text" name="copyRightImg.userId" value="${copyRightImg.userId}" class="required" size="30" />
		</p>
		<p>
			<label>用户名：</label>
			<input type="text" name="copyRightImg.userName" value="${copyRightImg.userName}" class="required" size="30" />
		</p>
		<p>
			<label>用户身份证：</label>
			<input type="text" name="copyRightImg.userIdCard" value="${copyRightImg.userIdCard}" class="required" size="30" />
		</p>
		<p>
			<label>话费金币：</label>
			<input type="text" name="copyRightImg.spendCoin" value="${copyRightImg.spendCoin}" class="required" size="30" />
		</p>
		<p>
			<label>认证时间：</label>
			<input type="text" name="copyRightImg.copyRightTime" value="${copyRightImg.copyRightTime}" class="required" size="30" />
		</p>
		<p>
			<label>状态：</label>
			<input type="text" name="copyRightImg.status" value="${copyRightImg.status}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>