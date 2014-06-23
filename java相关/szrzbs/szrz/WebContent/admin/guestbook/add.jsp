<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 

<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="guestBook!save.action?navTabId=guestBookList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		

	<div layouth="58" class="pageFormContent" style="height: 203px; overflow: auto;" >
		
		<p>
			<label style="width:50px">���⣺</label>
			<input type="text" name="guestBook.title" class="required" size="30" />
		</p>
		<input type="hidden" id="newsTypeHiddenId" name="guestBook.typeName" class="required" size="30" />
		<p >
			<label style="width:50px">���ͣ�</label>
			<select id="newsTypeSelect" name="guestBook.typeId" class="required">
						<option value="">��ѡ��</option>
						<c:forEach var="item" items="${guestBookTypeLst}" varStatus="s">
						<option value="${item.id}"
							>${item.name}</option>
						</c:forEach>
				</select>
		</p>
		<script>
			$("#newsTypeSelect").change(function(){
				$("#newsTypeHiddenId").attr("value",$(this).find("option:selected").text());
			})
		</script>
		<p style="height:110px;">
			<label style="width:50px">���ݣ�</label>
			<textarea  name="guestBook.content" class="required" rows=5" cols="40" ></textarea>
		</p>
		<p>
			<label style="width:50px">�ظ���</label>
			<textarea type="text" name="guestBook.replyContent" class="required" rows="5" cols="40" ></textarea>
		</p>
		
		
		
	</div>
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�ύ</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
</form>