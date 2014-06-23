<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/copyRightImg!add.action?navTabId=copyRightImgList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>图像名称：</label>
			<input type="text" name="copyRightImg.imgName" class="required" size="30" />
		</p>
		<p>
			<label>原始图片id：</label>
			<input type="text" name="copyRightImg.oglPath" class="required" size="30" />
		</p>
		<p>
			<label>新图片id：</label>
			<input type="text" name="copyRightImg.path" class="required" size="30" />
		</p>
		<p>
			<label>类型Id：</label>
			<input type="text" name="copyRightImg.typeId" class="required" size="30" />
		</p>
		<p>
			<label>开始时间：</label>
			<input type="text" name="copyRightImg.startDate" class="required" size="30" />
		</p>
		<p>
			<label>结束时间：</label>
			<input type="text" name="copyRightImg.endDate" class="required" size="30" />
		</p>
		<p>
			<label>有效期：</label>
			<input type="text" name="copyRightImg.validDate" class="required" size="30" />
		</p>
		<p>
			<label>用户Id：</label>
			<input type="text" name="copyRightImg.userId" class="required" size="30" />
		</p>
		<p>
			<label>用户名：</label>
			<input type="text" name="copyRightImg.userName" class="required" size="30" />
		</p>
		<p>
			<label>用户身份证：</label>
			<input type="text" name="copyRightImg.userIdCard" class="required" size="30" />
		</p>
		<p>
			<label>话费金币：</label>
			<input type="text" name="copyRightImg.spendCoin" class="required" size="30" />
		</p>
		<p>
			<label>认证时间：</label>
			<input type="text" name="copyRightImg.copyRightTime" class="required" size="30" />
		</p>
		<p>
			<label>状态：</label>
			<input type="text" name="copyRightImg.status" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>