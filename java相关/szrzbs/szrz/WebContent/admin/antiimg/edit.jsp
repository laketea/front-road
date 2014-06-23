<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/antiImg!update.action?navTabId=antiImgList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${antiImg.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>图像名称：</label>
			<input type="text" name="antiImg.imgName" value="${antiImg.imgName}" class="required" size="30" />
		</p>
		<p>
			<label>原始图片id：</label>
			<input type="text" name="antiImg.oglPath" value="${antiImg.oglPath}" class="required" size="30" />
		</p>
		<p>
			<label>新图片id：</label>
			<input type="text" name="antiImg.path" value="${antiImg.path}" class="required" size="30" />
		</p>
		<p>
			<label>类型Id：</label>
			<input type="text" name="antiImg.typeId" value="${antiImg.typeId}" class="required" size="30" />
		</p>
		<p>
			<label>开始时间：</label>
			<input type="text" name="antiImg.startDate" value="${antiImg.startDate}" class="required" size="30" />
		</p>
		<p>
			<label>结束时间：</label>
			<input type="text" name="antiImg.endDate" value="${antiImg.endDate}" class="required" size="30" />
		</p>
		<p>
			<label>有效期：</label>
			<input type="text" name="antiImg.validDate" value="${antiImg.validDate}" class="required" size="30" />
		</p>
		<p>
			<label>拍摄地点：</label>
			<input type="text" name="antiImg.shootPlace" value="${antiImg.shootPlace}" class="required" size="30" />
		</p>
		<p>
			<label>拍摄时间：</label>
			<input type="text" name="antiImg.shootTime" value="${antiImg.shootTime}" class="required" size="30" />
		</p>
		<p>
			<label>用户Id：</label>
			<input type="text" name="antiImg.userId" value="${antiImg.userId}" class="required" size="30" />
		</p>
		<p>
			<label>用户名：</label>
			<input type="text" name="antiImg.userName" value="${antiImg.userName}" class="required" size="30" />
		</p>
		<p>
			<label>用户身份证：</label>
			<input type="text" name="antiImg.userIdCard" value="${antiImg.userIdCard}" class="required" size="30" />
		</p>
		<p>
			<label>售价：</label>
			<input type="text" name="antiImg.valueCoin" value="${antiImg.valueCoin}" class="required" size="30" />
		</p>
		<p>
			<label>话费金额：</label>
			<input type="text" name="antiImg.spendCoin" value="${antiImg.spendCoin}" class="required" size="30" />
		</p>
		<p>
			<label>认证时间：</label>
			<input type="text" name="antiImg.antiTime" value="${antiImg.antiTime}" class="required" size="30" />
		</p>
		<p>
			<label>状态：</label>
			<input type="text" name="antiImg.status" value="${antiImg.status}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>