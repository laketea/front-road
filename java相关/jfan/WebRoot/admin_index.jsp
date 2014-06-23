<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@page import="com.bookstore.service.*"%>
<%@page import="com.bookstore.po.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>数字防伪后台管理系统</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="control.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	background:#DBDFE8 url(images/mainback.jpg) repeat-x fixed;
}
-->
</style></head>
<% 
String adminstatus = (String)session.getAttribute("adminstatus");
if(adminstatus == null||adminstatus.equals(""))
{
	response.sendRedirect("admin_login.jsp");
	return;
}
Admin admin=null;
admin=(Admin)session.getAttribute("admin");
%>
<body >
<table width="700" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >后台管理首页</td>
	</tr>
	<tr>
		<td class="SubMenu" ></td>
	</tr>
	<tr >
		<td class="CPanel"  >

		
		<table width="600" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" ><%=admin.getName()%>:欢迎您登陆后台管理系统！</td>
			</tr>
			
			
			
			
		</table>
		
		
		</td >
	</tr>
	
</table>
</body>
</html>
