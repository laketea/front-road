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
<title>����-�ҵĶ���</title>

<link href="css.css" rel="stylesheet" type="text/css" />

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


<%
User user=null;
user=(User)session.getAttribute("user");
String userids = null;
userids = (String)session.getAttribute("userid");
if(userids == null||userids.equals(""))
{
	response.sendRedirect("login.jsp");
	return;
}
int pageNo= 1;
try{
pageNo=Integer.parseInt(request.getParameter("pageNo"));
}catch(Exception e){
}
int pageSize = 10;
String id = request.getParameter("id");
if(id == null||id.equals(""))
{
	id="1";
}
String userid = user.getId().toString();
OrderService services = new OrderService();
int totalCount = 0;
List result=null;
if(id.equals("1")){
totalCount = services.getFavCount(userid);
result = services.getOrderListByPage(pageSize,pageNo,userid); 
}else if(id.equals("2")) {
totalCount = services.getPayCount(userid);
result = services.getPayOrderListByPage(pageSize,pageNo,userid); 
}else {
totalCount = services.getPayCounts(userid);
result = services.getPayOrderListByPages(pageSize,pageNo,userid); 
}
int totalPage = totalCount/pageSize+(totalCount%pageSize==0?0:1);

%>
<script language="javascript">
//��ʼ��
var def="<%=id%>";
function mover(object){
  //���˵�
  var mm=document.getElementById("m_"+object);
  mm.className="m_li_a";
  //��ʼ���˵�����Ч��
  if(def!=0){
    var mdef=document.getElementById("m_"+def);
    mdef.className="m_li";
  }
  //�Ӳ˵�
 
}
function mout(object){
  //���˵�
  var mm=document.getElementById("m_"+object);
  mm.className="m_li";
  //��ʼ���˵�
  if(def!=0){
    var mdef=document.getElementById("m_"+def);
    mdef.className="m_li_a";
  }
}
</script>
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
    <td width="1000" height="35" valign="bottom">
      <table height="29" border="0" cellpadding="0" cellspacing="0">
        <tr>
		<td width="10" height="29" align="center" valign="middle" ></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_1.gif"><a href="userorder.jsp"  >�ҵĶ���</a></td>
		  <td width="10" height="29" align="center" valign="middle" ></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="usergold.jsp" style="color:#FFFFFF" >�ҵĽ��</a></td>
		  <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="useraccount.jsp" style="color:#FFFFFF" >�ҵ��˻�</a></td>
		  <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="usersuggest.jsp" style="color:#FFFFFF" >��ϵ����Ա</a></td>
        </tr>
      </table>
    </td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" align="center" valign="top" class="de_table"><table width="920" height="0" border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family:΢���ź�" >
      <tr>
        <td height="10" colspan="4"></td>
        </tr>
	 
		
          <tr >
            <td width="18" height="50" align="left" valign="bottom" class="cart_bottom"   >&nbsp;&nbsp;&nbsp;&nbsp;<a href="useraddress.jsp" class="user_pwd" ></a></td>
            <td width="688" height="50" align="left" valign="bottom" class="cart_bottom"   ><a href="userorder.jsp" class="user_pwd" >�ҵĶ���</a>  &nbsp;&nbsp;<a href="userreview.jsp" class="user_pwd" style=" color:#61861E;" >�ҵ�����</a> </td>
            <td width="200" align="right" valign="bottom" class="cart_bottom"   >
			<div id="menu_tgg">
  <ul>
    <li id="m_1" <%if(Integer.valueOf(id)==1){ %> class='m_li_a'<%} else {%>class='m_li' onmouseover='mover(1);' onmouseout='mout(1);'<%}%> ><a href="userorder.jsp?id=1">ȫ��</a></li>
    <li id="m_2" <%if(Integer.valueOf(id)==2){ %> class='m_li_a'<%} else {%>class='m_li' onmouseover='mover(2);' onmouseout='mout(2);'<%}%> ><a href="userorder.jsp?id=2">�Ѹ���</a></li>
    <li id="m_3" <%if(Integer.valueOf(id)==3){ %> class='m_li_a'<%} else {%>class='m_li' onmouseover='mover(3);' onmouseout='mout(3);'<%}%> ><a href="userorder.jsp?id=3">δ����</a></li>
  </ul>
</div>
			</td>
            <td width="14" height="50" align="left" valign="bottom" class="cart_bottom"  ></td>
          </tr>
       		
          <tr>
            <td height="20">&nbsp;</td>
            <td height="20" colspan="2">&nbsp;</td>
            <td height="20">&nbsp;</td>
          </tr>
		
          <tr>
            <td align="right" >&nbsp;</td>
            <td colspan="2" align="left" valign="top" style="font-size:18px; font-weight:bold " ><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <tr>
                <td width="480" height="60" style="font-size:16px; font-weight:bold ">&nbsp;&nbsp;������Ʒ</td>
                <td width="140" align="center" style="font-size:16px; font-weight:bold ">�ܼ�</td>
                <td width="140" align="center" style="font-size:16px; font-weight:bold ">����״̬</td>
                <td width="120" align="center" style="font-size:16px; font-weight:bold ">����</td>
              </tr>
			   <%
		//Collection ci = (Collection)request.getSession().getAttribute("ci");
		int j=1;
		for(int i=0;i<result.size();i++){
				Orders orders  =(Orders)result.get(i);
				List orderitem = services.getOrderItemList(orders.getId().toString());
				j=(new Dateutil()).getStatusInt(orders);
				
				//long s=(new Dateutil()).getDays(orders.getOrderdate().toString(),new Date(new java.util.Date().getTime()).toString());
		%>
			  
              <tr <%if((i+1)%2==1){ %> 
			  style="background-color:#DFEBC8"
			   <%}%>>
                <td height="50">&nbsp;&nbsp;[<%= 10000+orders.getId()%>]<a href="orderdetail.jsp?id=<%=orders.getId()%>" >
                  <%if(orderitem.size()>0) {%>  <%=((OrderItem)orderitem.get(0)).getGodsname()%>&nbsp; 
                <% if(orderitem.size()>1) {%>���ȣ�<% } %> <% }%></a></td>
                <td height="50" align="center"><%=orders.getNewprice()%></td>
                <td height="50" align="center"><%=(new Dateutil()).getStatus(orders)%></td>
                <td height="50" align="center">
                
				<% if(j==1){%>
				<a href="alipayto.jsp?id=<%=orders.getId()%>&amp;price=<%=orders.getNewprice()%>" >����</a>
				<a href="<%=request.getContextPath()%>/orderAction.do?method=delete&amp;id=<%=orders.getId()%>" >ȡ������</a>
				<%}else if(j==2){%>
				<a href="<%=request.getContextPath()%>/orderAction.do?method=delete&amp;id=<%=orders.getId()%>" >ɾ��</a>
				<%}else if(j==5){%>
				<a href="<%=request.getContextPath()%>/orderAction.do?method=received&amp;id=<%=orders.getId()%>" >ȷ���ջ�</a>
				<%}else if(j==4){%>
				<a href="<%=request.getContextPath()%>/orderAction.do?method=delete&amp;id=<%=orders.getId()%>" >ɾ��</a>&nbsp;<a href="orderreview.jsp?id=<%=orders.getId()%>" >����</a>
				<%}else {%>
				<a href="<%=request.getContextPath()%>/orderdetail.jsp?id=<%=orders.getId()%>" >�鿴</a>
				<% }%>
				
				</td>
              </tr>
			   <%}%>  
            </table></td>
            <td >&nbsp;</td>
          </tr>
        
        
        <tr>
          <td height="35">&nbsp;</td>
          <td height="35" colspan="2" align="right" >
		  <table  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style=" border-bottom: 1px solid #93ac64;border-left: 1px solid #93ac64;border-top: 1px solid #93ac64; margin-right:50">
  <tr>
  <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="userorder.jsp?pageNo=1&amp;id=<%=id %>" >��ҳ</a></td>
  <%for(int i=1;i<=totalPage;i++){ %>
        
        <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="userorder.jsp?pageNo=<%=i %>&amp;id=<%=id %>" ><%=i %></a></td>
        <%} %>
	<td style="border-right:1px solid #93ac64;" width="60" align="center"><a href="userorder.jsp?pageNo=<%=totalPage%>&amp;id=<%=id %>" >���һҳ</a></td>
  </tr>
</table>
		  
		  
		  </td>
          <td height="35">&nbsp;</td>
        </tr>
        <tr>
        <td height="30" colspan="4">&nbsp;</td>
        </tr>
		
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



