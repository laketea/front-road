<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.bookstore.util.UtilFun"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����-ע���¼</title>

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
	font-family: "΢���ź�";
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
var isExtendsValidate = true;	//���Ҫ������չ����֤�Ļ���������һ��Ҫ����
function extendsValidate(){	//�������ƣ��̶�д��
	
	//����ƥ����֤
	if( $('#password').val() == $('#checkpassword').val() ){	//ƥ��ɹ�
		$('#checkpassword').validate_callback(null,"sucess");	//�˴��ǹٷ��ṩ�ģ�����������ǰ�������ʾ
	}else{//ƥ��ʧ��
		$('#checkpassword').validate_callback("���벻ƥ��","failed");	//�˴��ǹٷ��ṩ��API��Ч�����ǵ�ƥ�䲻�ɹ���pwd2�� ��ʾ��ɫ��ע������TIP��ʾΪ�����벻ƥ�䡱
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
	<a href="#" style="font-size:12px" onClick="showsubmenu()" >�ر�</a>&nbsp;<img src="images/tg_yz_2.gif" width="7" height="8" border="0" align="absmiddle" /></td>
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
		    <td height="35" colspan="2" align="left" valign="bottom" >&nbsp;<span class="reg_font_1">��ע����¼ </span><span class="reg_font_2">����ע�ᣬֻ��Ҫ30��</span></td>
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
	 <td width="101" height="35" align="right">Email��</td>
     <td width="374" height="35" align="left"><input type="text" name="email" id="email" reg="^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" tip="�����ַ����wangking717@qq.com"   <%
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
            <td width="374" align="left" bgcolor="#FFFFFF"><span class="STYLE10">��¼���һ������ò��ṫ��</span></td>
          </tr>
          <tr>
            <td height="10" align="right">&nbsp;</td>
            <td height="10" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="35" align="right">�û�����</td>
            <td height="35" align="left"><input type="text" name="username" id="username" reg="^[\u4e00-\u9fa5\w][\u4e00-\u9fa5\w]{3,15}$" tip="�û���ֻ��ʹ������.Ӣ�ĺ�����"
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
            <td align="left" bgcolor="#FFFFFF"><span class="STYLE10">4-16���ַ���һ������Ϊ�����ַ�</span></td>
          </tr>
          <tr>
            <td height="10" align="right">&nbsp;</td>
            <td height="10" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="35" align="right">���룺</td>
            <td height="35" align="left"><input type="password" name="password" id="password" reg="^\w{6,20}$" tip="6-20���ַ�"
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
            <td align="left" bgcolor="#FFFFFF"><span class="STYLE10">����6���ַ�</span></td>
          </tr>
          <tr>
            <td height="10" align="right">&nbsp;</td>
            <td height="10" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="35" align="right">ȷ�����룺</td>
            <td height="35" align="left"><input type="password" name="checkpassword" id="checkpassword" reg="^\w{6,20}$" tip="6-20���ַ�����ȷ����������������ͬ"
			<%
				if(reg_pwd!=null){
				   %> value="<%=reg_pwd%>" <%
				   session.removeAttribute("reg_pwd");
				   }%> 
			 />&nbsp;<img src="images/tg_reg_right.gif" id="checkpasswordimg" style="display:none" width="24" height="21" /></td>
          </tr>
          <tr>
            <td height="25" align="right">&nbsp;</td>
            <td align="left" bgcolor="#FFFFFF"><span class="STYLE10">���ٴ���������</span></td>
          </tr>
          <tr>
            <td height="10" align="right">&nbsp;</td>
            <td height="10" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="35" align="right">��������֤�룺</td>
            <td height="35" align="left"><input type="text" name="code" reg="^[a-zA-Z0-9][a-zA-Z0-9]{0,3}$"  /></td>
          </tr>
          <tr>
            <td height="25" align="right">&nbsp;</td>
            <td align="left" bgcolor="#FFFFFF"><span class="STYLE10"><img src="yzm.jsp" name="valiImg" border=0 align="absmiddle" id=valiImg>
        	    <a href="javascript:document.getElementById('valiImg').src='yzm.jsp?'+new Date;void(0);">��������ˢ��</a> </span></td>
          </tr>
          <tr>
            <td height="20" align="right">&nbsp;</td>
            <td align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="20" align="right">&nbsp;</td>
            <td width="374" height="30" align="left"><input type="submit" id="reg_sub" value="ͬ������Э�鲢ע��"   style="cursor:hand;"   /></td>
          </tr>
		  </form>
		</table>  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		 
			
			</td>
            <td  align="left" valign="top"><table width="240" border="0" cellpadding="0" cellspacing="0" bgcolor="#91AB62">
			<form action="userAction.do?method=login" method="post" >
              <tr>
                <td height="45" colspan="2">&nbsp;<span class="STYLE7">���н��˻�</span></td>
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
                <td width="60" height="30" align="right"><span class="STYLE8">���룺</span></td>
                <td height="30"><input type="password" name="password2" style="width:160px;" /></td>
              </tr>
              <tr>
                <td width="60" height="20">&nbsp;</td>
                <td height="20">&nbsp;</td>
              </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td height="30"><input type="submit" value="��¼" style="border:1px solid #61861e;font-size:12px;width:52px;height:23px; background-color:#61861e; color:#FFFFFF;"  /></td>
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
/*��������ʹ��֤��ˢ�� */  
function reloadImage(url)  
{    
var img = document.getElementById("pic");    
img.src="<%= request.getContextPath()%>"+"/test.jsp?"+Math.random();
      
}    

