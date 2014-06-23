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
<title>今凡网</title>

<link href="css.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style></head>
<SCRIPT type=text/javascript>
function addsubmit(){
		var theForm = document.getElementById("regist_putong_page905Form") ;
		
		if (document.regist_putong_page905Form.title.value=="") {      
			alert("请输入评论的标题!");
			document.regist_putong_page905Form.title.focus();        
			return false;
		}
		if (document.regist_putong_page905Form.view.value=="") {      
			alert("请输入总评价!");
			document.regist_putong_page905Form.view.focus();        
			return false;
		} 
		if (document.regist_putong_page905Form.advantage.value=="") {      
			alert("请输入商品的优点!");
			document.regist_putong_page905Form.advantage.focus();        
			return false;
		} 
		if (document.regist_putong_page905Form.defect.value=="") {      
			alert("请输入商品的缺点!");
			document.regist_putong_page905Form.defect.focus();        
			return false;
		} 
		theForm.submit() ;
	}
</SCRIPT>
<%
User user=null;
user=(User)session.getAttribute("user");
String userids = null;
userids = (String)session.getAttribute("userid");

String id = request.getParameter("id");
if(id == null||"".equals(id))
{
	id="1";
}
OrderService services = new OrderService();
OrderItem  oitem= services.getOrderItem(Long.valueOf(id));
Orders orders = services.getOrder(Long.valueOf(oitem.getOrderid()));

%>


<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="10" colspan="3"><jsp:include page="headss.jsp"  /></td>
  </tr>
  <tr>
    <td height="10"></td>
    <td height="10">&nbsp;</td>
    <td height="10"></td>
  </tr>
  
  <tr>
    <td>&nbsp;</td>
    <td height="44" align="left" valign="middle" class="review_add_view">&nbsp;<span style="font-size:14pt; font-family:'微软雅黑'; color:#61861E;" >发表评论</span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" height="75" align="left" valign="middle" bgcolor="#DFF2BD" class="de_table">&nbsp;&nbsp;<span style="font-family:'微软雅黑'; font-size:14pt; color:#61861E;" >欢迎您发表客观的原创的并对其他用户有参考价值的商品评论。</span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" height="94" align="center" valign="top" class="review_add_viewbt" >
	<form action="reviewAction.do" id="regist_putong_page905Form" name="regist_putong_page905Form" method="post" >
	<input type="hidden" name="method" value="add"  />
	<input type="hidden" name="godsid" value="<%=oitem.getGodsid()%>"  />
	<input type="hidden" name="godsname" value="<%=oitem.getGodsname()%>"  />
	<input type="hidden" name="orderitemid" value="<%=id%>"  />
	<input type="hidden" name="orderdate" value="<%=(orders.getOrderdate()).toString()%>"  />
	<table width="900" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td width="610" height="50" align="left" style=" font-size:12pt; font-family:'微软雅黑'; color:#000000">标题</td>
        <td width="290">&nbsp;</td>
      </tr>
      <tr>
        <td height="35" align="left"><input name="title" type="text" class="review_add_input"  /></td>
        <td align="left">必填。长度在4-20个字之间。</td>
      </tr>
      <tr>
        <td height="20" align="left">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="50" align="left" style=" font-size:12pt; font-family:'微软雅黑'; color:#000000" >总体评价</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="120" align="left" valign="top"><textarea rows="6" name="view" class="review_add_input"></textarea></td>
        <td align="left">必填。长度在5-200字之间。</td>
      </tr>
      <tr>
        <td height="50" align="left" style=" font-size:12pt; font-family:'微软雅黑'; color:#000000" >优点</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="35" align="left"><input name="advantage" type="text" class="review_add_input"  /></td>
        <td align="left">必填。长度在5-100字之间。</td>
      </tr>
      <tr>
        <td height="20" align="left">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="50" align="left" style=" font-size:12pt; font-family:'微软雅黑'; color:#000000" >缺点</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="35" align="left"><input name="defect" type="text" class="review_add_input"  /></td>
        <td align="left">必填。长度在5-100字之间</td>
      </tr>
      <tr>
        <td height="110" align="left">&nbsp;&nbsp;&nbsp;<input type="button" value="" style="background-image:url(images/tg_review_1.png); background-repeat:no-repeat; width:102px; height:35px; cursor:hand; border:none;" onclick="addsubmit()"  /></td>
        <td>&nbsp;</td>
      </tr>
    </table>
	</form>
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



