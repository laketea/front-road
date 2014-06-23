<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.service.OrderService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.util.UtilFun"%>
<%@page import="com.bookstore.util.Page"%>
<%@page import="java.util.Collection"%>
<%@page import="com.bookstore.util.Cart"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bookstore.util.CartItem"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>今凡网-我的金币</title>

<link href="css.css" rel="stylesheet" type="text/css" />
<SCRIPT language=Javascript>
			<!--
				var initialTimeElement = new Array();
				var showTimeElement = new Array();
				
				initialTimeElement[0] = 0.1;					
				showTimeElement[0] = "leftTime0";		
				
			 //-->
    </SCRIPT>
<style type="text/css">
<!--
.STYLE2 {
	color: #759737;
	font-size: 16px;
}
-->
</style></head>
<%
//User user=null;
//user=(User)session.getAttribute("user");
Collection ci = (Collection)request.getSession().getAttribute("ci");
int itemcount =0;
float totalprice = 0;
if(ci!=null){
	 Cart c = (Cart)session.getAttribute("cart");
	if(c!=null){
		itemcount = c.getItemCount();
		totalprice = c.getTotalPrice();
		}
	
	}

 %>


<%
String userids = null;
userids = (String)session.getAttribute("userid");
if(userids == null||userids.equals(""))
{
	response.sendRedirect("login.jsp");
	return;
}
User user=null;
user=(User)session.getAttribute("user");
OrderService services = new OrderService();
int totalCount = services.getPayCounts(userids);


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
    <td height="10"></td>
    <td width="1000" height="35" valign="bottom"><table height="29" border="0" cellpadding="0" cellspacing="0">
        <tr>
		<td width="10" height="29" align="center" valign="middle" ></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="userorder.jsp" style="color:#FFFFFF"  >我的订单</a></td>
		  <td width="10" height="29" align="center" valign="middle" ></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_1.gif"><a href="usergold.jsp"  >我的金币</a></td>
		  <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="useraccount.jsp" style="color:#FFFFFF" >我的账户</a></td>
		  <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="usersuggest.jsp" style="color:#FFFFFF" >联系管理员</a></td>
        </tr>
    </table></td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" align="center" valign="top" class="de_table"><table width="0" height="0" border="0" cellpadding="0" cellspacing="0" style="font-size:24px; font-family:微软雅黑" >
      <tr>
        <td height="60" colspan="3"></td>
        </tr>
       		<html:form action="/userAction"  styleId="form1" onsubmit="return checkform()"  > <html:hidden property="method" value="account" />
          <tr>
            <td width="650" height="100" align="center" bgcolor="#DAEDB9"><span class="STYLE2">您有 <%=totalCount%> 个未完成的订单，完成订单 赢得金币</span></td>
            <td width="30" rowspan="4">&nbsp;</td>
            <td width="271" rowspan="4" align="left" valign="top"><img src="images/tg_gold_ts.gif" width="271" height="269" /></td>
          </tr>
          
          <tr>
            <td width="650" height="60" align="right" style="font-size:20px; color:#61861e">&nbsp;</td>
            </tr>
        <tr>
        <td width="650" height="60" align="center" style="font-size:20px; color:#000000; ">您当前的金币数量为  <%=user.getPoint()%> 个</td>
        </tr>
        <tr>
          <td width="650" height="70">&nbsp;</td>
          </tr>
        <tr>
        <td height="30" colspan="3">&nbsp;</td>
        </tr>
		</html:form>
    </table>
    </td>
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



