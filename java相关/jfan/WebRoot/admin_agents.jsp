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
String driver="com.mysql.jdbc.Driver"; //我用的是mysql官方驱动你自己换一下就是了 在这里有 
String url="jdbc:mysql://localhost:3306/bookstore?user=root&password=good545";
Connection conn=null; //数据库连接 
Statement stmt=null; 
PreparedStatement ps=null;
ResultSet rs = null; //查询结果 
ResultSet rs1 = null; 
ResultSet rs2 = null; 
ResultSet rs3 = null; 
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
.STYLE2 {color: #FF0000}
-->
</style></head>



<body >
<table width="700" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >读者反馈</td>
	</tr>
	<tr>
		<td class="SubMenu" ><a href="admin_agents.jsp?columnid=4" >投票结果</a><span class="STYLE1">|<a href="admin_agents.jsp?columnid=1" >留言版</a><span class="STYLE1">|<a href="admin_agents.jsp?columnid=2" >留言审核</a><span class="STYLE1">|<a href="admin_agents.jsp?columnid=3" >留言回复</a><span class="STYLE1">|</td>
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
			 留言列表			  </td>
			</tr>
			<tr>
	          <td   colspan="6" class="STYLE1"   >			  </td>
			</tr>
			<tr>
				<td width="100" align="center" class="TDHead">编号</td>
				<td width="100" align="center" class="TDHead">标题</td>
				<td width="100" align="center" class="TDHead">留言时间</td>
				<td width="100" align="center" class="TDHead">审核</td>
				<td width="100" align="center" class="TDHead">回复</td>
				<td width="100" align="center" class="TDHead">操作</td>
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
				<td align="center" class="STYLE1"><a href="#" onClick="confirmdelete(<%=guest.getId() %>)">删除</a>				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="6" align="right">
	<%if(pageNo>1){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=1">第一页</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">上一页</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">下一页</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">最后页</a>
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
			  留言审核			  </td>
			</tr>
			<tr>
	          <td   colspan="5" class="STYLE1"   >			  </td>
			</tr>
			<tr>
				<td width="100" align="center" class="TDHead">编号</td>
				<td width="100" align="center" class="TDHead">标题</td>
				<td width="100" align="center" class="TDHead">留言时间</td>
				<td width="100" align="center" class="TDHead">审核</td>
				<td width="100" align="center" class="TDHead">操作</td>
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
				<td align="center" class="STYLE1"><a href="#" onClick="confirmcon(<%=guest.getId() %>)">审核</a>	</td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmdelete(<%=guest.getId() %>)">删除</a>				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="5" align="right">
	<%if(pageNo>1){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=1">第一页</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">上一页</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">下一页</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">最后页</a>
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
			 		留言回复	  </td>
			</tr>
			<tr>
	          <td   colspan="5" class="STYLE1"   >			  </td>
			</tr>
			<tr>
				<td width="100" align="center" class="TDHead">编号</td>
				<td width="100" align="center" class="TDHead">标题</td>
				<td width="100" align="center" class="TDHead">留言时间</td>
				<td width="100" align="center" class="TDHead">回复</td>
				<td width="100" align="center" class="TDHead">操作</td>
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
				<td align="center" class="STYLE1"><a href="admin_agents.jsp?columnid=5&id=<%=guest.getId()%>">回复</a></td>
				<td align="center" class="STYLE1"><a href="#" onClick="confirmdelete(<%=guest.getId() %>)">删除</a>				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="5" align="right">
	<%if(pageNo>1){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=1">第一页</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">上一页</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">下一页</a>
	<a href="admin_agents.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">最后页</a>
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
	          <td class="TDHead" colspan="2" >回复留言</td>
			</tr>
			  <input type="hidden" name="method" value="feedback" />  
			 <input type="hidden" name="id" value="<%=guest.getId().toString()%>" />
			 <tr>
			  <td width="91" align="right"  class="STYLE1">主题：</td>
			  <td width="396" class="STYLE1"><%=guest.getTitle() %></td>
			</tr>
			<tr>
			  <td width="91" align="right"  class="STYLE1">内容：</td>
			  <td width="396" class="STYLE1"><%=guest.getContent() %></td>
			</tr>
			
			<tr>
			  <td align="right"  class="STYLE1">回复：</td> 
			  <td>
			  <textarea name="feedback" rows="6" cols="50"></textarea>
			 </td>
			</tr>
			<tr>
			  <td></td>
			  <td><input type="submit" value="提交" /></td>
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
	          <td class="TDHead" colspan="2" >留言信息</td>
			</tr>
			 <tr>
			  <td width="91" align="right"  class="STYLE1">主题：</td>
			  <td width="396" class="STYLE1"><%=guest.getTitle() %></td>
			</tr>
			<tr>
			  <td width="91" align="right"  class="STYLE1">内容：</td>
			  <td width="396" class="STYLE1"><%=guest.getContent() %></td>
			</tr>
			
			<tr>
			  <td align="right"  class="STYLE1">回复：</td> 
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
		
		
		 //加载驱动 
		try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url); //获得连接 
		stmt=conn.createStatement(); 
		rs=stmt.executeQuery("select * from vote where id=1");
		
		rs.next();
		//ok完成了插入和查询操作 
		}catch(SQLException e1) {
			e1.printStackTrace();
		}
		catch(Exception ex){
			System.out.println("createError:"+ex.getMessage());
		}
		
		
		 %>
		 <table width="752" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td height="35" colspan="5"  class="TDHead"   >投票结果</td>
			</tr>
			<tr>
	          <td colspan="5" class="STYLE1"   >			  </td>
			</tr>
			 
			<tr>
			  <td height="30" colspan="5" align="left" class="STYLE1">图书名称：课时学案系列</td>
			</tr>
			<tr>
			  <td width="73" height="25" align="left" class="STYLE1">印刷质量：</td>
		      <td width="100" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs.getInt(2) %> 人次</span></td>
		      <td width="100" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs.getInt(3) %> 人次 </span></td>
		      <td width="100" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs.getInt(4) %> 人次</span></td>
		      <td width="324" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs.getInt(5) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">封面设计：</td>
		      <td height="30" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs.getInt(6) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs.getInt(7) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs.getInt(8) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs.getInt(9) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">内文版式：</td>
		      <td height="30" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs.getInt(10) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs.getInt(11) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs.getInt(12) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs.getInt(13) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">题量设计：</td>
		      <td height="30" align="left" class="STYLE1">太多&nbsp;<span class="STYLE2"><%=rs.getInt(14) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">适中&nbsp;<span class="STYLE2"><%=rs.getInt(15) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较少&nbsp;<span class="STYLE2"><%=rs.getInt(16) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">题目设置：</td>
		      <td height="30" align="left" class="STYLE1">太难&nbsp;<span class="STYLE2"><%=rs.getInt(17) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">适中&nbsp;<span class="STYLE2"><%=rs.getInt(18) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">容易&nbsp;<span class="STYLE2"><%=rs.getInt(19) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">内容讲解：</td>
		      <td height="30" align="left" class="STYLE1">详细&nbsp;<span class="STYLE2"><%=rs.getInt(20) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs.getInt(21) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">笼统&nbsp;<span class="STYLE2"><%=rs.getInt(22) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">错 误 率：</td>
		      <td height="30" align="left" class="STYLE1">高&nbsp;<span class="STYLE2"><%=rs.getInt(23) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">中&nbsp;<span class="STYLE2"><%=rs.getInt(24) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">低&nbsp; <span class="STYLE2"><%=rs.getInt(25) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">无&nbsp;<span class="STYLE2"><%=rs.getInt(26) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="30" colspan="5" align="center" class="STYLE1"></td>
		   </tr>
		   <%
		   rs1=stmt.executeQuery("select * from vote where id=2");
			rs1.next();
		   %>
		   <tr>
			  <td height="30" colspan="5" align="left" class="STYLE1">图书名称：中考夺冠</td>
		   </tr>
			<tr>
			  <td width="73" height="25" align="left" class="STYLE1">印刷质量：</td>
		      <td width="100" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs1.getInt(2) %> 人次</span></td>
		      <td width="100" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs1.getInt(3) %> 人次 </span></td>
		      <td width="100" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs1.getInt(4) %> 人次</span></td>
		      <td width="324" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs1.getInt(5) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">封面设计：</td>
		      <td height="30" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs1.getInt(6) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs1.getInt(7) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs1.getInt(8) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs1.getInt(9) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">内文版式：</td>
		      <td height="30" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs1.getInt(10) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs1.getInt(11) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs1.getInt(12) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs1.getInt(13) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">题量设计：</td>
		      <td height="30" align="left" class="STYLE1">太多&nbsp;<span class="STYLE2"><%=rs1.getInt(14) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">适中&nbsp;<span class="STYLE2"><%=rs1.getInt(15) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较少&nbsp;<span class="STYLE2"><%=rs1.getInt(16) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">题目设置：</td>
		      <td height="30" align="left" class="STYLE1">太难&nbsp;<span class="STYLE2"><%=rs1.getInt(17) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">适中&nbsp;<span class="STYLE2"><%=rs1.getInt(18) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">容易&nbsp;<span class="STYLE2"><%=rs1.getInt(19) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">内容讲解：</td>
		      <td height="30" align="left" class="STYLE1">详细&nbsp;<span class="STYLE2"><%=rs1.getInt(20) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs1.getInt(21) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">笼统&nbsp;<span class="STYLE2"><%=rs1.getInt(22) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">错 误 率：</td>
		      <td height="30" align="left" class="STYLE1">高&nbsp;<span class="STYLE2"><%=rs1.getInt(23) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">中&nbsp;<span class="STYLE2"><%=rs1.getInt(24) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">低&nbsp; <span class="STYLE2"><%=rs1.getInt(25) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">无&nbsp;<span class="STYLE2"><%=rs1.getInt(26) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="30" colspan="5" align="center" class="STYLE1"></td>
		   </tr>
		    <%
		   rs2=stmt.executeQuery("select * from vote where id=3");
			rs2.next();
		   %>
		   <tr>
			  <td height="30" colspan="5" align="left" class="STYLE1">图书名称：中考必备</td>
		   </tr>
			<tr>
			  <td width="73" height="25" align="left" class="STYLE1">印刷质量：</td>
		      <td width="100" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs2.getInt(2) %> 人次</span></td>
		      <td width="100" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs2.getInt(3) %> 人次 </span></td>
		      <td width="100" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs2.getInt(4) %> 人次</span></td>
		      <td width="324" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs2.getInt(5) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">封面设计：</td>
		      <td height="30" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs2.getInt(6) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs2.getInt(7) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs2.getInt(8) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs2.getInt(9) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">内文版式：</td>
		      <td height="30" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs2.getInt(10) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs2.getInt(11) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs2.getInt(12) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs2.getInt(13) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">题量设计：</td>
		      <td height="30" align="left" class="STYLE1">太多&nbsp;<span class="STYLE2"><%=rs2.getInt(14) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">适中&nbsp;<span class="STYLE2"><%=rs2.getInt(15) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较少&nbsp;<span class="STYLE2"><%=rs2.getInt(16) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">题目设置：</td>
		      <td height="30" align="left" class="STYLE1">太难&nbsp;<span class="STYLE2"><%=rs2.getInt(17) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">适中&nbsp;<span class="STYLE2"><%=rs2.getInt(18) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">容易&nbsp;<span class="STYLE2"><%=rs2.getInt(19) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">内容讲解：</td>
		      <td height="30" align="left" class="STYLE1">详细&nbsp;<span class="STYLE2"><%=rs2.getInt(20) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs2.getInt(21) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">笼统&nbsp;<span class="STYLE2"><%=rs2.getInt(22) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">错 误 率：</td>
		      <td height="30" align="left" class="STYLE1">高&nbsp;<span class="STYLE2"><%=rs2.getInt(23) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">中&nbsp;<span class="STYLE2"><%=rs2.getInt(24) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">低&nbsp; <span class="STYLE2"><%=rs2.getInt(25) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">无&nbsp;<span class="STYLE2"><%=rs2.getInt(26) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="30" colspan="5" align="center" class="STYLE1"></td>
		   </tr>
		   <%
		   rs3=stmt.executeQuery("select * from vote where id=4");
			rs3.next();
		   %>
		   <tr>
			  <td height="30" colspan="5" align="left" class="STYLE1">图书名称：开卷速查</td>
		   </tr>
			<tr>
			  <td width="73" height="25" align="left" class="STYLE1">印刷质量：</td>
		      <td width="100" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs3.getInt(2) %> 人次</span></td>
		      <td width="100" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs3.getInt(3) %> 人次 </span></td>
		      <td width="100" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs3.getInt(4) %> 人次</span></td>
		      <td width="324" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs3.getInt(5) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">封面设计：</td>
		      <td height="30" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs3.getInt(6) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs3.getInt(7) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs3.getInt(8) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs3.getInt(9) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">内文版式：</td>
		      <td height="30" align="left" class="STYLE1">很好&nbsp;<span class="STYLE2"><%=rs3.getInt(10) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较好&nbsp;<span class="STYLE2"><%=rs3.getInt(11) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs3.getInt(12) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较差&nbsp;<span class="STYLE2"><%=rs3.getInt(13) %> 人次</span></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">题量设计：</td>
		      <td height="30" align="left" class="STYLE1">太多&nbsp;<span class="STYLE2"><%=rs3.getInt(14) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">适中&nbsp;<span class="STYLE2"><%=rs3.getInt(15) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">较少&nbsp;<span class="STYLE2"><%=rs3.getInt(16) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">题目设置：</td>
		      <td height="30" align="left" class="STYLE1">太难&nbsp;<span class="STYLE2"><%=rs3.getInt(17) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">适中&nbsp;<span class="STYLE2"><%=rs3.getInt(18) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">容易&nbsp;<span class="STYLE2"><%=rs3.getInt(19) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">内容讲解：</td>
		      <td height="30" align="left" class="STYLE1">详细&nbsp;<span class="STYLE2"><%=rs3.getInt(20) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">一般&nbsp;<span class="STYLE2"><%=rs3.getInt(21) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">笼统&nbsp;<span class="STYLE2"><%=rs3.getInt(22) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1"></td>
		   </tr>
			<tr>
			  <td height="25" align="left" class="STYLE1">错 误 率：</td>
		      <td height="30" align="left" class="STYLE1">高&nbsp;<span class="STYLE2"><%=rs3.getInt(23) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">中&nbsp;<span class="STYLE2"><%=rs3.getInt(24) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">低&nbsp; <span class="STYLE2"><%=rs3.getInt(25) %> 人次</span></td>
		      <td height="30" align="left" class="STYLE1">无&nbsp;<span class="STYLE2"><%=rs3.getInt(26) %> 人次</span></td>
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
					
		stmt.close();//关闭Statement 
		conn.close();//关闭数据库连接 
					}%>
		
		
		
		
		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(id){
  if(confirm('确定要删除该订单吗？')){
  	location.replace('<%=request.getContextPath()%>/guestAction.do?method=delete&amp;id='+id);
  }
}
function confirmcon(id){
  if(confirm('确定要通过审核吗？')){
  	location.replace('<%=request.getContextPath()%>/guestAction.do?method=confirm&amp;id='+id);
  }
}
function confirmsend(id){
  if(confirm('确定要发货吗？')){
  	location.replace('<%=request.getContextPath()%>/orderAction.do?method=confirmsend&amp;id='+id);
  }
}
</script>
</html>
