<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.service.OrderService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Orders"%>
<%@page import="com.bookstore.po.Address"%>
<%@page import="com.bookstore.po.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.util.UtilFun"%>
<%@page import="com.bookstore.util.Page"%>
<%@page import="com.bookstore.util.Dateutil"%>
<%@page import="java.util.Collection"%>
<%@page import="com.bookstore.util.Cart"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bookstore.util.CartItem"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>今凡网-我的订单</title>

<link href="css.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style></head>

<%
User user=null;
user=(User)session.getAttribute("user");
String userids = null;
userids = (String)session.getAttribute("userid");
if(userids == null||"".equals(userids))
{
	response.sendRedirect("login.jsp");
	return;
}
String id = request.getParameter("id");
if(id == null||"".equals(id))
{
	id="1";
}
OrderService services = new OrderService();
List  result= services.getOrderItemList(id);
Orders orders = services.getOrder(Long.valueOf(id));

%>


<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><jsp:include page="headss.jsp"  /></td>
  </tr>
  <tr>
    <td height="20"></td>
    <td height="20">&nbsp;</td>
    <td height="20"></td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td height="53" align="left" valign="middle" bgcolor="#91AB62" class="de_table">&nbsp;&nbsp;<span style="font-size:14pt; font-family:'微软雅黑'; color:#000000;">商品评价</span>&nbsp;<span style="font-family:'微软雅黑'; font-size:10pt; color:#4D4D4D;">对商品质量进行评价</span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" height="200" align="center" valign="top" class="de_dfF_table"><table width="960" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" align="center">&nbsp;</td>
        <td height="10" align="center">&nbsp;</td>
        <td height="10" align="center">&nbsp;</td>
        <td height="10" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td width="120" height="50" align="center" class="review_font_a">商品编号</td>
        <td width="550" align="center" class="review_font_a">商品名称</td>
        <td width="150" align="center" class="review_font_a">购买时间</td>
        <td width="140" align="center" class="review_font_a">评价</td>
      </tr>
	   <%
		//Collection ci = (Collection)request.getSession().getAttribute("ci");
		for(int i=0;i<result.size();i++){
				OrderItem oitem  =(OrderItem)result.get(i);
				%>
      <tr>
        <td height="40" align="center" class="review_font_black" style=""><%=Long.valueOf(oitem.getGodsid())+10000%></td>
        <td align="center" class="review_font_yellow"><%=oitem.getGodsname()%></td>
        <td align="center" class="review_font_black"><%=orders.getOrderdate()%></td>
        <td align="center" class="review_font_yellow">
		<%
		if(oitem.getStatus()==0){
		%><a href="review.jsp?id=<%=oitem.getId()%>" style="font-size:14pt; font-family:'微软雅黑'; color:#61861E;" >发表评价</a>
		<%}else {%>
		<a href="userreview.jsp" style="font-size:14pt; font-family:'微软雅黑'; color:#61861E;" >查看评价</a>
		<%}%>	/<%=oitem.getStatus()%>/<%=oitem.getId()%>	</td>
      </tr>
	  <%}%>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000"><jsp:include page="bottom.jsp"  /></td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>



