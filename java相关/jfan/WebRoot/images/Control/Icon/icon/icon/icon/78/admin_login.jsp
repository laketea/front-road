<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>后台管理系统</title>
<style type="text/css">
<!--
body { font-size: 12px;  line-height: 130%;  color: #000; background: #fff; }
td { font-size: 12px; }
input { color: 333333; }
.input { color: #333333; height: 20px; padding-top: 2px; padding-left: 3px; border: 1px #999999 solid; background-image: url("images/inputbg.gif");}
.button {border: 2px outset; height: 25px; color: 333333; }
a:link {
	color: #000000;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000000;
}
a:hover {
	text-decoration: underline;
	color: #000000;
}
a:active {
	text-decoration: none;
	color: #000000;
}
-->
</style>
</head>
<body>
<br><br><br><br>
<table border="0" cellspacing="1" cellpadding="1" align="center" bgcolor="#CCCCCC" width="500">
  <tr bgcolor="#FFFFFF"> 
    <td>
      <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td><img src="images/1.jpg" width="500" height="129"></td>
        </tr>
      </table>
      <table width="500" border="0" cellspacing="0" cellpadding="0" align="center" background="images/3.jpg" height="153">
        <tr>
          <td width="10"></td>
          <td width="158" background="images/2.jpg">&nbsp;</td>
          <td align="center" valign="middle"> 
          <form name="AdminForm" method="post" action="admin_logins.jsp" onSubmit="return   validateOrderForm(this) ">  
  	<input type="hidden" name="method" value="login">
            <table width="260" border="0" cellspacing="3" cellpadding="0">
             
  	<input type ="hidden" name="method" value="login" />
                <tr> 
                  <td align="right" width="100">用户名：</td>
                  <td rowspan="3" width="3"></td>
                  <td><font color="#FFFFFF"> 
				    <input type ="text" name="name" size="18" class="input" style="width:108px" onFocus="this.style.borderColor='#44C5F4'" onBlur="this.style.borderColor='#888'" />
                    </font></td>
                </tr>
                <tr> 
                  <td align="right" width="100">密　码：</td>
                  <td><font color="#FFFFFF"> 
				   <input type="password" name ="password"  size="18"  class="input" style="width:108px" onFocus="this.style.borderColor='#44C5F4'" onBlur="this.style.borderColor='#888'" />
                    </font></td>
                </tr>
   
                <tr>
                  <td align="right" valign="middle">&nbsp;</td>
                  <td height="35" valign="middle"><input name="submit" type="submit" class="button"  style="width:108px"  value="登录" /></td>
                </tr>
            </table>
            </form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body></html>
 <script language="JavaScript" type="text/JavaScript">
SetFocus(); 
</script>

