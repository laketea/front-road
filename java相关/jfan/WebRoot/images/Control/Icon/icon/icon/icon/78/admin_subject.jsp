<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>

<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.po.Subject"%>
<%@page import="com.bookstore.util.UtilFun"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>

<%


SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String columnid = request.getParameter("columnid");
if(columnid==""||columnid==null){columnid="1";}
int cl=Integer.parseInt(columnid);
String columnname = null;
if( cl==1 ){
	columnname="һ������";
}else {
	columnname="��������";
}

UserService service = new UserService();
List results = null;
results = service.getSubjectList(cl);
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
	font-size: 12px;
	background:#DBDFE8 url(images/mainback.jpg) repeat-x fixed;
}
.STYLE1 {font-size: 12px}
-->
</style><meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>



<body >
<table width="900" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >��Ʒ�������</td>
	</tr>
	<tr>
		<td class="SubMenu" >
		<a href="admin_subject.jsp?columnid=1" >һ������</a><span class="STYLE1">|</span>
		<a href="admin_subject.jsp?columnid=2" >��������</a><span class="STYLE1">|</span>
		
	</tr>
	<tr >
		<td class="CPanel"  >
	<% if( cl==1 ){
	%>	 
		 <table width="600" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="2"   >һ������</td>
			</tr>
			<tr>
			  <td >���һ������</td>
			  <td ><form action="<%=request.getContextPath()%>/userAction.do" method="post" ><input type="hidden" name="method" value="addfirstsubject"><input type="text"  name="username"  /> &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="���"  /></form></td>
			</tr>
			<tr>
			  <td class="TDHead">��������</td>
			  <td class="TDHead">����</td>
			</tr>
			 
			<%for(int i=0;i<results.size();i++){
				Subject subject  =(Subject)results.get(i);
			%>
			<tr><td><%=subject.getFirstname()%></td>
			<td><a href="<%=request.getContextPath()%>/userAction.do?columnid=3&amp;id=<%=subject.getId()%>" >�޸�</a> &nbsp;&nbsp;<a href="#" onClick="confirmdelete(<%=subject.getId() %>)" >ɾ��</a> </td></tr>
			<%} %>
		</table>
	<%}else if (cl==2) {
	List resultss = service.getSubjectList(1);
	%>
		
		<form action="<%=request.getContextPath()%>/userAction.do" method="post" ><input type="hidden" name="method" value="addsecondsubject">
		<table width="600" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="3"   >��������</td>
			</tr>
			<tr>
			  <td >��Ӷ�������</td>
			  <td colspan="2">��ѡ����ࣺ<select name="username" >
			  <%
			  for(int i=0;i<resultss.size();i++){
				Subject subjects  =(Subject)resultss.get(i);%>
			  <option value=<%=subjects.getId()%> ><%=subjects.getFirstname()%></option>
			  <%}%>
			  </select> &nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="text"  name="email"  /> &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="���"  /></td>
			</tr>
			<tr>
			  <td class="TDHead">��������</td>
			  <td class="TDHead">һ������</td>
			  <td class="TDHead">����</td>
			</tr>
			 
			<% 
			for(int i=0;i<results.size();i++){
				Subject subject=(Subject)results.get(i);%>
			<tr><td><%=subject.getSecondname()%></td>
			<td><%=subject.getFirstname()%></td>
			<td><a href="<%=request.getContextPath()%>/userAction.do?columnid=3&amp;id=<%=subject.getId()%>" >�޸�</a> &nbsp;&nbsp;<a href="#" onClick="confirmdelete(<%=subject.getId() %>)" >ɾ��</a>  </td></tr>
			<%
			}
			%>
		</table>
		</form>
		<% } %>
		 
		 
		
		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(bookid){
  if(confirm('ȷ��Ҫɾ������Ʒ��')){
  	location.replace('<%=request.getContextPath()%>/userAction.do?method=delsubject&amp;id='+bookid);
  }
}
</script>
</html>
