<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.*"%>
<%@page import="com.bookstore.po.*"%>
<%@page import="com.bookstore.util.UtilFun"%>
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
OrderService service = new OrderService();

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
		<td class="CTitle" >��������</td>
	</tr>
	<tr>
		<td class="SubMenu" ><a href="admin_order.jsp?columnid=1" >�����б�</a><span class="STYLE1">|<a href="admin_order.jsp?columnid=2" >δ�����</a><span class="STYLE1">|<a href="admin_order.jsp?columnid=3" >δ��������</a></td>
	</tr>
	<tr >
		<td class="CPanel"  >
		<% if(columnid=="1"||columnid.equals("1"))
		{
		int totalCount = service.getCount();
List results = service.getOrderListPage(pageSize,pageNo);
int totalPage = totalCount/pageSize+(totalCount%pageSize==0?0:1);
		%>	
		<table width="752" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="6"   >
			  �����б�<%=totalCount %>
			<tr>
	          <td   colspan="6" class="STYLE1"   >			  </td>
			</tr>
			<tr>
				<td width="100" align="center" class="TDHead">�������</td>
				<td width="100" align="center" class="TDHead">�����ܽ��</td>
				<td width="100" align="center" class="TDHead">�µ�ʱ��</td>
				<td width="100" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����</td>
			</tr>
			 <%
		//Collection ci = (Collection)request.getSession().getAttribute("ci");
		for(int i=0;i<results.size();i++){
				Orders orders  =(Orders)results.get(i);
		%>
			
			<tr>
			  <td align="center" class="STYLE1"><%=10000+orders.getId()%></td>
				<td align="center" class="STYLE1"><%=orders.getNewprice()%></td>
				<td align="center" class="STYLE1"><%=orders.getOrderdate()%></td>
				<td align="center" class="STYLE1"><%=UtilFun.getFlag(orders.getPayflag())%></td>
				<td align="center" class="STYLE1"><%=UtilFun.getFlag(orders.getSendflag())%></td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmdelete(<%=orders.getId() %>)">ɾ��</a>				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="6" align="right">
	<%if(pageNo>1){%>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=1">��һҳ</a>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">��һҳ</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">��һҳ</a>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">���ҳ</a>
	<%}%>	</td>
	</tr>
		</table>
		<%}
		if(columnid=="2"||columnid.equals("2"))
		{
		int totalCount = service.getCountT();
		List results = service.getOrderListPageT(pageSize,pageNo);
		int totalPage = totalCount/pageSize+(totalCount%pageSize==0?0:1);
		 %>
		 <table width="752" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="6"   >
			  δ�����			  </td>
			</tr>
			<tr>
	          <td   colspan="6" class="STYLE1"   >			  </td>
			</tr>
			<tr>
				<td width="100" align="center" class="TDHead">�������</td>
				<td width="100" align="center" class="TDHead">�����ܽ��</td>
				<td width="100" align="center" class="TDHead">�µ�ʱ��</td>
				<td width="100" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����</td>
			</tr>
			 <%
		//Collection ci = (Collection)request.getSession().getAttribute("ci");
		for(int i=0;i<results.size();i++){
				Orders orders  =(Orders)results.get(i);
		%>
			
			<tr>
			  <td align="center" class="STYLE1"><%=10000+orders.getId()%></td>
				<td align="center" class="STYLE1"><%=orders.getNewprice()%></td>
				<td align="center" class="STYLE1"><%=orders.getOrderdate()%></td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmpay(<%=orders.getId() %>)">δ����</a></td>
				<td align="center" class="STYLE1"><%=UtilFun.getFlag(orders.getSendflag())%></td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmdelete(<%=orders.getId() %>)">ɾ��</a>				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="6" align="right">
	<%if(pageNo>1){%>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=1">��һҳ</a>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">��һҳ</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">��һҳ</a>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">���ҳ</a>
	<%}%>	</td>
	</tr>
		</table>
		<%} 
		if(columnid=="3"||columnid.equals("3"))
		{
		int totalCount = service.getCountTh();
		List results = service.getOrderListPageTh(pageSize,pageNo);
		int totalPage = totalCount/pageSize+(totalCount%pageSize==0?0:1);
		
		 %>
		 <table width="752" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="6"   >
			  δ�����			  </td>
			</tr>
			<tr>
	          <td   colspan="6" class="STYLE1"   >			  </td>
			</tr>
			<tr>
				<td width="100" align="center" class="TDHead">�������</td>
				<td width="100" align="center" class="TDHead">�����ܽ��</td>
				<td width="100" align="center" class="TDHead">�µ�ʱ��</td>
				<td width="100" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����</td>
			</tr>
			 <%
		//Collection ci = (Collection)request.getSession().getAttribute("ci");
		for(int i=0;i<results.size();i++){
				Orders orders  =(Orders)results.get(i);
		%>
			
			<tr>
			  <td align="center" class="STYLE1"><%=10000+orders.getId()%></td>
				<td align="center" class="STYLE1"><%=orders.getNewprice()%></td>
				<td align="center" class="STYLE1"><%=orders.getOrderdate()%></td>
				<td align="center" class="STYLE1"><%=UtilFun.getFlag(orders.getPayflag())%></td>
				<td align="center" class="STYLE1"><a href="admin_order.jsp?columnid=4&amp;id=<%=orders.getId()%>&amp;sendway=<%=orders.getSendway()%>">ȷ�Ϸ���</a></td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmdelete(<%=orders.getId()%>)">ɾ��</a>				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="6" align="right">
	<%if(pageNo>1){%>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=1">��һҳ</a>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">��һҳ</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">��һҳ</a>
	<a href="admin_order.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">���ҳ</a>
	<%}%>	</td>
	</tr>
		</table>
		
		<%} 
		if(columnid=="4"||columnid.equals("4"))
		{
		Long id = Long.valueOf(request.getParameter("id"));
		String sendway = request.getParameter("sendway");
		 %>
		 <table width="750" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >���������Ϣ</td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1" height="10"></td>
			  <td width="663" class="STYLE1"> </td>
			</tr>
			 <form action="orderAction.do"  styleId="form1" method="post"   > <input type="hidden" name="method" value="confirmsend" /> 
			 <input type="hidden" name="id" value="<%=id.toString()%>" /> 
			<tr>
			  <td width="74" align="right" class="STYLE1">��ݷ�ʽ��<br></td>
			  <td width="663" class="STYLE1"><%=UtilFun.getSendway(sendway)%></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">������˾��<br></td>
			  <td width="663" class="STYLE1"><input type="text" name="mailcompany"><span class="redhat">*</span></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1">�ջ���ַ��<br></td>
			  <td width="663" class="STYLE1"> <input type="text" name="mailaddress" width="250px"><span class="redhat">*</span></td>
			</tr>
			<tr>
			  <td width="74"  align="right" class="STYLE1">�˵��ţ�</td>
			  <td width="663" ><input type="text" name="mailid"><span class="redhat">*</span>
			  </td>
			</tr>
			
			<tr>
			  <td width="74">		</td>
			  <td width="663"><input type="submit" value="�ύ" >&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="����" ></td>
			</tr>
			<tr>
			  <td width="74" align="right" class="STYLE1" height="10"></td>
			  <td width="663" class="STYLE1"> </td>
			</tr>
			 </form>
		</table>
		
		<%} %>
		
		
		
		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(id){
  if(confirm('ȷ��Ҫɾ���ö�����')){
  	location.replace('<%=request.getContextPath()%>/orderAction.do?method=delete&amp;id='+id);
  }
}
function confirmpay(id){
  if(confirm('ȷ��Ҫȷ���յ�������')){
  	location.replace('<%=request.getContextPath()%>/orderAction.do?method=confirmpay&amp;id='+id);
  }
}
function confirmsend(id){
  if(confirm('ȷ��Ҫ������')){
  	location.replace('<%=request.getContextPath()%>/orderAction.do?method=confirmsend&amp;id='+id);
  }
}
</script>
</html>
