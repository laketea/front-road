<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/purImg!update.action?navTabId=purImgList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		<input type="hidden" name="id" value="${purImg.id}">

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label>图像名称：</label>
			<input type="text" name="purImg.imgName" value="${purImg.imgName}" class="required" size="30" />
		</p>
		<p>
			<label>原始图片id：</label>
			<input type="text" name="purImg.oglPath" value="${purImg.oglPath}" class="required" size="30" />
		</p>
		<p>
			<label>新图片id：</label>
			<input type="text" name="purImg.path" value="${purImg.path}" class="required" size="30" />
		</p>
		<p>
			<label>类型Id：</label>
			<input type="text" name="purImg.typeId" value="${purImg.typeId}" class="required" size="30" />
		</p>
		<p>
			<label>类型名称：</label>
			<input type="text" name="purImg.typeName" value="${purImg.typeName}" class="required" size="30" />
		</p>
		<p>
			<label>购买人Id：</label>
			<input type="text" name="purImg.purUserId" value="${purImg.purUserId}" class="required" size="30" />
		</p>
		<p>
			<label>购买人names：</label>
			<input type="text" name="purImg.purUserName" value="${purImg.purUserName}" class="required" size="30" />
		</p>
		<p>
			<label>购买人用户身份证：</label>
			<input type="text" name="purImg.purUserIdCard" value="${purImg.purUserIdCard}" class="required" size="30" />
		</p>
		<p>
			<label>购买人用户身份证：</label>
			<input type="text" name="purImg.purTime" value="${purImg.purTime}" class="required" size="30" />
		</p>
		<p>
			<label>图片id：</label>
			<input type="text" name="purImg.imgId" value="${purImg.imgId}" class="required" size="30" />
		</p>
		<p>
			<label>售价：</label>
			<input type="text" name="purImg.valueCoin" value="${purImg.valueCoin}" class="required" size="30" />
		</p>
		<p>
			<label>认证时间：</label>
			<input type="text" name="purImg.antiTime" value="${purImg.antiTime}" class="required" size="30" />
		</p>
		<p>
			<label>开始时间：</label>
			<input type="text" name="purImg.startDate" value="${purImg.startDate}" class="required" size="30" />
		</p>
		<p>
			<label>结束时间：</label>
			<input type="text" name="purImg.endDate" value="${purImg.endDate}" class="required" size="30" />
		</p>
		<p>
			<label>有效期：</label>
			<input type="text" name="purImg.validDate" value="${purImg.validDate}" class="required" size="30" />
		</p>
		<p>
			<label>拍摄地点：</label>
			<input type="text" name="purImg.shootPlace" value="${purImg.shootPlace}" class="required" size="30" />
		</p>
		<p>
			<label>拍摄时间：</label>
			<input type="text" name="purImg.shootTime" value="${purImg.shootTime}" class="required" size="30" />
		</p>
		<p>
			<label>用户Id：</label>
			<input type="text" name="purImg.userId" value="${purImg.userId}" class="required" size="30" />
		</p>
		<p>
			<label>用户名：</label>
			<input type="text" name="purImg.userName" value="${purImg.userName}" class="required" size="30" />
		</p>
		<p>
			<label>用户身份证：</label>
			<input type="text" name="purImg.userIdCard" value="${purImg.userIdCard}" class="required" size="30" />
		</p>
		<p>
			<label>状态：</label>
			<input type="text" name="purImg.status" value="${purImg.status}" class="required" size="30" />
		</p>
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">取消</button></div></div></li>
			</ul>
		</div>
</form>