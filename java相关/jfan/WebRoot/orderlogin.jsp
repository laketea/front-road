<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.bookstore.util.UtilFun"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>今凡网-登录注册</title>

<link href="css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
input {
	border:1px solid #61861e;font-size:12px;width:280px;height:23px;
}
#reg_sub {
	border:1px solid #61861e;font-size:12px;width:150px;height:29px; background-color:#61861e; color:#FFFFFF;
}
-->
</style>
</head>
<script language="javascript1.2">
function showsubmenu()
{
whichEl = eval("submenu");
if (whichEl.style.display == "none")
{
eval("submenu.style.display='';");
}
else
{
eval("submenu.style.display='none';");
}
}
</script>

<body>
<jsp:include page="head.jsp"  />
<% 
String argtext = null;
String arg = request.getParameter("arg");
if(arg==null||"".equals(arg)){ 
 }else {
 %>
<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center" id="submenu" style="font-size:14px; display=''" > 
<tr>
	<td bgcolor="#E6E6E6">&nbsp;</td>
	<td width="800"  height="30" align="left" valign="middle"  bgcolor="#E6E6E6"  >  <img src="images/tg_yz_1.gif" width="19" height="18" align="absmiddle" />&nbsp;<%=UtilFun.getArgtext(arg)%></td>
	<td width="200" align="right" valign="middle" bgcolor="#E6E6E6">
	<a href="#" style="font-size:12px" onClick="showsubmenu()" >关闭</a>&nbsp;<img src="images/tg_yz_2.gif" width="7" height="8" border="0" align="absmiddle" /></td>
	<td bgcolor="#E6E6E6">&nbsp;</td>
  </tr>
</table>
  <% } %>
<table width="100%" border="0" cellpadding="0" cellspacing="0">

  <tr>
    <td height="20" colspan="3"></td>
	
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" height="200" align="center" valign="top" id="main"><table width="980" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3"></td>
      </tr>
	   <tr>
        <td colspan="3" height="20"><img src="images/tg_zhanwei.gif" /></td>
      </tr>
      <tr>
        <td height="300" rowspan="3" align="center" valign="top">&nbsp;</td>
        <td width="948" height="400" align="center" valign="top" ><table width="750" border="0" cellspacing="0" cellpadding="0">
           <tr>
            <td height="10" colspan="2" align="left" valign="top"></td>
            </tr>
          <tr>
		    <td height="35" colspan="2" align="left" valign="bottom" >&nbsp;<span class="reg_font_1">请注册或登录 </span><span class="reg_font_2">快速注册，只需要30秒</span></td>
		    </tr>
		  <tr>
            <td height="17" colspan="2" align="left" valign="top" class="reg_xh">&nbsp;</td>
            </tr>
          <tr>
            <td height="35" colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td width="450" height="30" align="left">
			  
		  
		  
		  
		  
		  <% String orderid = request.getParameter("orderid");
		  
		  
		    %>
		  <table width="448" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
			<form action="userAction.do" method="post" >
			<input type="hidden" value="cartlogin" name="method"  />
              <tr>
                <td height="45" colspan="2">&nbsp;</td>
                </tr>
              <tr>
                <td width="136" height="30" align="right"><span style="font-family:'微软雅黑'; font-size:18px">Email/用户名：</span></td>
                <td width="312" height="30"><input type="text" name="name2" style="width:250px; height:30" onFocus="this.style.borderColor='#0066CC'" onBlur="this.style.borderColor='#61861e'" <%
				String login_name=null;
				login_name = (String)session.getAttribute("login_name");
				if(login_name!=null){
				   %> value="<%=login_name%>" <%
				   session.removeAttribute("login_name");
				   }%>   /></td>
              </tr>
              <tr>
                <td width="136" height="20" align="right">&nbsp;</td>
                <td height="35">&nbsp;</td>
              </tr>
              <tr>
                <td width="136" height="30" align="right"><span style="font-family:'微软雅黑'; font-size:18px">密码：</span></td>
                <td height="30"><input type="password" name="password2" style="width:250px; height:30" onFocus="this.style.borderColor='#0066CC'" onBlur="this.style.borderColor='#61861e'" /></td>
              </tr>
              <tr>
                <td width="136" height="20">&nbsp;</td>
                <td height="20">&nbsp;</td>
              </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="35"><input type="submit" value="登录" style="border:1px solid #61861e;font-size:12px;width:52px;height:23px; background-color:#61861e; color:#FFFFFF;"  /></td>
              </tr>
              <tr>
                <td width="136" height="33">&nbsp;</td>
                <td>您也可以用合作网站帐号登录今凡网</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="25"><a href="alipay_to_login.jsp"><img src="images/alipay_login.gif" width="107" height="18" border="0" /></a></td>
              </tr>
              <tr>
                <td height="12">&nbsp;</td>
                <td height="100">&nbsp;</td>
              </tr>
			  </form>
            </table>
		  
		  
		  
		  
		  
		  
		 
			
			</td>
            <td width="300"  align="center" valign="top"><table width="205" border="0" cellpadding="0" cellspacing="0">
			<form action="userAction.do?method=add" method="post" >
<tr>
	 <td height="40" colspan="2" align="right">&nbsp;</td>
     </tr>
<tr>
  <td height="88" colspan="2" align="center" valign="middle" class="de_table"><p style="font-size:12pt; font-family:'微软雅黑'">还没有今凡账户？</p>
    <a href="reg.jsp"><img src="images/tg_reg_22.png" width="89" height="23" border="0" /></a></td>
</tr>
		  </form>
		</table></td>
            </tr>
          
          <tr>
            <td height="5" colspan="2"></td>
            </tr>
        </table></td>
        <td rowspan="3" align="center" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
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
<script language="javascript">    
/*在文字上使验证码刷新 */  
function reloadImage(url)  
{    
var img = document.getElementById("pic");    
img.src="<%= request.getContextPath()%>"+"/test.jsp?"+Math.random();
      
}    

