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
<%@page import="com.bookstore.po.Address"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����</title>

<link href="css.css" rel="stylesheet" type="text/css" />
<script language=javascript 
src="js/city.js"></script>
<SCRIPT type=text/javascript>

	
	window.onload = function(){
		//initTop() ;
		theForm = document.regist_putong_page905Form ;
		//theForm.add_click.onclick = bt_regist_click() ;
		
		
	}
	
	
	function addsubmit(){
		var theForm = document.getElementById("regist_putong_page905Form") ;
		
		if (document.getElementById("area").value=="") {      
			alert("��ѡ��ʡ����!");
			document.getElementById("area").focus();        
			return false;
		}
		if (document.regist_putong_page905Form.street.value=="") {      
			alert("������ֵ���ַ!");
			document.regist_putong_page905Form.street.focus();        
			return false;
		} 
		if (document.regist_putong_page905Form.zipcode.value=="") {      
			alert("��������������!");
			document.regist_putong_page905Form.zipcode.focus();        
			return false;
		} 
		if (document.regist_putong_page905Form.name.value=="") {      
			alert("�������ջ���!");
			document.regist_putong_page905Form.name.focus();        
			return false;
		} 
		if (document.regist_putong_page905Form.mobile.value=="") {      
			if (document.regist_putong_page905Form.phone.value=="") {      
			alert("�ֻ�������̶��绰����������һ��!");
			document.regist_putong_page905Form.phone.focus();        
			return false;
			}
			return true;
		} 
		//theForm.bt_regist.disabled=true;
		theForm.action = 'userAction.do' ;
		theForm.target = '' ;
		theForm.submit() ;
	}
	
	function addsubmits(){
		var theForm = document.getElementById("regist_putong_page905Form") ;
		if (document.regist_putong_page905Form.sendway.checked) {      
			alert("��ѡ���ݷ�ʽ!");
			return false;
		} 
		
		
		var   sltSource=false; 
        for(var   i=0;i <document.regist_putong_page905Form.addid.length;i++){ 
            if(document.regist_putong_page905Form.addid[i].checked==true)   
					sltSource=true; 
       			 } 
        if (sltSource==false){ 
            window.alert( "��ѡ���ջ���ַ�� "); 
            document.regist_putong_page905Form.addid[0].focus(); 
            return   false; 
        } 
		//theForm.bt_regist.disabled=true;
		theForm.action = 'orderAction.do' ;
		theForm.target = '' ;
		theForm.submit() ;
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
if (document.getElementById("submenu").style.display == "none")
{
document.getElementById("submenu").style.display ="block";
}
else
{
document.getElementById("submenu").style.display ="none";
}
}
</script>
<style type="text/css">
<!--
.STYLE2 {color: #F0F0F0}
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
session.setAttribute("asas","123123");
user=(User)session.getAttribute("user");
String userids = null;
userids = (String)session.getAttribute("userid");
if(userids == null||userids.equals(""))
{
	response.sendRedirect("login.jsp?orderid=1");
	return;
}
session.removeAttribute("url_dz");
UserService services = new UserService();
List result = services.getAddressList(user.getId());
%>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><jsp:include page="headss.jsp"  /></td>
  </tr>
  <tr>
    <td height="50"></td>
    <td height="50"><img src="images/tg_dd_2.gif" width="372" height="30" /></td>
    <td height="50"></td>
  </tr>
  <tr>
    <td height="10"></td>
    <td width="1000" height="10"></td>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" align="center" valign="top" id="main">
	 <form  name="regist_putong_page905Form" id="regist_putong_page905Form" method="post" ><input type="hidden" name="method" value="addall"  /><input type="hidden" name="ttprice" value="<%=totalprice%>"  />
	<table width="920" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td height="60" class="order_bottom" >&nbsp;�ύ����</td>
        </tr>
		
	 	<tr>
            <td height="30" align="left" valign="bottom" style="font-size:14px; font-weight:bold" >�ջ�����Ϣ</td>
        </tr>
	 
       <%
		  for(int i=0 ; i<=result.size()-1;i++){
		  	Address add = (Address)result.get(i);
		  %>
          <tr>
           
            <td height="35" align="left" style="font-size:14px;  " >
			<input type="radio" name="addid" value="<%=add.getId().toString()%>" <%if(i==0){%> checked="checked" <%}%>  />
            <%=add.getName()+","+add.getProvince()+" "+add.getCity()+" "+add.getArea()+" "+add.getStreet()+","+add.getZipcode()+","+add.getMobile()%></td>
          </tr>
		  <% } 
		  %>
		  <tr>
           
            <td height="5" align="left" style="font-size:14px;  " >
			<input type="radio" name="addid" value="123123" style="display:none"  /> <input type="radio" name="addid" value="34353" style="display:none"  />
            </td>
          </tr>
		  <%
		  while(result==null){
		  %>
		  
          <tr>
            <td height="30" align="left" style="font-size:14px;" >&nbsp;����û���ջ���ַ�������</td>
          </tr>
		  <% } %>
          <tr>
            <td height="30" align="left" style="font-size:12px; color:#61861e" >&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" style=" color:#61861e;" onClick="showsubmenu()">����µ��ջ���ַ>></a></td>
          </tr>
          <tr>
           
             <td height="30" align="left" >
			 <input type="hidden" name="userid"   value=<%=user.getId().toString()%> />
		  <input type="hidden" name="province" id="province"   value="" />
		  <input type="hidden" name="city" id="city"  value="" />
		  <input type="hidden" name="area" id="area" value="" />
		  
		  <table width="650" border="0" cellspacing="0" cellpadding="0" id="submenu" style="display:none">
            <tr>
              <td width="100" height="40" align="right">ʡ������</td>
              <td width="550" height="40" align="left"><SELECT 
                  class=form id=address1 
                  onchange="address1change('','',this.form)" name=address1 style="border:1px solid #61861e;font-size:12px;width:100px;height:25px; font-family:΢���ź�;"> 
                    <OPTION value=0 selected>��ѡ��</OPTION> <OPTION 
                    value=01>����</OPTION> <OPTION value=02>���</OPTION> <OPTION 
                    value=03>�ӱ�ʡ</OPTION> <OPTION value=04>ɽ��ʡ</OPTION> <OPTION 
                    value=05>���ɹ�������</OPTION> <OPTION value=06>����ʡ</OPTION> 
                    <OPTION value=07>����ʡ</OPTION> <OPTION value=08>������ʡ</OPTION> 
                    <OPTION value=09>�Ϻ���</OPTION> <OPTION value=10>����ʡ</OPTION> 
                    <OPTION value=11>�㽭ʡ</OPTION> <OPTION value=12>����ʡ</OPTION> 
                    <OPTION value=13>����ʡ</OPTION> <OPTION value=14>����ʡ</OPTION> 
                    <OPTION value=15>ɽ��ʡ</OPTION> <OPTION value=16>����ʡ</OPTION> 
                    <OPTION value=17>����ʡ</OPTION> <OPTION value=18>����ʡ</OPTION> 
                    <OPTION value=19>�㶫ʡ</OPTION> <OPTION 
                    value=20>����׳��������</OPTION> <OPTION value=21>����ʡ</OPTION> 
                    <OPTION value=22>������</OPTION> <OPTION value=23>�Ĵ�ʡ</OPTION> 
                    <OPTION value=24>����ʡ</OPTION> <OPTION value=25>����ʡ</OPTION> 
                    <OPTION value=26>����������</OPTION> <OPTION 
                    value=27>����ʡ</OPTION> <OPTION value=28>����ʡ</OPTION> <OPTION 
                    value=29>�ຣʡ</OPTION> <OPTION value=30>���Ļ���������</OPTION> 
                    <OPTION value=31>�½�ά���������</OPTION> <OPTION 
                    value=32>����ر�������</OPTION> <OPTION value=33>����</OPTION> 
                    <OPTION value=34>̨��</OPTION></SELECT> <SELECT id=address2 
                  onchange="address2change('',this.form)" name=address2 style="border:1px solid #61861e;font-size:12px;width:100px;height:25px;font-family:΢���ź�;"> 
                  <OPTION value=0 selected>��ѡ��</OPTION></SELECT> <SELECT 
                  id=address3 name=address3 onChange="changetext()" style="border:1px solid #61861e;font-size:12px;width:100px;height:25px;font-family:΢���ź�;"> <OPTION value=0 
                    selected>��ѡ��</OPTION></SELECT></td>
            </tr>
            <tr>
              <td height="40" align="right">�ֵ���ַ��</td>
              <td height="40" align="left"><input name="street" type="text" style="border:1px solid #61861e;font-size:14px;width:300px;height:25px;"  /></td>
            </tr>
            <tr>
              <td height="40" align="right">�������룺</td>
              <td height="40" align="left"><input name="zipcode" type="text" style="border:1px solid #61861e;font-size:14px;width:200px;height:25px;"   /></td>
            </tr>
            <tr>
              <td height="40" align="right">�ջ��ˣ�</td>
              <td height="40" align="left"><input name="name" type="text" style="border:1px solid #61861e;font-size:14px;width:200px;height:25px;"   /></td>
            </tr>
            <tr>
              <td height="40" align="right">�ֻ����룺</td>
              <td height="40" align="left"><input name="mobile" type="text" style="border:1px solid #61861e;font-size:14px;width:150px;height:25px;"   /></td>
            </tr>
            <tr>
              <td height="40" align="right">�̶��绰��</td>
              <td height="40" align="left"><input name="phone" type="text" style="border:1px solid #61861e;font-size:14px;width:150px;height:25px;"   /></td>
            </tr>
            <tr>
              <td height="40" align="right">&nbsp;</td>
              <td height="40" align="left">&nbsp;
                <input type="button" value="����"  class="search_button" onclick="addsubmit()"  /></td>
            </tr>
          </table>
		 
			 
			</td>
          </tr>
		
          <tr>
            <td height="10" class="order_bottom">&nbsp;</td>
          </tr>
          <tr align="left">
            <td height="45" style="font-size:14px; font-weight:bold" >֧������ݷ�ʽ</td>
        </tr>
          <tr>
            <td align="left"  ><table width="650" border="0" cellspacing="0" cellpadding="0" style="">
            <tr>
              <td width="97" height="30" align="right">֧����ʽ��</td>
              <td width="553" height="30" align="left">
			  <input type="radio" name="payway" value="1" checked="checked"  /> ֧����&nbsp;&nbsp;
			  </td>
            </tr>
            <tr>
              <td height="30" align="right">��ݷ�ʽ��</td>
              <td height="30" align="left"><input type="radio" name="sendway" value="1" onclick="mailway(1,<%=totalprice%>)" checked="checked"s   /> ���&nbsp;&nbsp;
			  <input type="radio" name="sendway" value="2" onclick="mailway(2,<%=totalprice%>)"   /> EMS&nbsp;&nbsp;			  </td>
            </tr>
            <tr>
              <td height="30" align="right">�˷ѣ�</td>
              <td height="10" align="left">��ݰ��� EMS��6Ԫ���</td>
            </tr>
          </table></td>
          </tr>
          <tr>
            <td height="30" class="order_bottom"  >&nbsp;</td>
          </tr>
          <tr align="left">
            <td height="45" style="font-size:14px; font-weight:bold"  >��Ʒ�嵥</td>
        </tr>
          <tr>
            <td align="center" valign="top"  ><table width="850" border="0" cellpadding="0" cellspacing="0" class="order_gods_table">
              <tr>
                <td width="30" height="35" bgcolor="#E6E6E6" class="order_gods_table_three">&nbsp;</td>
                <td width="370" align="left" bgcolor="#E6E6E6" class="order_gods_table_three">��Ʒ����</td>
                <td width="150" align="center" bgcolor="#E6E6E6" class="order_gods_table_three">�񷲼�</td>
                <td width="150" align="center" bgcolor="#E6E6E6" class="order_gods_table_three">���ͽ��</td>
                <td width="150" align="center" bgcolor="#E6E6E6" class="order_gods_table_three">��Ʒ����</td>
              </tr>
			   <%
			   Long userpoint=new Long("0");
			Iterator<CartItem> it= ci.iterator();
			while(it.hasNext()){
			CartItem cartItem = it.next();
			%>
			  
              <tr>
                <td height="32">&nbsp;</td>
                <td align="left"><%=cartItem.getGods().getName()%></td>
                <td align="center"><%=cartItem.getGods().getNewprice()%></td>
                <td align="center"><%=cartItem.getGods().getPoint()*cartItem.getCount()%></td>
                <td align="center"><%=cartItem.getCount()%></td>
              </tr>
			   <%
			   userpoint = userpoint +cartItem.getGods().getPoint()*cartItem.getCount();
			   
					}
				 %>  
            </table></td>
          </tr>
          <tr>
            <td height="25" class="order_bottom"  >&nbsp;</td>
          </tr>
          <tr align="left">
            <td height="45" style="font-size:14px; font-weight:bold"  >������Ϣ</td>
        </tr>
          <tr>
            <td align="center"  ><table width="850" border="0" cellpadding="0" cellspacing="0" class="order_gods_table">
              <tr>
                <td width="30" height="35" bgcolor="#E6E6E6" class="order_gods_table_three">&nbsp;</td>
                <td align="left" bgcolor="#E6E6E6" class="order_gods_table_three">��Ʒ��<%= totalprice%>Ԫ  + �˷ѣ�
				<input  type="hidden" name="userpoint" value="<%=userpoint.toString()%>"  />
				<input type="text" name="yunfei" value="0" id="yunfei" style="background-color:#E6E6E6; border:none;width:30px; height:17px" readonly="true"  />Ԫ
				
				
				  - ���:<input type="text" name="gold" value="0" id="gold" style="background-color:#E6E6E6; border:none;width:30px; height:17px; padding-bottom:0px;" readonly="true"  />Ԫ</td>
                <td width="30" align="left" bgcolor="#E6E6E6" class="order_gods_table_three">&nbsp;</td>
              </tr>
			  
              <tr>
                <td height="32">&nbsp;</td>
                <td height="70" align="left">ʹ��<input type="text" name="point" id="port" value="0" style="width:59px; height:20px"  />��� <input type="button" value="�һ�" class="search_button"  style="width:60; height:25;" onclick="duihuan(<%=totalprice%>,<%=user.getPoint()%>)"  />(����ǰӵ�еĽ��Ϊ<%=user.getPoint()%>,100��Ҷһ� RMB 1 Ԫ) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ӧ���ܶ�:�� <input type="text" name="newprice" id="price" value="<%=totalprice%>" style="background-color:#fff; border:none;width:50px; height:17px; font-weight:bold" readonly="true"  /> Ԫ </td>
                <td width="30" align="center">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="60" align="right"  ><input type="button" value="ȷ�����󣬹���"  class="search_button" onclick="addsubmits()" style="width:150px; height:30px;"  /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          </tr>
          <tr>
            <td height="30"  ></td>
          </tr>
          <tr>
            <td height="30"  ></td>
          </tr>
        <tr>
        <td height="30"  ></td>
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
<script language="javascript">
function mailway(id,price){
 var i=0.00;
 var nbs = parseFloat(document.getElementById("gold").value);
 i = price;
 var j=0.00;
 var totalprice = 0.00;
 	if(id==1){ 
		totalprice = i+nbs+0.00;
		document.getElementById("yunfei").value ="0";
		document.getElementById("price").value =totalprice; 
		}
	if(id==2){ 
		totalprice = i+nbs+6.00;
		document.getElementById("yunfei").value ="6";
		document.getElementById("price").value =totalprice; 
	}
}

function duihuan(price,points){
 var i=0.00;
 var nbs = parseFloat(document.getElementById("point").value)/100;
  var nbss = parseFloat(document.getElementById("yunfei").value);
 if(nbs*100>points){
 	alert('������Ľ�����������Ľ���ܶ���������룡');
 }else {
 //var point = parseFloat(document.getElementById("point").value);
 i = price;
 var j=0.00;
 var totalprice = 0.00;
 	totalprice = i-nbs+nbss;
 	document.getElementById("gold").value =nbs ;
 	document.getElementById("price").value =totalprice;
	}
}

</script>



