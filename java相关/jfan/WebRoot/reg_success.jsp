<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����-ע��ɹ�</title>

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
	font-family: "΢���ź�";
	font-size: 16px;
}
.STYLE10 {color: #638821}
.STYLE11 {
	font-size: 16px;
	color: #638821;
	font-weight: bold;
	font-family: "����";
}
.STYLE12 {
	color: #668821;
	font-size: 16px;
	font-weight: bold;
	font-family: "����";
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
		    <td height="50" colspan="3" align="center" valign="middle" ><img src="images/tg_reg_ss.jpg" width="49" height="42" align="absmiddle" />&nbsp;<span class="reg_font_1">��ϲ����ע��ɹ���</span></td>
	    </tr>
		  <tr>
            <td height="10" colspan="3" align="left" valign="top" class="reg_xh">&nbsp;</td>
        </tr>
          <tr>
            <td height="35" colspan="3" align="left" valign="bottom"><span class="STYLE11">&nbsp;&nbsp;�����û���Ϊ</span></td>
          </tr>
          
          <tr>
            <td height="35" colspan="3" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE12">����ʱ����ʹ�ô��û�����¼�����ܱ��˷��ĵĹ�����Ȥ</span></td>
          </tr>
		  <tr>
            <td height="80" colspan="3" align="center"><div id="reg_content" ><a href="default.jsp" >����ȥ����</a></div></td>
          </tr>
		  <tr>
		    <td height="10" colspan="3" align="center">&nbsp;</td>
	    </tr>
		  
          <tr>
            <td width="75" height="100" rowspan="4" align="left">&nbsp;</td>
            <td width="600" height="38" align="left" bgcolor="#e6e6e6">&nbsp;<span class="STYLE9">�˻���ȫУ��</span></td>
            <td width="75" rowspan="4" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="22" align="left" bgcolor="#E6E6E6">&nbsp;&nbsp;<span class="STYLE10">��֤����ɱ��������˻���ȫ�������������һ����룬���ɽ��ն����������Ϣ��</span></td>
          </tr>
          <tr>
            <td height="22" align="left" bgcolor="#E6E6E6">&nbsp;&nbsp;<span class="STYLE10">����˴�����������֤��</span></td>
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
/*��������ʹ��֤��ˢ�� */  
function reloadImage(url)  
{    
var img = document.getElementById("pic");    
img.src="<%= request.getContextPath()%>"+"/test.jsp?"+Math.random();
      
}    

