<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.*"%>
<%@page import="com.bookstore.po.*"%>
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
String columnid = request.getParameter("columnid");
if(columnid==""||columnid==null){columnid="1";}
int pageNo= 1;
try{
pageNo=Integer.parseInt(request.getParameter("pageNo"));
}catch(Exception e){
}

int pageSize = 20;
AdminService service = new AdminService();
int totalCount = 40;
List results = service.getAdminListByPage(pageSize,pageNo);
int totalPage = totalCount/pageSize+(totalCount%pageSize==0?0:1);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>���߷�α��֤ϵͳ��̨����ϵͳ</title>

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



<body >
<table width="700" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >�û�����</td>
	</tr>
	<tr>
		<td class="SubMenu" ><a href="admin_admin.jsp?columnid=1" >�û��б�</a><span class="STYLE1">|<a href="admin_admin.jsp?columnid=2" >�޸�����</a><span class="STYLE1">|<a href="admin_admin.jsp?columnid=3" >����û�</a></td>
	</tr>
	<tr >
		<td class="CPanel"  >

		
		<% if(columnid=="1"||columnid.equals("1"))
		{
		%>
		
		<table width="400" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="4"   >
			  ����Ա�б�
			  
			  </td>
			</tr>
			<tr>
	          <td   colspan="4" class="STYLE1"   >
			  
			  </td>
			</tr>
			<tr>
				<td width="50" align="center" class="TDHead">���</td>
				<td width="100" align="center" class="TDHead">�û���</td>
				<td width="150" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����</td>
			</tr>
			<%for(int i=0;i<results.size();i++){
				Admin admin  =(Admin)results.get(i);
			%>
			
			<tr>
			  <td align="center" class="STYLE1"><%=admin.getId()%></td>
				<td class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;<%=admin.getName()%></td>
				<td class="STYLE1">&nbsp;&nbsp;<%=admin.getPassword()%></td>
				<td align="center" class="STYLE1">
					<a href="#" onClick="confirmdelete(<%=admin.getId() %>)">ɾ��</a>
				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="4" align="right">
	<%if(pageNo>1){%>
	<a href="admin_admin.jsp?columnid=<%=columnid%>&pageNo=1">��һҳ</a>
	<a href="admin_admin.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">��һҳ</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_admin.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">��һҳ</a>
	<a href="admin_admin.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">���ҳ</a>
	<%}%>
	</td>
	</tr>
		</table>
		<%}
		if(columnid=="2"||columnid.equals("2"))
		{
		Admin admins=null;
     	admins=(Admin)session.getAttribute("admin");
		 %>
		 
		 <table width="500" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >�޸�����</td>
			</tr>
			 <html:form action="adminAction.do" > <html:hidden property="method" value="modify" /> 
			<tr>
			  <td width="91" align="right"  class="STYLE1">�û�����</td>
			  <td width="396" class="STYLE1"><html:text property="name" size="25" readonly="true" value="<%=admins.getName() %>" /></td>
			</tr>
			<tr>
			  <td align="right"  class="STYLE1">�����룺</td> 
			  <td>
			  <html:password property="oldpassword" size="27" />
			 </td>
			<tr>
			  <td align="right"  class="STYLE1">�����룺</td> 
			  <td>
			  <html:password property="password" size="27" />
			 </td>
			 <tr>
			  <td align="right"  class="STYLE1">ȷ�������룺</td> 
			  <td>
			  <html:password property="againpassword" size="27" />
			 </td>
			</tr>
			<tr>
			  <td></td>
			  <td><html:submit property="submit" value="�ύ" /></td>
			</tr>
			 </html:form>
		</table>
		
		<%} 
		if(columnid=="3"||columnid.equals("3"))
		{
		 %>
		 <table width="500" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >����û�</td>
			</tr>
			 <html:form action="adminAction.do" > <html:hidden property="method" value="add" /> 
			<tr>
			  <td width="91" align="right"  class="STYLE1">�û�����</td>
			  <td width="396" class="STYLE1"><html:text property="name" size="25" /></td>
			</tr>
			<tr>
			  <td align="right"  class="STYLE1">���룺</td> 
			  <td>
			  <html:password property="password" size="27" />
			 </td>
			</tr>
			<tr>
			  <td></td>
			  <td><html:submit property="submit" value="�ύ" /></td>
			</tr>
			 </html:form>
		</table>
		
		<%} %>
		
		
		
		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(id){
  if(confirm('ȷ��Ҫɾ����������')){
  	location.replace('<%=request.getContextPath()%>/adminAction.do?method=delete&amp;id='+id);
  }
}
</script>
</html>
