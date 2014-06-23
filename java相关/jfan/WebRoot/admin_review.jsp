<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.*"%>
<%@page import="com.bookstore.po.*"%>
<%@page import="com.bookstore.util.*"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>

<%
String adminstatus = (String)session.getAttribute("adminstatus");
if(adminstatus == null||adminstatus.equals(""))
{
	response.sendRedirect("admin_login.jsp");
	return;
}

int pageNo= 1;
try{
pageNo=Integer.parseInt(request.getParameter("pageNo"));
}catch(Exception e){
}

int pageSize = 10;
ReviewService service = new ReviewService();

Page pages = service.getReviewPage(10,Integer.valueOf(pageNo));
List result = pages.getThisPageElements();
//OrderService orser = new OrderService();

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
	<link href="css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	font-size: 10px;
	background:#DBDFE8 url(images/mainback.jpg) repeat-x fixed;
	margin-left: 10px;
	margin-top: 15px;
}
.STYLE1 {font-size: 12px}
h2 { margin:0; padding:0;font-size:10pt; font-family:'微软雅黑'; color:#00000;}
#float span { float:right; margin-top:-15px;}
-->
</style><meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>



<body >
<table width="800" border="0" cellpadding="0" cellspacing="0" class="CContent"  >
	<tr>
		<td class="CTitle" >评论管理</td>
	</tr>
	<tr>
		<td class="SubMenu" ><a href="admin_review.jsp" >评论列表</a><span class="STYLE1">|</span></td>
	</tr>
	<tr >
		<td class="CPanel"  >

		
		
		
		<table width="90%" cellpadding="2" cellspacing="1" class="TablePanel" >
			<tr>
	          <td  class="TDHead" colspan="6"   >
			  评论列表列表			  </td>
			</tr>
			<tr>
	          <td   colspan="6" class="STYLE1"   ><table height="0" border="0" align="center" cellpadding="0" cellspacing="0">
 <%
	  for(int i=0;i<result.size();i++){
			Review review  =(Review)result.get(i);
	  %>
      <tr>
        <td height="167" colspan="3" align="center" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="110" rowspan="2" align="center" valign="bottom"><img src="images/tg_gt_tx.png" width="51" height="51" /></td>
            <td width="836" height="30" align="left" class="de_table"><div id="float"><h2>&nbsp;&nbsp;标题：<%=review.getTitle()%></h2><span style=";color:#808080; font-size:8pt; font-family:'宋体'; float:right">[<%=review.getRedate()%>]&nbsp;<a href="#" onClick="confirmdelete(<%=review.getId()%>)" >[删除]</a></span></div></td>
          </tr>
          <tr>
            <td height="30" align="left" valign="middle" class="review_gods">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10pt; font-family:'微软雅黑'; color:#61861e">优点：</span><%=review.getAdvantage()%></td>
          </tr>
          <tr>
            <td height="28" align="center"><%=review.getUsername()%></td>
            <td height="25" align="left" valign="top" class="review_gods">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10pt; font-family:'微软雅黑'; color:#61861e">不足：</span><%=review.getDefect()%></td>
          </tr>
          <tr>
            <td height="46" align="center" valign="top"><p>购买日期</p>
              <p><%=review.getOrderdate()%></p></td>
            <td height="30" align="left" valign="top" class="de_gods_2">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10pt; font-family:'微软雅黑'; color:#61861e">心得：</span><%=review.getView()%></td>
          </tr>
          
        </table></td>
      </tr>
	  <%
	  }
	  if(result.size()!=0){
	  %>
      <tr>
        <td height="50" colspan="3" align="right" valign="bottom"><table  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style=" border-bottom: 1px solid #93ac64;border-left: 1px solid #93ac64;border-top: 1px solid #93ac64; margin-right:50">
  <tr>
  <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="admin_review.jsp?pageNo=1" >首页</a></td>
  <%for(int i=1;i<=pages.getPageNumber();i++){ %>
        
        <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="admin_review.jsp?pageNo=<%=i %>" ><%=i %></a></td>
        <%} %>
	<td style="border-right:1px solid #93ac64;" width="60" align="center"><a href="admin_review.jsp?pageNo=<%=pages.getPageNumber()%>" >最后一页</a></td>
  </tr>
</table></td>
      </tr>
	  <%}%>
</table>			  </td>
			</tr>
			
		
		</table>
		
		
		
		
		</td >
	</tr>
	
</table>
</body>
<script language="javascript">
function confirmdelete(id){
  if(confirm('确定要删除该评论吗？')){
  	location.replace('<%=request.getContextPath()%>/reviewAction.do?method=admindelete&amp;id='+id);
  }
}
</script>
</html>
