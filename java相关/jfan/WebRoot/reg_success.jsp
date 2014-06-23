<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>今凡网-注册成功</title>

<link href="css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
input {
	border:1px solid #61861e;font-size:12px;width:280px;height:23px;
}
#reg_sub {
	border:1px solid #61861e;font-size:12px;width:150px;height:29px; background-color:#61861e; color:#FFFFFF;
}
.STYLE9 {
	color: #638821;
	font-weight: bold;
	font-family: "微软雅黑";
	font-size: 16px;
}
.STYLE10 {color: #638821}
.STYLE11 {
	font-size: 16px;
	color: #638821;
	font-weight: bold;
	font-family: "黑体";
}
.STYLE12 {
	color: #668821;
	font-size: 16px;
	font-weight: bold;
	font-family: "黑体";
}
-->
</style>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><jsp:include page="headss.jsp"  /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" height="200" align="center" valign="top" id="main"><table width="750" border="0" cellspacing="0" cellpadding="0">
           <tr>
            <td height="25" colspan="3" align="left" valign="top"></td>
        </tr>
          <tr>
		    <td height="50" colspan="3" align="center" valign="middle" ><img src="images/tg_reg_ss.jpg" width="49" height="42" align="absmiddle" />&nbsp;<span class="reg_font_1">恭喜您，注册成功！</span></td>
	    </tr>
		  <tr>
            <td height="10" colspan="3" align="left" valign="top" class="reg_xh">&nbsp;</td>
        </tr>
          <tr>
            <td height="35" colspan="3" align="left" valign="bottom"><span class="STYLE11">&nbsp;&nbsp;您的用户名为</span></td>
          </tr>
          
          <tr>
            <td height="35" colspan="3" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE12">您随时可以使用此用户名登录今凡享受便宜放心的购物乐趣</span></td>
          </tr>
		  <tr>
            <td height="80" colspan="3" align="center"><div id="reg_content" ><a href="default.jsp" >立刻去购物</a></div></td>
          </tr>
		  <tr>
		    <td height="10" colspan="3" align="center">&nbsp;</td>
	    </tr>
		  
          <tr>
            <td width="75" height="100" rowspan="4" align="left">&nbsp;</td>
            <td width="600" height="38" align="left" bgcolor="#e6e6e6">&nbsp;<span class="STYLE9">账户安全校验</span></td>
            <td width="75" rowspan="4" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" bgcolor="#E6E6E6">&nbsp;&nbsp;<span class="STYLE10">验证邮箱可保护您的账户安全，帮助您快速找回密码，并可接收订单处理等信息。</span></td>
          </tr>
          <tr>
            <td height="22" align="left" bgcolor="#E6E6E6">&nbsp;&nbsp;<span class="STYLE10">点击此处进入邮箱验证！</span></td>
          </tr>
          <tr>
            <td height="18" align="left" bgcolor="#E6E6E6">&nbsp;</td>
          </tr>
          
          <tr>
            <td height="57" colspan="3">&nbsp;</td>
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

