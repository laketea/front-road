<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>

<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Subject"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>

<%
String adminstatus = (String)session.getAttribute("adminstatus");
if(adminstatus == null||adminstatus.equals(""))
{
	response.sendRedirect("admin_login.jsp");
	return;
}

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>在线防伪认证系统后台管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="control.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="css/calendar.css">
	<script type="text/javascript" src="js/jfanfan.js"></script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
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
	if (document.form1.grade.value=="") {      
		alert("请选择年级!");
		document.form1.grade.focus();        
		return false;
	}
	if (document.form1.subject.value=="") {      
		alert("请选择科目!");
		document.form1.subject.focus();        
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
     var regImg = new RegExp(/\.(gif|GIF|jpg|JPG|jpeg|JPEG)$/);
    var obj=document.getElementById('photo').value;
    if(obj.match(regImg)){    
    }else{
        alert('请上传图片格式文件');
        document.getElementById('photo').focus();
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

		
	
		
		<table width="750" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >添加商品</td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1" height="10"></td>
			  <td width="663" class="STYLE1"> </td>
			</tr>
			 <html:form action="/godsAction" enctype="multipart/form-data" styleId="form1" onsubmit="return checkform()"  > <html:hidden property="method" value="add" />
			  
			<tr>
			  <td width="74" align="right" class="STYLE1">商品名称：<br></td>
			  <td width="663" class="STYLE1"><html:text property="name"  size="56"/><span class="redhat">*</span> <br></td>
			</tr>
						
			<tr>
			  <td width="74" align="right" class="STYLE1">原价：<br></td>
			  <td width="663" class="STYLE1">
			  	<html:text property="oldprice"  size="20"/><span class="redhat">*</span> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				现价：<html:text property="newprice"  size="20"/><span class="redhat">*</span>
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
			  <td width="74" align="right" class="STYLE1">分类：<br></td>
			  <td width="663" class="STYLE1">
			  	<html:select property="types" >
			  		<html:option value="">请选择商品分类</html:option>
			<% UserService service = new UserService();
			List results = null;
			results = service.getSubjectList(1);
			for(int i=0;i<results.size();i++){
				Subject subject  =(Subject)results.get(i);
			%>		
					<html:option value="<%=subject.getId().toString() %>"><%=subject.getFirstname() %></html:option>
				
			<%
			} %>
				</html:select> 
				 <span class="redhat">*</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;积分：<html:text property="point"  size="20"/><span class="redhat">*</span> 
				
			  <br></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">库存：<br></td>
			  <td width="663" class="STYLE1"><html:text property="hourcount" value="10000"  size="56"/><span class="redhat">*</span> <br></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">开始时间：<br></td>
			  <td width="663" class="STYLE1">
			  	<input  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'end_time\')}'})"
            type="text" id="begin_time" name="begin_time" readOnly/><span class="redhat">*</span>&nbsp;&nbsp;&nbsp;&nbsp;
结束时间：<input  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'begin_time\')}'})"
            type="text" id="end_time" name="end_time" readOnly/><span class="redhat">*</span>
			  </td>
			</tr>
			
			<tr>
			  <td width="74" align="right" class="STYLE1">缩略图：<br></td>
			  <td width="663" class="STYLE1">
			  	<div id="urlsl"   ><html:file property="minphoto" size="46"     /><input type="button" value="使用外链" onClick="showsubmenu()" ><span class="redhat">*</span> </div><div id="urls" style="display:none;"   ><input type="text" name="minphoto_url" size="50"  ><input type="button" value="使用本地文件" onClick="showsubmenu()" ><span class="redhat">*</span> </div>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">大图：<br></td>
			  <td width="663" class="STYLE1">
			  	<div id="mmls"   ><html:file property="maxphoto" size="46"     /><input type="button" value="使用外链" onClick="showsubmenum()" ><span class="redhat">*</span> </div><div id="mml" style="display:none;"   ><input type="text" name="maxphoto_url" size="50"  ><input type="button" value="使用本地文件" onClick="showsubmenum()" ><span class="redhat">*</span> </div>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">图片一：<br></td>
			  <td width="663" class="STYLE1">
			  	<div id="mals"   ><html:file property="maxphoto_a" size="46"     /><input type="button" value="使用外链" onClick="showsubmenua()" ><span class="redhat">*</span> </div><div id="mal" style="display:none;"   ><input type="text" name="maxphoto_a_url" size="50"  ><input type="button" value="使用本地文件" onClick="showsubmenua()" ><span class="redhat">*</span> </div>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">图片二：<br></td>
			  <td width="663" class="STYLE1">
			  	<div id="mbls"   ><html:file property="maxphoto_b" size="46"     /><input type="button" value="使用外链" onClick="showsubmenub()" ><span class="redhat">*</span> </div><div id="mbl" style="display:none;"   ><input type="text" name="maxphoto_b_url" size="50"  ><input type="button" value="使用本地文件" onClick="showsubmenub()" ><span class="redhat">*</span> </div>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">图片三：<br></td>
			  <td width="663" class="STYLE1">
			  	<div id="mcls"   ><html:file property="maxphoto_c" size="46"     /><input type="button" value="使用外链" onClick="showsubmenuc()" ><span class="redhat">*</span> </div><div id="mcl" style="display:none;"   ><input type="text" name="maxphoto_c_url" size="50"  ><input type="button" value="使用本地文件" onClick="showsubmenuc()" ><span class="redhat">*</span> </div>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">图片四：<br></td>
			  <td width="663" class="STYLE1">
			  	<div id="mdls"   ><html:file property="maxphoto_d" size="46"     /><input type="button" value="使用外链" onClick="showsubmenud()" ><span class="redhat">*</span> </div><div id="mdl" style="display:none;"   ><input type="text" name="maxphoto_d_url" size="50"  ><input type="button" value="使用本地文件" onClick="showsubmenud()" ><span class="redhat">*</span> </div>
			  </td>
			</tr>
			<tr>
			  <td width="74" align="right" valign="top" class="STYLE1">描述：<br></td>
			  <td width="663" class="STYLE1"><TEXTAREA  name="discript" rows="5" cols="65"></TEXTAREA><span class="redhat">*</span> <br></td>
			</tr>
			<tr>
			  <td width="74" align="right" valign="top">详细说明：<br></td> 
			  <td width="663"> <html:hidden property="content"  />
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
<script language="javascript1.2">
function showsubmenu()
{
if (document.getElementById("urls").style.display == "none")
{
document.getElementById("urls").style.display ="block";
document.getElementById("urlsl").style.display ="none";
}
else
{
document.getElementById("urls").style.display ="none";
document.getElementById("urlsl").style.display ="";
}
}

function showsubmenum()
{
if (document.getElementById("mmls").style.display == "none")
{
document.getElementById("mmls").style.display ="block";
document.getElementById("mml").style.display ="none";
}
else
{
document.getElementById("mmls").style.display ="none";
document.getElementById("mml").style.display ="";
}
}
function showsubmenua()
{
if (document.getElementById("mals").style.display == "none")
{
document.getElementById("mals").style.display ="block";
document.getElementById("mal").style.display ="none";
}
else
{
document.getElementById("mals").style.display ="none";
document.getElementById("mal").style.display ="";
}
}


function showsubmenub()
{
if (document.getElementById("mbls").style.display == "none")
{
document.getElementById("mbls").style.display ="block";
document.getElementById("mbl").style.display ="none";
}
else
{
document.getElementById("mbls").style.display ="none";
document.getElementById("mbl").style.display ="";
}
}


function showsubmenuc()
{
if (document.getElementById("mcls").style.display == "none")
{
document.getElementById("mcls").style.display ="block";
document.getElementById("mcl").style.display ="none";
}
else
{
document.getElementById("mcls").style.display ="none";
document.getElementById("mcl").style.display ="";
}
}


function showsubmenud()
{
if (document.getElementById("mdls").style.display == "none")
{
document.getElementById("mdls").style.display ="block";
document.getElementById("mdl").style.display ="none";
}
else
{
document.getElementById("mdls").style.display ="none";
document.getElementById("mdl").style.display ="";
}
}

</script>
<script language="javascript">
function confirmdelete(Planid){
  if(confirm('确定要删除该商品吗？')){
  	location.replace('<%=request.getContextPath()%>/planAction.do?method=delete&amp;id='+Planid);
  }
}
</script>
</html>
