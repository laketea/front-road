<%@ page language="java" pageEncoding="GBK" contentType="text/html;charset=GBK"%>  
<%@ include file="/admin/common/include.jsp"%> 


<form onsubmit="return validateCallback(this, dialogAjaxDone)" class="pageForm required-validate" action="/szrz/admin/news!save.action?navTabId=newsList&callbackType=closeCurrent" method="post" novalidate="novalidate">
		
		

	<div layouth="58" class="pageFormContent nowrap" style="height: 203px;width:100%; overflow: auto;" >
		
		<p>
			<label style="width:50px">���⣺</label>
			<input type="text" name="news.title" class="required" size="30" />
		</p>
		
		
			<input type="hidden" id="newsTypeHiddenId" name="news.typeName" class="required" size="30" />
		<p >
			<label style="width:50px">���ͣ�</label>
			<select id="newsTypeSelect" name="news.typeId" class="required">
						<option value="">��ѡ��</option>
						<c:forEach var="item" items="${newsTypeLst}" varStatus="s">
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
		
		<p class="area_table" style="width:650px">
			<label style="width:50px">���ݣ�</label>
			<textarea class="editor" name="news.content" class="required" width="400px" style="width:500px;height:250px" ></textarea>
		</p>
		
		
	</div>
	
			
	<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">�ύ</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button class="close" type="button">ȡ��</button></div></div></li>
			</ul>
		</div>
		
</form>

<script>
		$(".xheLayout").css("width","400px");
	</script>