<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.bookstore.util.UtilFun"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>今凡网-注册登录</title>

<link href="css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/easy_validator.pack.js"></script>
<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
<style type="text/css">
<!--
input {
	border:1px solid #61861e;font-size:12px;width:280px;height:23px;
}
#reg_sub {
	border:1px solid #61861e;font-size:12px;width:150px;height:29px; background-color:#61861e; color:#FFFFFF;
}
.STYLE7 {
	font-size: 18px;
	color: #FFFFFF;
	font-family: "微软雅黑";
}
.STYLE8 {color: #FFFFFF}
.STYLE10 {color: #999999}

-->
</style>
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
<script type="text/javascript">
var isExtendsValidate = true;	//如果要试用扩展表单验证的话，该属性一定要申明
function extendsValidate(){	//函数名称，固定写法
	
	//密码匹配验证
	if( $('#password').val() == $('#checkpassword').val() ){	//匹配成功
		$('#checkpassword').validate_callback(null,"sucess");	//此次是官方提供的，用来消除以前错误的提示
	}else{//匹配失败
		$('#checkpassword').validate_callback("密码不匹配","failed");	//此处是官方提供的API，效果则是当匹配不成功，pwd2表单 显示红色标注，并且TIP显示为“密码不匹配”
		return false;
	}
}
</script>
</head>

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
        <td width="948" height="527" align="center" valign="top" ><table width="750" border="0" cellspacing="0" cellpadding="0">
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
            <td width="475" height="30" align="left">
			<table border="0" cellpadding="0" cellspacing="0">
			<form action="userAction.do?method=add" method="post" styleId="form1" onsubmit="return checkform()" >
<tr>
	 <td width="101" height="35" align="right">Email：</td>
     <td width="374" height="35" align="left"><input type="text" name="email" id="email" reg="^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" tip="邮箱地址，如wangking717@qq.com"   <%
				String reg_email=null;
				reg_email = (String)session.getAttribute("reg_email");
				if(reg_email!=null){
				   %> value="<%=reg_email%>" <%
				   session.removeAttribute("reg_email");
				   }%> 
	  />&nbsp;<img src="images/tg_reg_right.gif" id="emailimg" style="display:none" width="24" height="21" /></td>
</tr>
<tr>
            <td height="25" align="right">&nbsp;</td>
            <td width="374" align="left" bgcolor="#FFFFFF"><span class="STYLE10">登录及找回密码用不会公开</span></td>
          </tr>
          <tr>
            <td height="10" align="right">&nbsp;</td>
            <td height="10" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="35" align="right">用户名：</td>
            <td height="35" align="left"><input type="text" name="username" id="username" reg="^[\u4e00-\u9fa5\w][\u4e00-\u9fa5\w]{3,15}$" tip="用户名只能使用中文.英文和数字"
			 <%
				String reg_name=null;
				reg_name = (String)session.getAttribute("reg_name");
				if(reg_name!=null){
				   %> value="<%=reg_name%>" <%
				   session.removeAttribute("reg_name");
				   }%> 
			  />&nbsp;<img src="images/tg_reg_right.gif" id="usernameimg" style="display:none" width="24" height="21" /></td>
          </tr>
          <tr>
            <td height="25" align="right">&nbsp;</td>
            <td align="left" bgcolor="#FFFFFF"><span class="STYLE10">4-16个字符，一个汉字为两个字符</span></td>
          </tr>
          <tr>
            <td height="10" align="right">&nbsp;</td>
            <td height="10" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="35" align="right">密码：</td>
            <td height="35" align="left"><input type="password" name="password" id="password" reg="^\w{6,20}$" tip="6-20个字符"
			<%
				String reg_pwd=null;
				reg_pwd = (String)session.getAttribute("reg_pwd");
				if(reg_pwd!=null){
				   %> value="<%=reg_pwd%>" <%
				   
				   }%> 
			   />&nbsp;<img src="images/tg_reg_right.gif" id="passwordimg" style="display:none" width="24" height="21" /></td>
          </tr>
          <tr>
            <td height="25" align="right">&nbsp;</td>
            <td align="left" bgcolor="#FFFFFF"><span class="STYLE10">最少6个字符</span></td>
          </tr>
          <tr>
            <td height="10" align="right">&nbsp;</td>
            <td height="10" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="35" align="right">确认密码：</td>
            <td height="35" align="left"><input type="password" name="checkpassword" id="checkpassword" reg="^\w{6,20}$" tip="6-20个字符，请确认两次密码输入相同"
			<%
				if(reg_pwd!=null){
				   %> value="<%=reg_pwd%>" <%
				   session.removeAttribute("reg_pwd");
				   }%> 
			 />&nbsp;<img src="images/tg_reg_right.gif" id="checkpasswordimg" style="display:none" width="24" height="21" /></td>
          </tr>
          <tr>
            <td height="25" align="right">&nbsp;</td>
            <td align="left" bgcolor="#FFFFFF"><span class="STYLE10">请再次输入密码</span></td>
          </tr>
          <tr>
            <td height="10" align="right">&nbsp;</td>
            <td height="10" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="35" align="right">请输入验证码：</td>
            <td height="35" align="left"><input type="text" name="code" reg="^[a-zA-Z0-9][a-zA-Z0-9]{0,3}$"  /></td>
          </tr>
          <tr>
            <td height="25" align="right">&nbsp;</td>
            <td align="left" bgcolor="#FFFFFF"><span class="STYLE10"><img src="yzm.jsp" name="valiImg" border=0 align="absmiddle" id=valiImg>
        	    <a href="javascript:document.getElementById('valiImg').src='yzm.jsp?'+new Date;void(0);">看不清点击刷新</a> </span></td>
          </tr>
          <tr>
            <td height="20" align="right">&nbsp;</td>
            <td align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="20" align="right">&nbsp;</td>
            <td width="374" height="30" align="left"><input type="submit" id="reg_sub" value="同意以下协议并注册"   style="cursor:hand;"   /></td>
          </tr>
		  </form>
		</table>  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		 
			
			</td>
            <td  align="left" valign="top"><table width="240" border="0" cellpadding="0" cellspacing="0" bgcolor="#91AB62">
			<form action="userAction.do?method=login" method="post" >
              <tr>
                <td height="45" colspan="2">&nbsp;<span class="STYLE7">已有今凡账户</span></td>
                </tr>
              <tr>
                <td width="60" height="30" align="right"><span class="STYLE8">Email:</span></td>
                <td width="180" height="30"><input type="text" name="name2" style="width:160px;"  /></td>
              </tr>
              <tr>
                <td width="60" height="20" align="right">&nbsp;</td>
                <td height="20">&nbsp;</td>
              </tr>
              <tr>
                <td width="60" height="30" align="right"><span class="STYLE8">密码：</span></td>
                <td height="30"><input type="password" name="password2" style="width:160px;" /></td>
              </tr>
              <tr>
                <td width="60" height="20">&nbsp;</td>
                <td height="20">&nbsp;</td>
              </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30"><input type="submit" value="登录" style="border:1px solid #61861e;font-size:12px;width:52px;height:23px; background-color:#61861e; color:#FFFFFF;"  /></td>
              </tr>
              <tr>
                <td width="60" height="140">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
			  </form>
            </table></td>
            </tr>
          
          <tr>
            <td colspan="2">&nbsp;</td>
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

