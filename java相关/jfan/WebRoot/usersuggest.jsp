<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.service.OrderService"%>
<%@page import="com.bookstore.service.ReviewService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Orders"%>
<%@page import="com.bookstore.po.Address"%>
<%@page import="com.bookstore.po.OrderItem"%>
<%@page import="com.bookstore.po.Review"%>
<%@page import="com.bookstore.po.Suggest"%>
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
<title>�񷲷�-��ϵ����Ա</title>

<link href="css.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
h2 { margin:0; padding:0;font-size:10pt; font-family:'΢���ź�'; color:#00000;}
h3 { margin:0; padding:0;font-size:10pt; font-family:'΢���ź�'; color:#61861E;}
#float span { float:right; margin-top:-15px;}
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
ReviewService rservice = new ReviewService();
Page pages = rservice.getUserSuggestPage(5,Integer.valueOf(pageNo),userids);
result = pages.getThisPageElements();

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
<SCRIPT type=text/javascript>
function addsubmit(){
		var theForm = document.getElementById("regist_putong_page905Form") ;
		
		if (document.regist_putong_page905Form.content.value=="") {      
			alert("���������Ľ���!");
			document.regist_putong_page905Form.content.focus();        
			return false;
		} 
		theForm.submit() ;
	}
</SCRIPT>
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
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="useraccount.jsp" style="color:#FFFFFF" >�ҵ��˻�</a></td>
		  <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_1.gif"><a href="usersuggest.jsp"  >��ϵ����Ա</a></td>
        </tr>
      </table>
    </td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" align="center" valign="top" class="de_table"><table width="920" height="0" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:12px; font-family:΢���ź�" >
      <tr>
        <td height="10" colspan="4"></td>
        </tr>
	 
		
          <tr >
            <td width="18" height="50" align="left" valign="bottom" class="cart_bottom"   >&nbsp;&nbsp;&nbsp;&nbsp;<a href="useraddress.jsp" class="user_pwd" ></a></td>
            <td width="688" height="50" align="left" valign="bottom" class="cart_bottom"   ><a href="userorder.jsp" class="user_pwd" >��ϵ����Ա</a>  &nbsp;</td>
            <td width="200" align="left" valign="bottom" class="cart_bottom"   ><a href="#"  onClick="showsubmenu()"  class="user_add">�����µ����ⷴ��</a></td>
            <td width="14" height="50" align="left" valign="bottom" class="cart_bottom"  ></td>
          </tr>
       		
          <tr>
            <td height="20">&nbsp;</td>
            <td height="20" colspan="2">&nbsp;</td>
            <td height="20">&nbsp;</td>
          </tr>
          <tr>
            <td></td>
            <td height="100" colspan="2" id="submenu" style="display:none" >
			<form action="reviewAction.do" method="post"  name="regist_putong_page905Form" ><input type="hidden" name="method" value="addusersuggest"  />
			<table width="710" border="0" align="center" cellpadding="0" cellspacing="0">

                          <tr>
                            <td height="45" align="right">���ĳƺ���</td>
                            <td height="45" align="left"><input type="text" name="username" style=" line-height:30px;width:235px; height:30px; border:1px solid #61861E;" 					<%
							String usid = (String)session.getAttribute("userid");
							if(usid!=null){
								User uss = (User)session.getAttribute("user");
							%>
							value=<%=uss.getUsername()%> readonly="true"
							<%}%> /></td>
                          </tr>
                          <tr>
                            <td height="175" align="right" valign="top">���ⷴ����</td>
                            <td height="45" align="left" valign="top"><textarea name="content" cols="50" rows="12" style="line-height:30px;border:1px solid #61861E;" ></textarea></td>
                          </tr>
                          <tr>
                            <td height="28">&nbsp;</td>
                            <td height="35" align="left">&nbsp;&nbsp;
                            <input type="button" class="search_button" value="�ύ" onclick="addsubmit()"  /></td>
                          </tr>
                          <tr>
                            <td width="170" height="28">&nbsp;</td>
                            <td width="540">&nbsp;</td>
                          </tr>
            </table></form></td>
            <td></td>
          </tr>
		
          <tr>
            <td align="right" >&nbsp;</td>
            <td colspan="2" align="left" valign="top" style="font-size:18px; font-weight:bold " ><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <%
	  for(int i=0;i<result.size();i++){
			Suggest suggest  =(Suggest)result.get(i);
	  %>
      <tr>
        <td height="130" colspan="3" align="center" valign="middle" id="suggest<%=i+1%>"><table width="836" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td  height="70" align="left" valign="top" class="de_table" style="padding-top:10px;"><div id="float"><h2>&nbsp;&nbsp;&nbsp;&nbsp;���ⷴ����<%=suggest.getContent()%></h2><span style=";color:#808080; font-size:8pt; font-family:'����'; float:right">[<%=suggest.getSdate()%>]&nbsp;<a href="#" onclick="confirmdelete(<%=suggest.getId()%>)" >[ɾ��]</a>&nbsp;</span></div></td>
          </tr>
          <tr>
            <td  height="40" align="left" valign="center" class="user_suggest"><div id="float"><h3>&nbsp;&nbsp;&nbsp;&nbsp;����ظ���
			<%if(suggest.getReply()==null){%>��δ�ظ�<%}else{%><%=suggest.getReply()%><%}%></h3><span style=";color:#808080; font-size:8pt; font-family:'����'; float:right"><%if(suggest.getReply()==null){%><%}else{%>[<%=suggest.getRedate()%>]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%}%></span></div></td>
          </tr>
          
          
          
        </table></td>
      </tr>
	  <%
	  }
	  %>
			
            </table></td>
            <td >&nbsp;</td>
          </tr>
        
        
        <tr>
          <td height="35">&nbsp;</td>
          <td height="35" colspan="2" align="right" id="suggest0" >
		  <div style="margin-right:30px;" >
		  <table  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style=" border-bottom: 1px solid #93ac64;border-left: 1px solid #93ac64;border-top: 1px solid #93ac64; margin-right:200">
  <tr>
  <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="userreview.jsp?pageNo=1" >��ҳ</a></td>
  <%for(int i=1;i<=pages.getPageNumber();i++){ %>
        
        <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="usersuggest.jsp?pageNo=<%=i %>" ><%=i %></a></td>
        <%} %>
	<td style="border-right:1px solid #93ac64;" width="60" align="center"><a href="usersuggest.jsp?pageNo=<%=pages.getPageNumber()%>" >���һҳ</a></td>
	
  </tr>
</table></div>		  </td>
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
<script language="javascript">
function confirmdelete(id){
  if(confirm('ȷ��Ҫɾ����������')){
  	location.replace('<%=request.getContextPath()%>/reviewAction.do?method=userdelsuggest&id='+id);
  }
}
</script>


