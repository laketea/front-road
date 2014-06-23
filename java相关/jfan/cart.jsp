<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
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
<title>今凡网</title>

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
.STYLE1 {color: #FFFFFF}
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

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><jsp:include page="headss.jsp"  /></td>
  </tr>
  <tr>
    <td height="50"></td>
    <td height="50"><img src="images/tg_dd_1.gif" width="372" height="30" /></td>
    <td height="50"></td>
  </tr>
  <tr>
    <td height="10"></td>
    <td width="1000" height="10"></td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" align="center" valign="top" id="main">
	<%if(ci!=null&&itemcount>0){
			%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td width="20" height="29" background="images/tg_cart_bg.gif">&nbsp;</td>
        <td width="470" align="left" background="images/tg_cart_bg.gif">&nbsp;&nbsp;&nbsp;产品</td>
        <td width="150" align="center" background="images/tg_cart_bg.gif">数量</td>
        <td width="120" align="center" background="images/tg_cart_bg.gif">单价</td>
        <td width="140" align="center" background="images/tg_cart_bg.gif">总价</td>
        <td width="100" align="center" background="images/tg_cart_bg.gif">操作</td>
        <td background="images/tg_cart_bg.gif">&nbsp;</td>
      </tr>
		
			<% 
			
			Iterator<CartItem> it= ci.iterator();
			while(it.hasNext()){
			CartItem cartItem = it.next();
			%>
		<form action="cartAction.do?method=update&amp;Godsid=<%=cartItem.getGods().getId()%>" method="post" name="cartForm">
          <tr >
            <td height="105" valign="middle"   >&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td height="105" align="left" valign="middle" class="cart_bottom"   >&nbsp;&nbsp;<img src="files/<%=cartItem.getGods().getMinphoto()%>" width="100" height="60" align="absmiddle" />&nbsp;&nbsp;<%=cartItem.getGods().getName()%></td>
            <td height="105" align="center" valign="middle" class="cart_bottom" >&nbsp;
              <input type="text" name="count" value="<%=cartItem.getCount()%>" size="3" style="font-family:微软雅黑; font-size:14px" />
            <input name="submit" type="submit" id="cart_sub" value="" /></td>
            <td height="105" align="center" valign="middle" class="cart_bottom"><%=cartItem.getGods().getNewprice()%></td>
            <td height="105" align="center" valign="middle" class="cart_bottom" ><%=cartItem.getItemPrice() %></td>
            <td height="105" align="center" valign="middle" class="cart_bottom" ><a href="#" onClick="confirmdelete(<%=cartItem.getGods().getId() %>)" title="删除"><img src="images/cart_del.jpg" width="29" height="25" border="0" align="middle" /></a></td>
            <td height="105" align="left" valign="middle"  ></td>
          </tr>
        </form>
          <%
						}
					
				 %>  
      
      <tr>
        <td height="47">&nbsp;</td>
        <td height="47" class="cart_bottom">&nbsp;</td>
        <td height="47" align="center" class="cart_bottom">&nbsp;</td>
        <td height="47" align="center" class="cart_bottom">&nbsp;</td>
        <td height="47" colspan="2" align="center" class="cart_bottom">应付总额（不含运费）：
          <%if(ci!=null) {%> 
          <%=totalprice%> 
          <% }%></td>
        <td height="47">&nbsp;</td>
      </tr>
      <tr>
        <td height="110">&nbsp;</td>
        <td height="110">&nbsp;</td>
        <td height="110" align="center">&nbsp;</td>
        <td height="110" align="center">&nbsp;</td>
        <td height="110" colspan="2" align="center"><a href="default.jsp"><img src="images/tg_cart_2.gif" width="89" height="35" border="0" /></a><a href="orderAction.do?method=checklogin"><img src="images/tg_cart_3.gif" width="95" height="35" border="0" /></a></td>
        <td height="110">&nbsp;</td>
      </tr>
    </table>
	
	<% }else{  %>
	
	<table width="100%" height="158" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td height="29">&nbsp;&nbsp;</td>
        </tr>
		
			<tr>
			  <td height="35" align="left" style="font-size:14px;">&nbsp;&nbsp;&nbsp;您的购物车中还没有商品 ，赶快去挑选吧！ </td>
			</tr>
         
      
      <tr>
        <td height="47" align="left" >&nbsp;&nbsp;&nbsp;<a href="http://www.jfanfan.com" style="width:300px; height:35px; background-color:#91861e; border:none;" ><img src="images/tg_onclik.jpg" border="0" /></a></td>
        </tr>
      <tr>
        <td height="47"></td>
      </tr>
    </table>
	
	
	
	<%  } %>
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
<script language="javascript">
function confirmdelete(bookid){
  if(confirm('确定要从购物车中删除该图书吗？')){
  	location.replace('<%=request.getContextPath()%>/cartAction.do?method=del&amp;Godsid='+bookid);
  }
}

</script>


