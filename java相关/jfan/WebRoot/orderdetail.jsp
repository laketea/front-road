<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.service.OrderService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Orders"%>
<%@page import="com.bookstore.po.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.util.UtilFun"%>
<%@page import="com.bookstore.util.Page"%>
<%@page import="java.util.Collection"%>
<%@page import="com.bookstore.util.Cart"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bookstore.util.CartItem"%>
<%@page import="com.bookstore.po.Address"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>今凡网</title>

<link href="css.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE2 {color: #F0F0F0}
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
User user=null;
user=(User)session.getAttribute("user");
String userids = null;
userids = (String)session.getAttribute("userid");
if(userids == null||userids.equals(""))
{
	response.sendRedirect("login.jsp");
}

long id = Long.valueOf((String)request.getParameter("id"));

OrderService orderservice = new OrderService();
UserService usservice = new UserService();
Orders order = orderservice.getOrder(id);
List list = null;
String orderid=String.valueOf(id);
list = orderservice.getOrderItemList(orderid);
Address add = usservice.getAddress(order.getAddid());
String payway=null;
if((order.getPayway()).equals("1")){
	payway="快递";
}else {
	payway="邮递";
}
%>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><jsp:include page="headss.jsp"  /></td>
  </tr>
  <tr>
    <td height="20"></td>
    <td height="20"></td>
    <td height="20"></td>
  </tr>
  <tr>
    <td height="10"></td>
    <td width="1000" height="10"></td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" align="center" valign="top" id="main">
	<form action="orderAction.do" method="post" > <input type="hidden" name="method" value="addall"  /><input type="hidden" name="ttprice" value="<%=totalprice%>"  />
	<table width="920" border="0" cellspacing="0" cellpadding="0" >
	
      <tr>
        <td height="60" align="center" class="order_bottom" >&nbsp;订单详情</td>
        </tr>
		<tr>
		  <td height="15" align="left" valign="middle"  >&nbsp;</td>
		  </tr>
		<tr>
            <td height="25" align="left" valign="middle" bgcolor="#E6E6E6" >订单编号：[<%=10000+order.getId()%>] [<%=UtilFun.getFlag(order.getPayflag())%>付款]&nbsp;&nbsp;[<%=UtilFun.getFlag(order.getSendflag())%>发货] 
			<%if(Integer.valueOf(order.getPayflag().trim())==0) {%><a href="alipayto.jsp?id=<%=order.getId()%>&amp;price=<%=order.getNewprice()%>" >[点击进入支付]</a><%}%>
			</td>
          </tr>
		  
	 	<tr>
            <td height="45" align="left" valign="bottom" style="font-size:14px; font-weight:bold" >收货人信息</td>
        </tr>
	 
     
          <tr>
           
            <td height="35" align="left" style="font-size:14px;  " ><%=add.getName()+","+add.getProvince()+" "+add.getCity()+" "+add.getArea()+" "+add.getStreet()+","+add.getZipcode()+","+add.getMobile()%></td>
          </tr>
          <tr>
            <td height="10" class="order_bottom">&nbsp;</td>
          </tr>
          <tr align="left">
            <td height="45" style="font-size:14px; font-weight:bold" >支付及快递物流信息</td>
        </tr>
          <tr>
            <td align="left"  ><table width="650" border="0" cellspacing="0" cellpadding="0" style="">
            <tr>
              <td width="97" height="25" align="right">支付方式：</td>
              <td width="553" height="25" align="left">
			  &nbsp;&nbsp;支付宝</td>
            </tr>
            <tr>
              <td height="25" align="right">快递方式：</td>
              <td height="25" align="left">&nbsp;&nbsp;<%=payway%></td>
            </tr>
            <tr>
              <td height="25" align="right">运费：</td>
              <td height="25" align="left">&nbsp;&nbsp;<%=order.getMailprice()%></td>
            </tr>
			<% if((order.getSendflag()).equals("1")){ %>
            <tr>
              <td height="25" align="right">收货地址：</td>
              <td height="25" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td height="25" align="right">物流公司</td>
              <td height="25" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td height="25" align="right">运单号：</td>
              <td height="25" align="left">&nbsp;&nbsp;</td>
            </tr>
			<% } %>
          </table></td>
          </tr>
          <tr>
            <td height="30" class="order_bottom"  >&nbsp;</td>
          </tr>
          <tr align="left">
            <td height="45" style="font-size:14px; font-weight:bold"  >商品清单</td>
        </tr>
          <tr>
            <td align="center" valign="top"  ><table width="850" border="0" cellpadding="0" cellspacing="0" class="order_gods_table">
              <tr>
                <td width="30" height="35" bgcolor="#E6E6E6" class="order_gods_table_three">&nbsp;</td>
                <td width="370" align="left" bgcolor="#E6E6E6" class="order_gods_table_three">商品名称</td>
                <td width="150" align="center" bgcolor="#E6E6E6" class="order_gods_table_three">今凡价</td>
                <td width="150" align="center" bgcolor="#E6E6E6" class="order_gods_table_three">赠送金币</td>
                <td width="150" align="center" bgcolor="#E6E6E6" class="order_gods_table_three">商品数量</td>
              </tr>
			   <%
			   Long userpoint=new Long("0");
			for(int i=0;i<list.size();i++){
	OrderItem orderitem  =(OrderItem)list.get(i);
			%>
			  
              <tr>
                <td height="32">&nbsp;</td>
                <td align="left"><%=orderitem.getGodsname()%></td>
                <td align="center"><%=orderitem.getGodsprice()%></td>
                <td align="center"><%=orderitem.getPoints()*(Integer.valueOf(orderitem.getGodsnum()))%></td>
                <td align="center"><%=orderitem.getGodsnum()%></td>
              </tr>
			   <%
			   
					}
				 %>  
            </table></td>
          </tr>
          <tr>
            <td height="25" class="order_bottom"  >&nbsp;</td>
          </tr>
          <tr align="left">
            <td height="45" style="font-size:14px; font-weight:bold"  >结算信息</td>
        </tr>
          <tr>
            <td align="center"  ><table width="850" border="0" cellpadding="0" cellspacing="0" class="order_gods_table">
              <tr>
                <td width="30" height="35" bgcolor="#E6E6E6" class="order_gods_table_three">&nbsp;</td>
                <td align="left" bgcolor="#E6E6E6" class="order_gods_table_three">商品金额：<%=order.getTotalprice()%>元  + 运费：
				
				<input type="text" name="yunfei" value="<%=order.getMailprice()%>" id="yunfei" style="background-color:#E6E6E6; border:none;width:30px; height:17px" readonly="true"  />元
				
				
				  - 金币:<input type="text" name="gold" value="<%=(order.getUserpoint())/100%>" id="gold" style="background-color:#E6E6E6; border:none;width:30px; height:17px; padding-bottom:0px;" readonly="true"  />元</td>
                <td width="30" align="left" bgcolor="#E6E6E6" class="order_gods_table_three">&nbsp;</td>
              </tr>
			  
              <tr>
                <td height="32">&nbsp;</td>
                <td height="70" align="right">支付总额:￥ 
                  <input type="text" name="newprice" id="price" value="<%=order.getNewprice()%>" style="background-color:#fff; border:none;width:50px; height:17px; font-weight:bold" readonly="true"  /> 元
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td width="30" align="center">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="60" align="right"  ></td>
          </tr>
          <tr>
            <td height="30"  ></td>
          </tr>
          <tr>
            <td height="30"  ></td>
          </tr>
        <tr>
        <td height="30"  ></td>
        </tr>
    </table>
	</form>
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



