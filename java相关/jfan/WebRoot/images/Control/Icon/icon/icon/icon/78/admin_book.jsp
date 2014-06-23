<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>

<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.util.UtilFun"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>

<%


SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String columnid = request.getParameter("columnid");
if(columnid==""||columnid==null){columnid="1";}
int cl=Integer.parseInt(columnid);
String columnname = null;
if( cl==2 ){
	columnname="在售商品";
}else if( cl==3 ){
	columnname="下架商品";
}else if( cl==4 ){
	columnname="置顶推荐";
}else if( cl==5 ){
	columnname="首页推荐";
}else {
	columnname="商品列表";
}

int pageNo= 1;
try{
pageNo=Integer.parseInt(request.getParameter("pageNo"));
}catch(Exception e){
}

int pageSize = 20;
int totalCount;
GodsService service = new GodsService();
totalCount = service.getGodsCount(cl);
List results = null;
if(cl>=1){
results = service.getGodsListByPage(pageSize,pageNo,cl);}
else
{
Gods godss =(Gods)request.getSession().getAttribute("Gods");
System.out.println(godss.getName());
//totalCount = service.getSearchBookCount(books);
results = service.getSearchListByPage(godss,pageSize,pageNo);}
int totalPage = totalCount/pageSize+(totalCount%pageSize==0?0:1);
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
	font-size: 12px;
	background:#DBDFE8 url(images/mainback.jpg) repeat-x fixed;
}
.STYLE1 {font-size: 12px}
-->
</style><meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>



<body >
<table width="900" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >商品管理</td>
	</tr>
	<tr>
		<td class="SubMenu" >
		<a href="admin_book.jsp?columnid=1" >商品列表</a><span class="STYLE1">|</span>
		<a href="admin_book.jsp?columnid=2" >在售商品</a><span class="STYLE1">|</span>
		<a href="admin_book.jsp?columnid=3" >下架商品</a><span class="STYLE1">|</span>
		<a href="admin_book.jsp?columnid=4" >顶置推荐</a><span class="STYLE1">|</span>
		<a href="admin_book.jsp?columnid=5" >首页推荐</a><span class="STYLE1">|</span>
		<a href="admin_book_add.jsp" >添加商品</a>
	</tr>
	<tr >
		<td class="CPanel"  >

		 
		 <table cellpadding="2" cellspacing="1" class="TablePanel" >
			
			<tr>
	          <td   colspan="4" class="STYLE1"   >
			  
			  </td>
			</tr>
			<form action="/GodsAction"  >
			<tr>
	          <td height="25" colspan="6" class="SubMenu"  >
			  <%=columnname %>
			  <input type="hidden" value="search" name="method" >
			 <input type="text" name="name" >
			 <input type="submit" value="搜索" ></td>
			</tr>
		   </form>
			
			<tr>
				<td width="100" align="center" class="TDHead">编号</td>
				<td width="200" align="center" class="TDHead">名称</td>
				<td width="100" align="center" class="TDHead">原价</td>
				<td width="100" align="center" class="TDHead">现价</td>
				<td width="100" align="center" class="TDHead">结束时间</td>
				<td width="200" align="center" class="TDHead">操作</td>
			</tr>
			<%for(int i=0;i<results.size();i++){
				Gods gods  =(Gods)results.get(i);
			%>
			
			<tr>
			  <td align="center" class="STYLE1" height="25"><%=gods.getId()%></td>
				<td class="STYLE1">&nbsp;&nbsp;&nbsp;&nbsp;<a href="showbooks.jsp?id=<%=gods.getId()%>" target="_blank"><%=UtilFun.getString(gods.getName(),10)%></a></td>
				<td width="150" align="center" class="STYLE1"><%=gods.getOldprice()%></td>
				<td align="center" class="STYLE1"><%=gods.getNewprice()%></td>
				<td class="STYLE1">&nbsp;&nbsp;<%=gods.getEnddate()%></td>
				<td align="center" class="STYLE1">
					<a href="#" onClick="confirmdelete(<%=gods.getId() %>)">删除</a>
					<%if(gods.getStatus()==0) {%><a href="#" onClick="confirmdown(<%=gods.getId() %>)">下架</a>
					<%}%>
					<a href="godsAction.do?method=modify&id=<%=gods.getId()%>">编辑</a>
				</td>
			</tr>
			<%}%>
		<tr>
	<td colspan="6" align="right">
	共<span style="color:red"><strong><%= totalCount%></strong></span>条 每页<span style="color:red"><strong><%=pageSize %></strong></span>条 页次 <span style="color:red"><strong><%=pageNo%>/<%=totalPage %></strong></span>
	<%if(pageNo>1){%>
	<a href="admin_book.jsp?columnid=<%=columnid%>&pageNo=1">第一页</a>
	<a href="admin_book.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo-1%>">上一页</a>
	<%}%>
	<%if(pageNo<totalPage){%>
	<a href="admin_book.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">下一页</a>
	<a href="admin_book.jsp?columnid=<%=columnid%>&pageNo=<%=pageNo+1%>">最后页</a>
	<%}%>
	</td>
	</tr>
		</table>
		 
		 
		
		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(bookid){
  if(confirm('确定要删除该商品吗？')){
  	location.replace('<%=request.getContextPath()%>/godsAction.do?method=delete&amp;id='+bookid);
  }
}
function confirmdown(bookid){
  if(confirm('确定要下架该商品吗？')){
  	location.replace('<%=request.getContextPath()%>/godsAction.do?method=down&amp;id='+bookid);
  }
}
</script>
</html>
