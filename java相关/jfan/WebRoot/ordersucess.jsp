<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.service.OrderService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Orders"%>
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
<title>����</title>

<link href="css.css" rel="stylesheet" type="text/css" />
</head>
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
Long orderid = (Long)session.getAttribute("orderid");
OrderService orderservice = new OrderService();
Orders order = orderservice.getOrder(orderid);
String sendway = order.getSendway();
%>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><jsp:include page="headss.jsp"  /></td>
  </tr>
  <tr>
    <td height="50"></td>
    <td height="50"><img src="images/tg_dd_3.gif" width="372" height="30" /></td>
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
	<form action="orderAction.do" method="post" > <input type="hidden" name="method" value="addall"  /><input type="hidden" name="ttprice" value="<%=totalprice%>"  />
	<table width="920" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td height="60" align="left" class="order_bottom" >&nbsp;�������ύ���뾡�츶��!</td>
        </tr>
		
	 	<tr>
            <td height="10" align="left" valign="bottom" style="font-size:14px; font-weight:bold" >&nbsp;</td>
        </tr>
	 
      
          <tr>
           
            <td height="35" align="left" style="font-size:14px;  " >���Ķ�����Ϊ��<span style="color:#FF0000; font-weight:bold; font-size:16px;" ><%=10000+orderid%></span>  Ӧ�����:<span style="color:#FF0000; font-weight:bold; font-size:16px;" ><%=order.getNewprice()%></span> ֧����ʽ��֧���� ���ͷ�ʽ��
			<%if(sendway=="1") {  %>
			���
			
			<% }else{ %>
			EMS
			
			<% }%>			</td>
          </tr>
		  
          <tr>
            <td height="50" align="left" style="font-size:14px;" ><strong>����һ��������֧����������24Сʱ�ڸ��������򶩵��ᱻ�Զ�ȡ����</strong></td>
          </tr>
		  
          <tr>
            <td height="100" align="left" bgcolor="#FFFFFF" style="font-size:12px; color:#61861e" ><p>��ʹ������֧��ƽ̨֧����</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="alipayto.jsp?id=<%=userids%>&amp;price=<%=order.getNewprice()%>" ><img src="images/tg_zfb.jpg" width="106" height="40" border="0" align="absmiddle" />[�������֧��]</a></p></td>
          </tr>
          
          <tr>
            <td align="left"  >&nbsp;</td>
          </tr>
          <tr>
            <td height="60" align="left"  >���֧����,������: �鿴 <a href="userorder.jsp" style="font-weight:bold">�ҵĶ���</a> <a href="default.jsp" style="font-weight:bold">��������</a></td>
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
<script language="javascript">
function mailway(id,price){
 var i=0.00;
 var nbs = parseFloat(document.getElementById("gold").value);
 i = price;
 var j=0.00;
 var totalprice = 0.00;
 if( i>=1000 ){
 	totalprice = i+nbs;
 	document.getElementById("yunfei").value = "0.0";
 	document.getElementById("price").value =totalprice;
 }
 if( i<1000 ){
 	if(id==1){ 
		totalprice = i+nbs+30.00;
		document.getElementById("yunfei").value ="30";
		document.getElementById("price").value =totalprice; 
		}
	if(id==2){ 
		totalprice = i+nbs+50.00;
		document.getElementById("yunfei").value ="50";
		document.getElementById("price").value =totalprice; 
	}
 }
}

function duihuan(price,points){
 var i=0.00;
 var nbs = parseFloat(document.getElementById("point").value)/100;
  var nbss = parseFloat(document.getElementById("yunfei").value);
 if(nbs*100>points){
 	alert('������Ľ�����������Ľ���ܶ���������룡');
 }else {
 //var point = parseFloat(document.getElementById("point").value);
 i = price;
 var j=0.00;
 var totalprice = 0.00;
 	totalprice = i-nbs+nbss;
 	document.getElementById("gold").value =nbs ;
 	document.getElementById("price").value =totalprice;
	}
}

</script>



