<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.*"%>
<%@page import="com.bookstore.po.*"%>
<%@page import="java.sql.*"%>
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
if(columnid==""||columnid==null){columnid="4";}
int pageNo= 1;
try{
pageNo=Integer.parseInt(request.getParameter("pageNo"));
}catch(Exception e){
}

int pageSize = 20;
GuestService service = new GuestService();
String driver="com.mysql.jdbc.Driver"; //���õ���mysql�ٷ��������Լ���һ�¾����� �������� 
String url="jdbc:mysql://localhost:3306/bookstore?user=root&password=good545";
Connection conn=null; //���ݿ����� 
Statement stmt=null; 
PreparedStatement ps=null;
ResultSet rs = null; //��ѯ��� 
ResultSet rs1 = null; 
ResultSet rs2 = null; 
ResultSet rs3 = null; 
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
.STYLE2 {color: #FF0000}
-->
</style></head>



<body >
<table width="700" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >���߷���</td>
	</tr>
	<tr>
		<td class="SubMenu" ><a href="admin_agents.jsp?columnid=4" >ͶƱ���</a><span class="STYLE1">|<a href="admin_agents.jsp?columnid=1" >���԰�</a><span class="STYLE1">|<a href="admin_agents.jsp?columnid=2" >�������</a><span class="STYLE1">|<a href="admin_agents.jsp?columnid=3" >���Իظ�</a><span class="STYLE1">|</td>
	</tr>
	<tr >
		<td class="CPanel"  >

		
		<% if(columnid=="1"||columnid.equals("1"))
		{
		int totalCount =service.getGuestCount();
List results = service.getGuestListByPage(pageSize,pageNo);
int totalPage = totalCount/pageSize+(totalCount%pageSize==0?0:1);

		%>
		
		<table width="752" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="6"   >
			 �����б�			  </td>
			</tr>
			<tr>
	          <td   colspan="6" class="STYLE1"   >			  </td>
			</tr>
			<tr>
				<td width="100" align="center" class="TDHead">���</td>
				<td width="100" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����ʱ��</td>
				<td width="100" align="center" class="TDHead">���</td>
				<td width="100" align="center" class="TDHead">�ظ�</td>
				<td width="100" align="center" class="TDHead">����</td>
			</tr>
			 <%
		//Collection ci = (Collection)request.getSession().getAttribute("ci");
		for(int i=0;i<results.size();i++){
				Guest guest  =(Guest)results.get(i);
		%>
			
			<tr>
			  <td height="25" align="center" class="STYLE1"><%=guest.getId()%></td>
				<td align="center" class="STYLE1"><a href="admin_agents.jsp?columnid=6&id=<%=guest.getId()%>"><%=guest.getTitle()%></a></td>
				<td align="center" class="STYLE1"><%=guest.getGuesttime()%></td>
				<td align="center" class="STYLE1"><%=UtilFun.getFlag(guest.getConfirm())%></td>
				<td align="center" class="STYLE1"><%=UtilFun.getFlag(guest.getFeedflag())%></td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmdelete(<%=guest.getId() %>)">ɾ��</a>				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="6" align="right">
	<%if(pageNo>1){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=1">��һҳ</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">��һҳ</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">��һҳ</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">���ҳ</a>
	<%}%>	</td>
	</tr>
		</table>
		<%}
		if(columnid=="2"||columnid.equals("2"))
		{
		int totalCount = service.getGuestCountCon();
		List results = service.getConListByPage(pageSize,pageNo);
		int totalPage = totalCount/pageSize+(totalCount%pageSize==0?0:1);
		
		
		
		 %>
		 
		<table width="752" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="5"   >
			  �������			  </td>
			</tr>
			<tr>
	          <td   colspan="5" class="STYLE1"   >			  </td>
			</tr>
			<tr>
				<td width="100" align="center" class="TDHead">���</td>
				<td width="100" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����ʱ��</td>
				<td width="100" align="center" class="TDHead">���</td>
				<td width="100" align="center" class="TDHead">����</td>
			</tr>
			 <%
		//Collection ci = (Collection)request.getSession().getAttribute("ci");
		for(int i=0;i<results.size();i++){
				Guest guest  =(Guest)results.get(i);
		%>
			
			<tr>
			  <td height="25" align="center" class="STYLE1"><%=guest.getId()%></td>
				<td align="center" class="STYLE1"><a href="admin_agents.jsp?columnid=6&id=<%=guest.getId()%>"><%=guest.getTitle()%></a></td>
				<td align="center" class="STYLE1"><%=guest.getGuesttime()%>/<%=guest.getConfirm()%></td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmcon(<%=guest.getId() %>)">���</a>	</td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmdelete(<%=guest.getId() %>)">ɾ��</a>				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="5" align="right">
	<%if(pageNo>1){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=1">��һҳ</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">��һҳ</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">��һҳ</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">���ҳ</a>
	<%}%>	</td>
	</tr>
		</table>
		<%} 
		if(columnid=="3"||columnid.equals("3"))
		{
		int totalCount = service.getGuestCountFeed();
		List results = service.getFeedListByPage(pageSize,pageNo);
		int totalPage = totalCount/pageSize+(totalCount%pageSize==0?0:1);
		
		 %>
		<table width="752" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="5"   >
			 		���Իظ�	  </td>
			</tr>
			<tr>
	          <td   colspan="5" class="STYLE1"   >			  </td>
			</tr>
			<tr>
				<td width="100" align="center" class="TDHead">���</td>
				<td width="100" align="center" class="TDHead">����</td>
				<td width="100" align="center" class="TDHead">����ʱ��</td>
				<td width="100" align="center" class="TDHead">�ظ�</td>
				<td width="100" align="center" class="TDHead">����</td>
			</tr>
			 <%
		//Collection ci = (Collection)request.getSession().getAttribute("ci");
		for(int i=0;i<results.size();i++){
				Guest guest  =(Guest)results.get(i);
		%>
			
			<tr>
			  <td height="25" align="center" class="STYLE1"><%=guest.getId()%></td>
				<td align="center" class="STYLE1"><a href="admin_agents.jsp?columnid=6&id=<%=guest.getId()%>"><%=guest.getTitle()%></a></td>
				<td align="center" class="STYLE1"><%=guest.getGuesttime()%></td>
				<td align="center" class="STYLE1"><a href="admin_agents.jsp?columnid=5&id=<%=guest.getId()%>">�ظ�</a></td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmdelete(<%=guest.getId() %>)">ɾ��</a>				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="5" align="right">
	<%if(pageNo>1){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=1">��һҳ</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">��һҳ</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">��һҳ</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">���ҳ</a>
	<%}%>	</td>
	</tr>
		</table>
		
		<%} %>
		
		
		<% 
		if(columnid=="5"||columnid.equals("5"))
		{
		String fid = request.getParameter("id");
		Long ffid = Long.valueOf(fid);
		Guest guest = service.getGuest(ffid);
		
		 %>
		 <form action="guestAction.do" >
		<table width="500" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >�ظ�����</td>
			</tr>
			  <input type="hidden" name="method" value="feedback" />  
			 <input type="hidden" name="id" value="<%=guest.getId().toString()%>" />
			 <tr>
			  <td width="91" align="right"  class="STYLE1">���⣺</td>
			  <td width="396" class="STYLE1"><%=guest.getTitle() %></td>
			</tr>
			<tr>
			  <td width="91" align="right"  class="STYLE1">���ݣ�</td>
			  <td width="396" class="STYLE1"><%=guest.getContent() %></td>
			</tr>
			
			<tr>
			  <td align="right"  class="STYLE1">�ظ���</td> 
			  <td>
			  <textarea name="feedback" rows="6" cols="50"></textarea>
			 </td>
			</tr>
			<tr>
			  <td></td>
			  <td><input type="submit" value="�ύ" /></td>
			</tr>
			
		</table>
		 </form>
		
		<%} %>
		
		
		<% 
		if(columnid=="6"||columnid.equals("6"))
		{
		String fid = request.getParameter("id");
		Long ffid = Long.valueOf(fid);
		Guest guest = service.getGuest(ffid);
		
		 %>
		 <form action="guestAction.do" >
		<table width="500" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td class="TDHead" colspan="2" >������Ϣ</td>
			</tr>
			 <tr>
			  <td width="91" align="right"  class="STYLE1">���⣺</td>
			  <td width="396" class="STYLE1"><%=guest.getTitle() %></td>
			</tr>
			<tr>
			  <td width="91" align="right"  class="STYLE1">���ݣ�</td>
			  <td width="396" class="STYLE1"><%=guest.getContent() %></td>
			</tr>
			
			<tr>
			  <td align="right"  class="STYLE1">�ظ���</td> 
			  <td>
			  <%=guest.getFeedback() %>
			 </td>
			</tr>
			<tr>
			  <td></td>
			  <td></td>
			</tr>
			
		</table>
		 </form>
		
		<%} %>
		
		
		
		
		
		
		
		
		
		
		<% 
		if(columnid=="4"||columnid.equals("4"))
		{
		
		
		 //�������� 
		try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url); //������� 
		stmt=conn.createStatement(); 
		rs=stmt.executeQuery("select * from vote where id=1");
		
		rs.next();
		//ok����˲���Ͳ�ѯ���� 
		}catch(SQLException e1) {
			e1.printStackTrace();
		}
		catch(Exception ex){
			System.out.println("createError:"+ex.getMessage());
		}
		
		
		 %>
		 <table width="752" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td height="35" colspan="5"  class="TDHead"   >ͶƱ���</td>
			</tr>
			<tr>
	          <td colspan="5" class="STYLE1"   >			  </td>
			</tr>
			 
			<tr>
			  <td height="30" colspan="5" align="left" class="STYLE1">ͼ�����ƣ���ʱѧ��ϵ��</td>
			</tr>
			<tr>
			  <td width="73" height="25" align="left" class="STYLE1">ӡˢ������</td>
		      <td width="100" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs.getInt(2) %> �˴�</span></td>
		      <td width="100" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs.getInt(3) %> �˴� </span></td>
		      <td width="100" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs.getInt(4) %> �˴�</span></td>
		      <td width="324" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs.getInt(5) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">������ƣ�</td>
		      <td height="30" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs.getInt(6) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs.getInt(7) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs.getInt(8) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs.getInt(9) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">���İ�ʽ��</td>
		      <td height="30" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs.getInt(10) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs.getInt(11) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs.getInt(12) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs.getInt(13) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">������ƣ�</td>
		      <td height="30" align="left" class="STYLE1">̫��&nbsp;<span class="STYLE2"><%=rs.getInt(14) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs.getInt(15) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs.getInt(16) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">��Ŀ���ã�</td>
		      <td height="30" align="left" class="STYLE1">̫��&nbsp;<span class="STYLE2"><%=rs.getInt(17) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs.getInt(18) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs.getInt(19) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">���ݽ��⣺</td>
		      <td height="30" align="left" class="STYLE1">��ϸ&nbsp;<span class="STYLE2"><%=rs.getInt(20) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs.getInt(21) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��ͳ&nbsp;<span class="STYLE2"><%=rs.getInt(22) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">�� �� �ʣ�</td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs.getInt(23) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs.getInt(24) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp; <span class="STYLE2"><%=rs.getInt(25) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs.getInt(26) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="30" colspan="5" align="center" class="STYLE1"></td>
		   </tr>
		   <%
		   rs1=stmt.executeQuery("select * from vote where id=2");
			rs1.next();
		   %>
		   <tr>
			  <td height="30" colspan="5" align="left" class="STYLE1">ͼ�����ƣ��п����</td>
		   </tr>
			<tr>
			  <td width="73" height="25" align="left" class="STYLE1">ӡˢ������</td>
		      <td width="100" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs1.getInt(2) %> �˴�</span></td>
		      <td width="100" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs1.getInt(3) %> �˴� </span></td>
		      <td width="100" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs1.getInt(4) %> �˴�</span></td>
		      <td width="324" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs1.getInt(5) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">������ƣ�</td>
		      <td height="30" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs1.getInt(6) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs1.getInt(7) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs1.getInt(8) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs1.getInt(9) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">���İ�ʽ��</td>
		      <td height="30" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs1.getInt(10) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs1.getInt(11) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs1.getInt(12) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs1.getInt(13) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">������ƣ�</td>
		      <td height="30" align="left" class="STYLE1">̫��&nbsp;<span class="STYLE2"><%=rs1.getInt(14) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs1.getInt(15) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs1.getInt(16) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">��Ŀ���ã�</td>
		      <td height="30" align="left" class="STYLE1">̫��&nbsp;<span class="STYLE2"><%=rs1.getInt(17) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs1.getInt(18) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs1.getInt(19) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">���ݽ��⣺</td>
		      <td height="30" align="left" class="STYLE1">��ϸ&nbsp;<span class="STYLE2"><%=rs1.getInt(20) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs1.getInt(21) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��ͳ&nbsp;<span class="STYLE2"><%=rs1.getInt(22) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">�� �� �ʣ�</td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs1.getInt(23) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs1.getInt(24) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp; <span class="STYLE2"><%=rs1.getInt(25) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs1.getInt(26) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="30" colspan="5" align="center" class="STYLE1"></td>
		   </tr>
		    <%
		   rs2=stmt.executeQuery("select * from vote where id=3");
			rs2.next();
		   %>
		   <tr>
			  <td height="30" colspan="5" align="left" class="STYLE1">ͼ�����ƣ��п��ر�</td>
		   </tr>
			<tr>
			  <td width="73" height="25" align="left" class="STYLE1">ӡˢ������</td>
		      <td width="100" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs2.getInt(2) %> �˴�</span></td>
		      <td width="100" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs2.getInt(3) %> �˴� </span></td>
		      <td width="100" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs2.getInt(4) %> �˴�</span></td>
		      <td width="324" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs2.getInt(5) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">������ƣ�</td>
		      <td height="30" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs2.getInt(6) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs2.getInt(7) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs2.getInt(8) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs2.getInt(9) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">���İ�ʽ��</td>
		      <td height="30" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs2.getInt(10) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs2.getInt(11) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs2.getInt(12) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs2.getInt(13) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">������ƣ�</td>
		      <td height="30" align="left" class="STYLE1">̫��&nbsp;<span class="STYLE2"><%=rs2.getInt(14) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs2.getInt(15) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs2.getInt(16) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">��Ŀ���ã�</td>
		      <td height="30" align="left" class="STYLE1">̫��&nbsp;<span class="STYLE2"><%=rs2.getInt(17) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs2.getInt(18) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs2.getInt(19) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">���ݽ��⣺</td>
		      <td height="30" align="left" class="STYLE1">��ϸ&nbsp;<span class="STYLE2"><%=rs2.getInt(20) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs2.getInt(21) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��ͳ&nbsp;<span class="STYLE2"><%=rs2.getInt(22) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">�� �� �ʣ�</td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs2.getInt(23) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs2.getInt(24) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp; <span class="STYLE2"><%=rs2.getInt(25) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs2.getInt(26) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="30" colspan="5" align="center" class="STYLE1"></td>
		   </tr>
		   <%
		   rs3=stmt.executeQuery("select * from vote where id=4");
			rs3.next();
		   %>
		   <tr>
			  <td height="30" colspan="5" align="left" class="STYLE1">ͼ�����ƣ������ٲ�</td>
		   </tr>
			<tr>
			  <td width="73" height="25" align="left" class="STYLE1">ӡˢ������</td>
		      <td width="100" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs3.getInt(2) %> �˴�</span></td>
		      <td width="100" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs3.getInt(3) %> �˴� </span></td>
		      <td width="100" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs3.getInt(4) %> �˴�</span></td>
		      <td width="324" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs3.getInt(5) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">������ƣ�</td>
		      <td height="30" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs3.getInt(6) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs3.getInt(7) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs3.getInt(8) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs3.getInt(9) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">���İ�ʽ��</td>
		      <td height="30" align="left" class="STYLE1">�ܺ�&nbsp;<span class="STYLE2"><%=rs3.getInt(10) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�Ϻ�&nbsp;<span class="STYLE2"><%=rs3.getInt(11) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs3.getInt(12) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">�ϲ�&nbsp;<span class="STYLE2"><%=rs3.getInt(13) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">������ƣ�</td>
		      <td height="30" align="left" class="STYLE1">̫��&nbsp;<span class="STYLE2"><%=rs3.getInt(14) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs3.getInt(15) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs3.getInt(16) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">��Ŀ���ã�</td>
		      <td height="30" align="left" class="STYLE1">̫��&nbsp;<span class="STYLE2"><%=rs3.getInt(17) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs3.getInt(18) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">����&nbsp;<span class="STYLE2"><%=rs3.getInt(19) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">���ݽ��⣺</td>
		      <td height="30" align="left" class="STYLE1">��ϸ&nbsp;<span class="STYLE2"><%=rs3.getInt(20) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">һ��&nbsp;<span class="STYLE2"><%=rs3.getInt(21) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��ͳ&nbsp;<span class="STYLE2"><%=rs3.getInt(22) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">�� �� �ʣ�</td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs3.getInt(23) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs3.getInt(24) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp; <span class="STYLE2"><%=rs3.getInt(25) %> �˴�</span></td>
		      <td height="30" align="left" class="STYLE1">��&nbsp;<span class="STYLE2"><%=rs3.getInt(26) %> �˴�</span></td>
		   </tr>
			<tr>
			  <td height="30" colspan="5" align="center" class="STYLE1">=</td>
		   </tr>
		</table>
					<%
					rs.close();
					rs1.close();
					rs2.close();
					rs3.close();
					
		stmt.close();//�ر�Statement 
		conn.close();//�ر����ݿ����� 
					}%>
		
		
		
		
		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(id){
  if(confirm('ȷ��Ҫɾ���ö�����')){
  	location.replace('<%=request.getContextPath()%>/guestAction.do?method=delete&amp;id='+id);
  }
}
function confirmcon(id){
  if(confirm('ȷ��Ҫͨ�������')){
  	location.replace('<%=request.getContextPath()%>/guestAction.do?method=confirm&amp;id='+id);
  }
}
function confirmsend(id){
  if(confirm('ȷ��Ҫ������')){
  	location.replace('<%=request.getContextPath()%>/orderAction.do?method=confirmsend&amp;id='+id);
  }
}
</script>
</html>
