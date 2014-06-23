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
<title>今凡凡-我的评价</title>

<link href="css.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
h2 { margin:0; padding:0;font-size:10pt; font-family:'微软雅黑'; color:#00000;}
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
Page pages = rservice.getUserReviewPage(5,Integer.valueOf(pageNo),userids);
result = pages.getThisPageElements();

%>
<script language="javascript">
//初始化
var def="<%=id%>";
function mover(object){
  //主菜单
  var mm=document.getElementById("m_"+object);
  mm.className="m_li_a";
  //初始主菜单隐藏效果
  if(def!=0){
    var mdef=document.getElementById("m_"+def);
    mdef.className="m_li";
  }
  //子菜单
 
}
function mout(object){
  //主菜单
  var mm=document.getElementById("m_"+object);
  mm.className="m_li";
  //初始主菜单
  if(def!=0){
    var mdef=document.getElementById("m_"+def);
    mdef.className="m_li_a";
  }
}
</script>
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
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_1.gif"><a href="userorder.jsp"  >我的订单</a></td>
		  <td width="10" height="29" align="center" valign="middle" ></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="usergold.jsp" style="color:#FFFFFF" >我的金币</a></td>
		  <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="useraccount.jsp" style="color:#FFFFFF" >我的账户</a></td>
		  <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="usersuggest.jsp" style="color:#FFFFFF" >联系管理员</a></td>
        </tr>
      </table>
    </td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" align="center" valign="top" class="de_table"><table width="920" height="0" border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family:微软雅黑" >
      <tr>
        <td height="10" colspan="4"></td>
        </tr>
	 
		
          <tr >
            <td width="18" height="50" align="left" valign="bottom" class="cart_bottom"   >&nbsp;&nbsp;&nbsp;&nbsp;<a href="useraddress.jsp" class="user_pwd" ></a></td>
            <td width="688" height="50" align="left" valign="bottom" class="cart_bottom"   ><a href="userorder.jsp" class="user_pwd" >我的订单</a>  &nbsp;&nbsp;<a href="userreview.jsp" class="user_pwd" style=" color:#61861E;" >我的评价</a> </td>
            <td width="200" align="right" valign="bottom" class="cart_bottom"   >
			<div id="menu_tgg">
  <ul>
    <li id="m_1" <%if(Integer.valueOf(id)==1){ %> class='m_li_a'<%} else {%>class='m_li' onmouseover='mover(1);' onmouseout='mout(1);'<%}%> ><a href="userorder.jsp?id=1">全部</a></li>
    <li id="m_2" <%if(Integer.valueOf(id)==2){ %> class='m_li_a'<%} else {%>class='m_li' onmouseover='mover(2);' onmouseout='mout(2);'<%}%> ><a href="userorder.jsp?id=2">已付款</a></li>
    <li id="m_3" <%if(Integer.valueOf(id)==3){ %> class='m_li_a'<%} else {%>class='m_li' onmouseover='mover(3);' onmouseout='mout(3);'<%}%> ><a href="userorder.jsp?id=3">未付款</a></li>
  </ul>
</div>
			</td>
            <td width="14" height="50" align="left" valign="bottom" class="cart_bottom"  ></td>
          </tr>
       		
          <tr>
            <td height="20">&nbsp;</td>
            <td height="20" colspan="2">&nbsp;</td>
            <td height="20">&nbsp;</td>
          </tr>
		
          <tr>
            <td align="right" >&nbsp;</td>
            <td colspan="2" align="left" valign="top" style="font-size:18px; font-weight:bold " ><table width="100%" border="0" cellspacing="1" cellpadding="0">
              <%
	  for(int i=0;i<result.size();i++){
			Review review  =(Review)result.get(i);
	  %>
      <tr>
        <td height="167" colspan="3" align="center" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="110" rowspan="2" align="center" valign="bottom"><img src="images/tg_gt_tx.png" width="51" height="51" /></td>
            <td width="836" height="30" align="left" class="de_table"><div id="float"><h2>标题：<%=review.getTitle()%></h2><span style=";color:#808080; font-size:8pt; font-family:'宋体'; float:right">[<%=review.getRedate()%>]</span></div></td>
          </tr>
          <tr>
            <td height="40" align="left" valign="middle" class="review_gods">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10pt; font-family:'微软雅黑'; color:#61861e">优点：</span><%=review.getAdvantage()%></td>
          </tr>
          <tr>
            <td height="28" align="center"><%=review.getUsername()%></td>
            <td height="28" align="left" valign="top" class="review_gods">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10pt; font-family:'微软雅黑'; color:#61861e">不足：</span><%=review.getDefect()%></td>
          </tr>
          <tr>
            <td height="46" align="center" valign="top"><p>购买日期</p>
              <p><%=review.getOrderdate()%></p></td>
            <td height="46" align="left" valign="top" class="de_gods_2">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:10pt; font-family:'微软雅黑'; color:#61861e">心得：</span><%=review.getView()%></td>
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
          <td height="35" colspan="2" align="right" >
		  <table  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style=" border-bottom: 1px solid #93ac64;border-left: 1px solid #93ac64;border-top: 1px solid #93ac64; margin-right:50">
  <tr>
  <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="userreview.jsp?pageNo=1" >首页</a></td>
  <%for(int i=1;i<=pages.getPageNumber();i++){ %>
        
        <td style="border-right:1px solid #93ac64;" width="40px" align="center"  height="25"><a href="userreview.jsp?pageNo=<%=i %>" ><%=i %></a></td>
        <%} %>
	<td style="border-right:1px solid #93ac64;" width="60" align="center"><a href="userreview.jsp?pageNo=<%=pages.getPageNumber()%>" >最后一页</a></td>
  </tr>
</table>
		  
		  
		  </td>
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



