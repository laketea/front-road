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
<title>����-�ҵ��˻�</title>

<link href="css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/easy_validator.pack.js"></script>
<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
<SCRIPT language=Javascript>
			<!--
				var initialTimeElement = new Array();
				var showTimeElement = new Array();
				
				initialTimeElement[0] = 0.1;					
				showTimeElement[0] = "leftTime0";		
				
			 //-->
    </SCRIPT>
	<script type="text/javascript">
var isExtendsValidate = true;	//���Ҫ������չ����֤�Ļ���������һ��Ҫ����
function extendsValidate(){	//�������ƣ��̶�д��
	
	//����ƥ����֤
	if( $('#password').val() == $('#password2').val() ){	//ƥ��ɹ�
		$('#password2').validate_callback(null,"sucess");	//�˴��ǹٷ��ṩ�ģ�����������ǰ�������ʾ
	}else{//ƥ��ʧ��
		$('#password2').validate_callback("���벻ƥ��","failed");	//�˴��ǹٷ��ṩ��API��Ч�����ǵ�ƥ�䲻�ɹ���pwd2�� ��ʾ��ɫ��ע������TIP��ʾΪ�����벻ƥ�䡱
		return false;
	}
}
</script>
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
String arg = request.getParameter("tag");

%>

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
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="userorder.jsp" style="color:#FFFFFF"  >�ҵĶ���</a></td>
		  <td width="10" height="29" align="center" valign="middle" ></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="usergold.jsp" style="color:#FFFFFF" >�ҵĽ��</a></td>
		  <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_1.gif"><a href="useraccount.jsp"  >�ҵ��˻�</a></td>
          <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="usersuggest.jsp" style="color:#FFFFFF"  >��ϵ����Ա</a></td>
		</tr>
      </table>
	</td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" align="center" valign="top" class="de_table"><table width="920" border="0" cellpadding="0" cellspacing="0" style="font-size:24px; font-family:΢���ź�" >
      <tr>
        <td height="10" colspan="3"></td>
        </tr>
	 
		
          <tr >
            <td width="200" height="50" align="left" valign="bottom" class="cart_bottom"   >&nbsp;&nbsp;&nbsp;&nbsp;<a href="useraccount.jsp" class="user_pwd" >�˻�����</a></td>
            <td width="530" height="50" align="left" valign="middle" class="cart_bottom"  >&nbsp;</td>
            <td width="190" height="50" align="left" valign="bottom" class="cart_bottom"  ><a href="useraddress.jsp" class="user_add">�ջ���ַ</a></span></td>
          </tr>
       		<html:form action="userAction.do"  styleId="form1"  > <html:hidden property="method" value="account" />
          <tr>
            <td height="30">&nbsp;</td>
            <td height="30">&nbsp;</td>
            <td height="30">&nbsp;</td>
          </tr>
          <tr>
            <td height="60" align="right" style="font-size:20px; color:#61861e">Email��</td>
            <td height="60" align="left"><input type="text" name="email"  size="56"  style="height:27px; width:450px; font-size:16px;" value="<%=user.getEmail()%>" readonly="true" /></td>
            <td height="60">&nbsp;</td>
          </tr>
          <tr>
            <td height="60" align="right" style="font-size:20px; color:#61861e">�û�����</td>
            <td height="60" align="left"><input type="text" name="username"  size="56" style="height:27px; width:450px; font-size:16px;" readonly="true" value="<%=user.getUsername()%>"  /> </td>
            <td height="60">&nbsp;</td>
          </tr>
          <tr>
            <td height="60" align="right" style="font-size:20px; color:#61861e">�����룺</td>
            <td height="60" align="left"><input type="password" name="password" style="height:27px; width:450px; font-size:16px;"  size="56" reg="^\w{6,20}$" tip="6-20���ַ�" /></td>
            <td height="60">&nbsp;</td>
          </tr>
        <tr>
        <td height="60" align="right" style="font-size:20px; color:#61861e">ȷ�����룺</td>
        <td height="60" align="left" ><input   type="password" name="password2" style="height:27px; width:450px; font-size:16px;"  size="56" reg="^\w{6,20}$" tip="6-20���ַ�����ȷ����������������ͬ" /></td>
        <td height="60">&nbsp;</td>
        </tr>
        <tr>
          <td height="70">&nbsp;</td>
          <td height="70" align="left" style="font-size:14pt; color:#FF0000;"><input type="submit" value="����" class="search_button"  />&nbsp;&nbsp;&nbsp;<% if(arg!=null){ %>
		  �����޸ĳɹ������μ����������룡
		  <% } %>
		  </td>
          <td height="70">&nbsp;</td>
        </tr>
        <tr>
        <td height="30" colspan="3">&nbsp;</td>
        </tr>
		</html:form>
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



