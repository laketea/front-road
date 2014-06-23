<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Address"%>
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
<title>今凡网-收货地址</title>

<link href="css.css" rel="stylesheet" type="text/css" />
<script language=javascript 
src="js/city.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/easy_validator.pack.js"></script>
<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
<script type="text/javascript">
var isExtendsValidate = true;	//如果要试用扩展表单验证的话，该属性一定要申明
function extendsValidate(){	//函数名称，固定写法
	
	//检查匹配验证
	if( $('#phone').val()==""&& $('#mobile').val()==""  ){	//匹配失败
		$('#phone').validate_callback("手机号码与固定电话请至少选填一项","failed");	//此处是官方提供的API，效果则是当匹配不成功，pwd2表单 显示红色标注，并且TIP显示为“密码不匹配”
		return false;	//此次是官方提供的，用来消除以前错误的提示
	}else{//匹配成功
		$('#phone').validate_callback(null,"sucess");
	}
}
</script>
<SCRIPT type=text/javascript>

	
	window.onload = function(){
		//initTop() ;
		theForm = document.regist_putong_page905Form ;
		//theForm.add_click.onclick = bt_regist_click() ;
		
	}


	function bt_regist_click(){
		var theForm = document.getElementById("regist_putong_page905Form") ;
		 var se =document.getElementById("address3");   
         var option=se.getElementsByTagName("option");     
         for(var i=0;i<option.length;++i)   
            {   
              if(option[i].selected)   
                {   
                 document.getElementById("area").value = option[i].text;   
                 }   
             }  

		 var se =document.getElementById("address2");   
         var option=se.getElementsByTagName("option");     
         for(var i=0;i<option.length;++i)   
            {   
              if(option[i].selected)   
                {   
                 document.getElementById("city").value = option[i].text;   
                 }   
             }  
		 var se =document.getElementById("address1");   
         var option=se.getElementsByTagName("option");     
         for(var i=0;i<option.length;++i)   
            {   
              if(option[i].selected)   
                {   
                 document.getElementById("province").value = option[i].text;   
                 }   
             }  

		//theForm.bt_regist.disabled=true;
		//theForm.action = '/epanelweb/regist/putong/page905Action.do?method=regist' ;
		//theForm.target = '' ;
		//theForm.submit() ;
	}
	function changetext(){
		
		 var se =document.getElementById("address3");   
         var option=se.getElementsByTagName("option");     
         for(var i=0;i<option.length;++i)   
            {   
              if(option[i].selected)   
                {   
                 document.getElementById("area").value = option[i].text;   
                 }   
             }  

		 var se =document.getElementById("address2");   
         var option=se.getElementsByTagName("option");     
         for(var i=0;i<option.length;++i)   
            {   
              if(option[i].selected)   
                {   
                 document.getElementById("city").value = option[i].text;   
                 }   
             }  
		 var se =document.getElementById("address1");   
         var option=se.getElementsByTagName("option");     
         for(var i=0;i<option.length;++i)   
            {   
              if(option[i].selected)   
                {   
                 document.getElementById("province").value = option[i].text;   
                 }   
             }
	}
	
	
</SCRIPT>
<SCRIPT language=Javascript>
			<!--
				var initialTimeElement = new Array();
				var showTimeElement = new Array();
				
				initialTimeElement[0] = 0.1;					
				showTimeElement[0] = "leftTime0";		
				
			 //-->
    </SCRIPT>
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

UserService services = new UserService();
List result = services.getAddressList(user.getId());
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
    <td width="1000" height="35" valign="bottom"><table height="29" border="0" cellpadding="0" cellspacing="0">
        <tr>
		<td width="10" height="29" align="center" valign="middle" ></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="userorder.jsp" style="color:#FFFFFF"  >我的订单</a></td>
		  <td width="10" height="29" align="center" valign="middle" ></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_2.gif"><a href="usergold.jsp" style="color:#FFFFFF" >我的金币</a></td>
		  <td width="10" height="29" align="center" valign="middle"></td>
          <td width="96" height="29" align="center" valign="middle" background="images/tg_user_1.gif"><a href="useraccount.jsp"  >我的账户</a></td>
        </tr>
      </table></td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" align="center" valign="top" class="de_table"><table width="920" border="0" cellpadding="0" cellspacing="0" style="font-size:24px; font-family:微软雅黑" >
      <tr>
        <td height="10" colspan="3"></td>
        </tr>
	 
		
          <tr >
            <td height="50" colspan="2" align="left" valign="bottom" class="cart_bottom"   >&nbsp;&nbsp;&nbsp;&nbsp;<a href="useraccount.jsp" class="user_pwd" >账户设置</a></td>
            <td width="190" height="50" align="left" valign="bottom" class="cart_bottom"  ><a href="useraddress.jsp" class="user_add">收货地址</a></td>
          </tr>
       		
          <tr>
            <td width="57" height="30">&nbsp;</td>
            <td width="673" height="30">&nbsp;</td>
            <td height="30">&nbsp;</td>
          </tr>
		  <%
		  for(int i=0 ; i<=result.size()-1;i++){
		  	Address add = (Address)result.get(i);
		  %>
          <tr>
            <td height="40" align="right" >&nbsp;</td>
            <td height="45" align="left" style="font-size:18px; font-weight:bold " ><%=i+1%>.<%=add.getName()+","+add.getProvince()+" "+add.getCity()+" "+add.getStreet()+","+add.getZipcode()+","+add.getMobile()%></td>
            <td height="40" >&nbsp;</td>
          </tr>
          <tr>
            <td height="30" align="right" style="font-size:20px;">&nbsp;</td>
            <td height="30" align="left" valign="top" style="font-size:12px;" >&nbsp;&nbsp;<a href="#" style="font-size:12px; font-family:'微软雅黑'">修改</a> | <a href="userAction.do?method=deladd&amp;id=<%=add.getId()%>" style="font-size:12px; font-family:'微软雅黑'" >删除</a> | <a href="userAction.do?method=setaddfirst&amp;id=<%=add.getId()%>" style="font-size:12px; font-family:'微软雅黑'" >设为默认地址</a></td>
            <td height="30">&nbsp;</td>
          </tr>
		  <% } 
		  while(result==null){
		  %>
		  
          <tr>
            <td height="40" align="right" style="font-size:20px; color:#61861e">&nbsp;</td>
            <td height="40" align="left" style="font-size:18px;" >您还没有收货地址，请添加</td>
            <td height="40">&nbsp;</td>
          </tr>
		  <%}%>
        <tr>
        <td height="30" align="right" style="font-size:20px; color:#61861e">&nbsp;</td>
        <td height="30" align="left" style="font-size:12px; color:#61861e" >&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" style=" color:#61861e;" onClick="showsubmenu()">添加新的收货地址>></a></td>
        <td height="30">&nbsp;</td>
        </tr>
        <tr>
          <td height="70">&nbsp;</td>
          <td height="70" align="center" id="submenu" style="display:none">
		  <form action="userAction.do" name="regist_putong_page905Form" id="regist_putong_page905Form" method="post" ><input type="hidden" name="userid" value=<%=user.getId().toString()%> />
		  <input type="hidden" name="province" value="" />
		  <input type="hidden" name="city" value="" />
		  <input type="hidden" name="area" value="" />
		  <input type="hidden" name="method" value="addAddress" />
		  <table width="650" border="0" cellspacing="0" cellpadding="0" style="">
            <tr>
              <td width="100" height="50" align="right">省市区：</td>
              <td width="550" height="50" align="left"><SELECT 
                  class=form id=address1 
                  onchange="address1change('','',this.form)" name=address1 style="border:1px solid #61861e;font-size:12px;width:100px;height:25px; font-family:微软雅黑;"> 
                    <OPTION value=0 selected>请选择</OPTION> <OPTION 
                    value=01>北京</OPTION> <OPTION value=02>天津</OPTION> <OPTION 
                    value=03>河北省</OPTION> <OPTION value=04>山西省</OPTION> <OPTION 
                    value=05>内蒙古自治区</OPTION> <OPTION value=06>辽宁省</OPTION> 
                    <OPTION value=07>吉林省</OPTION> <OPTION value=08>黑龙江省</OPTION> 
                    <OPTION value=09>上海市</OPTION> <OPTION value=10>江苏省</OPTION> 
                    <OPTION value=11>浙江省</OPTION> <OPTION value=12>安徽省</OPTION> 
                    <OPTION value=13>福建省</OPTION> <OPTION value=14>江西省</OPTION> 
                    <OPTION value=15>山东省</OPTION> <OPTION value=16>河南省</OPTION> 
                    <OPTION value=17>湖北省</OPTION> <OPTION value=18>湖南省</OPTION> 
                    <OPTION value=19>广东省</OPTION> <OPTION 
                    value=20>广西壮族自治区</OPTION> <OPTION value=21>海南省</OPTION> 
                    <OPTION value=22>重庆市</OPTION> <OPTION value=23>四川省</OPTION> 
                    <OPTION value=24>贵州省</OPTION> <OPTION value=25>云南省</OPTION> 
                    <OPTION value=26>西藏自治区</OPTION> <OPTION 
                    value=27>陕西省</OPTION> <OPTION value=28>甘肃省</OPTION> <OPTION 
                    value=29>青海省</OPTION> <OPTION value=30>宁夏回族自治区</OPTION> 
                    <OPTION value=31>新疆维吾尔自治区</OPTION> <OPTION 
                    value=32>香港特别行政区</OPTION> <OPTION value=33>澳门</OPTION> 
                    <OPTION value=34>台湾</OPTION></SELECT> <SELECT id=address2 
                  onchange="address2change('',this.form)" name=address2 style="border:1px solid #61861e;font-size:12px;width:100px;height:25px;font-family:微软雅黑;"> 
                  <OPTION value=0 selected>请选择</OPTION></SELECT> <SELECT 
                  id=address3 name=address3 onChange="changetext()" style="border:1px solid #61861e;font-size:12px;width:100px;height:25px;font-family:微软雅黑;"> <OPTION value=0 
                    selected>请选择</OPTION></SELECT></td>
            </tr>
            <tr>
              <td height="20" align="right">&nbsp;</td>
              <td height="20" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td height="50" align="right">街道地址：</td>
              <td height="50" align="left"><input name="street" type="text" style="border:1px solid #61861e;font-size:14px;width:300px;height:25px;" reg="^[\u4e00-\u9fa5\w][\u4e00-\u9fa5\w]{2,100}$" tip="请输入街道地址"  /></td>
            </tr>
            <tr>
              <td height="20" align="right">&nbsp;</td>
              <td height="20" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td height="50" align="right">邮政编码：</td>
              <td height="50" align="left"><input name="zipcode" type="text" style="border:1px solid #61861e;font-size:14px;width:200px;height:25px;" reg="[1-9]\d{5}(?!\d)" tip="请输入六位邮政编码"  /></td>
            </tr>
            <tr>
              <td height="20" align="right">&nbsp;</td>
              <td height="20" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td height="50" align="right">收货人：</td>
              <td height="50" align="left"><input name="name" type="text" style="border:1px solid #61861e;font-size:14px;width:200px;height:25px;" reg="^[\u4e00-\u9fa5\w][\u4e00-\u9fa5\w]{2,100}$"  /></td>
            </tr>
            <tr>
              <td height="20" align="right">&nbsp;</td>
              <td height="20" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td height="50" align="right">手机号码：</td>
              <td height="50" align="left"><input name="mobile" type="text" style="border:1px solid #61861e;font-size:14px;width:150px;height:25px;" reg="[1-9]\d{10}(?!\d)" tip="请输入您的手机号码"  /></td>
            </tr>
            <tr>
              <td height="20" align="right">&nbsp;</td>
              <td height="20" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td height="50" align="right">固定电话：</td>
              <td height="50" align="left"><input name="phone" type="text" style="border:1px solid #61861e;font-size:14px;width:150px;height:25px;" reg="^\w{0,20}$" tip="手机号码与固定电话号码请至少输入一项"  /></td>
            </tr>
            <tr>
              <td height="20" align="right">&nbsp;</td>
              <td height="20" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td height="20" align="right">&nbsp;</td>
              <td height="50" align="left">&nbsp;
                <input type="submit" value="保存"  class="search_button"  />  取消</td>
            </tr>
          </table>
		  </form>
		  </td>
          <td height="70">&nbsp;</td>
        </tr>
        <tr>
        <td height="30" colspan="3">&nbsp;</td>
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



