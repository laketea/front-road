<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.bookstore.po.User"%>
<%@page import="java.util.Collection"%>
<%@page import="com.bookstore.util.Cart"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bookstore.util.CartItem"%>
<link href="css.css" rel="stylesheet" type="text/css">
<script>
function MenuClick(obj){  		
	var tag = 
	document.getElementsByTagName("li")  		
	for (var i=0;i<tag.length;i++ )  		
		{
			tag[i].style.background="#EEE"
	 		obj.style.background ="#000"
		 }  
} 
function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("�����ղ�ʧ�ܣ���ʹ��Ctrl+D�������");
        }
    }
}
</script> 
<%
session.setAttribute("aaa","1");
Collection cis=(Collection)session.getAttribute("ci");
int itemcounts =0;
float totalprices = 0;
if(cis!=null){
	 Cart cs = (Cart)session.getAttribute("cart");
	if(cs!=null){
		itemcounts = cs.getItemCount();
		totalprices = cs.getTotalPrice();
		}
	
	}

 %>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="25" bgcolor="#E6E6E6">&nbsp;</td>
    <td width="1000" height="25" colspan="2" bgcolor="#E6E6E6" style="color:#61861E"><span style="float:left" >&nbsp&nbsp<a href="#" style="color:#61861e;" onclick="AddFavorite('www.baidu.com','����')" >�ղؽ���</a></span>
	
	
	
	<% 
	String userid=null;
	request.getSession();
	try{
	userid=(String)session.getAttribute("userid");
	}catch(Exception e){
	
	}
	
	if (userid == null||"".equals(userid))
	{ 
	 %>
	
	<span style=" float:right">��ӭ����������[<a href="login.jsp">���¼</a>] ���û�? [<a href="reg.jsp">���ע��</a>]</span>
	<%}
	else {
	User user = new User();
	user = (User)session.getAttribute("user");
	%>
	<span style=" float:right"><%=user.getUsername()%> ���ã���ӭ����������[<a href="userorder.jsp">��Ա����</a>] [<a href="loginout.jsp">ע����½</a>]</span>
	<%}
	
	%>
	
	
	
	
	
	
	</td>
    <td height="25" bgcolor="#E6E6E6">&nbsp;</td>
  </tr>
  <tr>
    <td height="90">&nbsp;</td>
    <td width="1000" height="90" colspan="2"><table border="0" cellpadding="0" cellspacing="0" >
      <tr><td><a href="http://www.jfanfan.com"><img src="images/tg_head_2.gif" width="220" height="37" border="0" /></a></td><td width="800" height="70" align="right" valign="middle"><img src="images/default.png" width="694" height="72" /></td>
      </tr></table></td>
    <td height="90">&nbsp;</td>
  </tr>
  <tr>
    <td height="40" bgcolor="#61861e">&nbsp;</td>
    <td width="480" align="left" valign="middle" bgcolor="#61861e">
	<div id="nav">
	<ul>
		<li><a href="default.jsp" style=" background-color:#91ab62;" >��ֵ�Ź�</a></li>
		<li><a href="faq.jsp" > ��������</a></li>
	</ul>
</div>
	
	</td>
    <td width="520" align="right" valign="middle" bgcolor="#61861e"><table width="212" height="22" border="0" align="right" cellpadding="0" cellspacing="0" background="images/tg_cart_1.gif">
  <tr>
    <td width="142" align="center"><a href="cart.jsp" style="color:#000000; font-weight:400; font-family:'΢���ź�'" >���ﳵ<span style="color:#F1A809;"><%=itemcounts%></span>��</a></td>
    <td width="70" align="left">&nbsp;&nbsp;<A href="cart.jsp" style="color:#FFFFFF; font-family:΢���ź�;" >ȥ����</A></td>
  </tr></table></td>
    <td bgcolor="#61861e">&nbsp;</td>
  </tr>
  <tr>
    <td height="20">&nbsp;</td>
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

