<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>

<%@page import="com.bookstore.service.*"%>
<%@page import="com.bookstore.po.*"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>

<%


SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>在线防伪认证系统后台管理系统</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="control.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	font-size: 10px;
	background:#DBDFE8 url(images/mainback.jpg) repeat-x fixed;
}
.STYLE1 {font-size: 12px}
-->
</style></head>
<script>
function checkform(){
	if (document.form1.name.value=="") {      
		alert("请输入书名!");
		document.form1.name.focus();        
		return false;
	} 
	if (document.form1.author.value=="") {      
		alert("请输入作者!");
		document.form1.author.focus();        
		return false;
	}
	if (document.form1.company.value=="") {      
		alert("请输入出版社!");
		document.form1.company.focus();        
		return false;
	}
	if (document.form1.version.value=="") {      
		alert("请输入版本!");
		document.form1.version.focus();        
		return false;
	}
	if (document.form1.price.value=="") {      
		alert("请输入价格!");
		document.form1.price.focus();        
		return false;
	}
	if (document.form1.isbn.value=="") {      
		alert("请输入ISBN!");
		document.form1.isbn.focus();        
		return false;
	}
	if (document.form1.size.value=="") {      
		alert("请输入装帧/开本!");
		document.form1.size.focus();        
		return false;
	}
	if (document.form1.createdate.value=="") {      
		alert("请输入出版日期!");
		document.form1.createdate.focus();        
		return false;
	}

}
</script>



<body >
<table width="700" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >商品管理</td>
	</tr>
	<tr>
		<td class="SubMenu" ><a href="admin_book.jsp?columnid=1" >商品列表</a><span class="STYLE1">|<a href="admin_book_add.jsp" >添加商品</a></td>
	</tr>
	<tr >
		<td class="CPanel"  >
	<%
Gods gods =(Gods)request.getAttribute("gods");
 request.getSession().setAttribute("ff",gods.getMinphoto());
 request.getSession().setAttribute("fs",gods.getMaxphoto());
 %>
		
	
		
		<table width="750" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >修改商品信息</td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1" height="10"></td>
			  <td width="663" class="STYLE1"> </td>
			</tr>
			 <html:form action="/godsAction" enctype="multipart/form-data" styleId="form1" onsubmit="return checkform()"  > <html:hidden property="method" value="update" />  <html:hidden property="id" value="<%=gods.getId().toString() %>" /> 
			<tr>
			  <td width="74" align="right" class="STYLE1">商品名称：</td>
			  <td width="663" class="STYLE1"> <html:text property="name"  size="56" value="<%=gods.getName()%>"/><span class="redhat">*</span></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">原价：<br></td>
			  <td width="663" class="STYLE1">
			  	<html:text property="oldprice" value="<%=gods.getOldprice().toString()%>"  size="20"/><span class="redhat">*</span> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				现价：<html:text property="newprice" value="<%=gods.getNewprice().toString()%>"   size="20"/><span class="redhat">*</span>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">首页推荐：<br></td>
			  <td width="663" class="STYLE1">
			  	<html:select property="defaultstatus" >
			  		<html:option value="">请选择&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</html:option>
					<html:option value="0">否</html:option>
					<html:option value="1">是</html:option>
				</html:select><span class="redhat">*</span> 
				&nbsp;&nbsp;&nbsp;&nbsp;置顶推荐：<html:select property="firststatus" >
					<html:option value="">请选择&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</html:option>
					<html:option value="0">否</html:option>
					<html:option value="1">是</html:option>
				</html:select> <span class="redhat">*</span> 
				
			  <br></td>
			</tr>
			
			<tr>
			  <td width="74" align="right" class="STYLE1">状态：<br></td>
			  <td width="663" class="STYLE1">
			  	<html:select property="status" >
			  		<html:option value="">请选择&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</html:option>
					<html:option value="0">销售</html:option>
					<html:option value="1">下架</html:option>
				</html:select><span class="redhat">*</span> 
				&nbsp;&nbsp;&nbsp;&nbsp;销量：<html:text property="sellcount" value="<%=gods.getSellcount().toString()%>"  size="20"/><span class="redhat">*</span> 
				
			  <br></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">商品分类：</td>
			  <td width="663" class="STYLE1"> <html:text property="types"  size="20" value="<%=gods.getFirst().toString()%>"/><span class="redhat">*</span>
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				积分：<html:text property="point" value="<%=gods.getPoint().toString()%>"   size="20"/><span class="redhat">*</span>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">开始时间：<br></td>
			  <td width="663" class="STYLE1">
			  	<input value="<%=gods.getStartdate().toString()%>"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}'})"
            type="text" id="begin_time" name="begin_time" readOnly/><span class="redhat">*</span>&nbsp;&nbsp;&nbsp;&nbsp;
结束时间：<input value="<%=gods.getEnddate().toString()%>"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'begin_time\')}'})"
            type="text" id="end_time" name="end_time" readOnly/><span class="redhat">*</span>
			  </td>
			</tr>
			
			<tr>
			  <td width="74" align="right" class="STYLE1">缩略图：<br></td>
			  <td width="663" class="STYLE1">
			  	<%=gods.getMinphoto()%><span class="redhat">*</span> 
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">大图：<br></td>
			  <td width="663" class="STYLE1">
			  	<%=gods.getMaxphoto()%><span class="redhat">*</span> 
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" valign="top" class="STYLE1">描述：<br></td>
			  <td width="663" class="STYLE1"><TEXTAREA  name="discript" rows="5" cols="65"><%=gods.getDiscript()%></TEXTAREA><span class="redhat">*</span> <br></td>
			</tr>
			<tr>
			  <td width="74" align="right" valign="top">详细说明：<br></td> 
			  <td width="663"> <html:hidden property="content" value="<%=gods.getContent()%>"  />
			  <IFRAME ID="eWebEditor1" src="ewebeditor.htm?id=content&style=mini" frameborder="0" scrolling="no" width="550" height="350"></IFRAME>
			  <br></td>
			</tr>
			
			<tr>
			  <td width="74">			              <br></td>
			  <td width="663"><html:submit>提交</html:submit>
<html:reset >重置</html:reset></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1" height="10"></td>
			  <td width="663" class="STYLE1"> </td>
			</tr>
			 </html:form>
		</table>

		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(Planid){
  if(confirm('确定要删除该新闻吗？')){
  	location.replace('<%=request.getContextPath()%>/planAction.do?method=delete&amp;id='+Planid);
  }
}
</script>
</html>
