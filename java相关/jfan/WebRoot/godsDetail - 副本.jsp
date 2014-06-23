<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="com.bookstore.po.Subject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.bookstore.util.UtilFun"%>
<%@page import="com.bookstore.util.Page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>今凡网</title>
<%
	String ids = request.getParameter("ids");
	if(ids==null){ids="3";}
	GodsService godsservice = new GodsService();
	String id = request.getParameter("id");
	if(id==null){id="3";}
	Gods topgods = godsservice.getGods(Long.valueOf(ids));
		Date now = new Date();
    long nowLong = now.getTime();
	String column = (topgods.getFirst()).toString();
%>


<link href="css.css" rel="stylesheet" type="text/css" />
<SCRIPT language=Javascript>
			<!--
				var initialTimeElement = new Array();
				var showTimeElement = new Array();
				
				initialTimeElement[0] = 0.1;					
				showTimeElement[0] = "leftTime0";		
				
			 //-->
			 
			 
    </SCRIPT>
<SCRIPT language=Javascript>
	function buysubmit(){
		var theForm = document.getElementById("dform") ;
		theForm.action = 'cartAction.do?method=addorder' ;
		theForm.target = '' ;
		theForm.submit() ;
		}
	function cartsubmit(){
		var theForm = document.getElementById("dform") ;
		theForm.action = 'cartAction.do?method=addcart' ;
		theForm.target = '' ;
		theForm.submit() ;
		}
</SCRIPT>
<style type="text/css">

</style></head>



<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><jsp:include page="headss.jsp"  /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" height="200" align="center" valign="top" id="main"><table width="980" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="5"><table width="980" border="0" cellspacing="0" cellpadding="0">
       <tr>
        <td height="10" colspan="3"><img src="images/tg_zhanwei.gif" width="1" height="1" /></td>
      </tr>
	  <form action="searchGoods.jsp" >
	  <tr>
        <td width="64" height="42" align="center" valign="middle"><img src="images/tg_menu.gif" width="51" height="27" align="absmiddle" /></td>
        <td width="473" height="42" align="left" valign="middle" bordercolor="#0033CC"><div id="mid_menu">
	<ul>
	<li><a href="todayGods.jsp"  >今日推荐</a></li>
	<% UserService services = new UserService();
		List results = null;
		
		results = services.getSubjectList(1);
			for(int i=0;i<results.size();i++){
			Subject subject  =(Subject)results.get(i);
			%>		
					<li  ><a href="columnGods.jsp?column=<%=subject.getId().toString() %>"  <%if(column.equals(subject.getId().toString())) {%>  style="background-color:#93ac64; color:#FFF" <%}%>    ><%=subject.getFirstname() %></a></li>
			<%
			} %>
	</ul>
	</div></td>
        <td width="443" height="42" align="right" valign="middle"><input type="text" name="search" class="search_input"  /><input type="submit" value="搜索" class="search_button"  /></td>
	  </tr>
	 </form>
      <tr>
        <td height="10" colspan="3" id="main_middle"><img src="images/tg_zhanwei.gif" width="1" height="1" /></td>
      </tr>
    </table></td>
      </tr>
	   <tr>
        <td height="15" colspan="5" align="left" ></td>
      </tr>
      <tr>
        <td height="300" rowspan="8" width="16" align="center" valign="top">&nbsp;</td>
        <td width="470" height="500" rowspan="6" align="center" valign="top" ><table width="400" height="400" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="de_table"><img src="files/<%=topgods.getMaxphoto()%>" width="400" height="400" border="0" /></td>
          </tr>
        </table></td>
        <td width="35" height="500" rowspan="6" align="center" valign="top" ></td>
        <td width="440" align="center" valign="top" ></td>
        <td rowspan="8" align="center" valign="top" width="16">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" valign="top" ></td>
      </tr>
      <tr>
        <td align="center" valign="top" ></td>
      </tr>
      <tr>
        <td align="center" valign="top" ></td>
      </tr>
      <tr>
        <td width="440" align="left" valign="top" ></td>
      </tr>
      <tr>
        <td align="left" valign="top" ><table width="420" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="100" colspan="2" valign="top">
			<span style="line-height:35px; font-size:18pt; font-family:'微软雅黑'; padding-top:0px;"><%=topgods.getName() %></span>			</td>
          </tr>
          <tr>
            <td width="80" height="40" align="left" valign="middle" style="font-size:15pt; font-family:'微软雅黑'">今凡价：</td>
            <td width="340" height="40" align="left" valign="middle" style="font-size:12pt; font-family:'微软雅黑'"><span style="font-size:17pt; color:#990000; font-family:'微软雅黑'"><%=topgods.getNewprice()%></span> 元</td>
          </tr>
          <tr>
            <td width="80" height="40" align="left" valign="middle" style="font-size:15pt; font-family:'微软雅黑'">运&nbsp;&nbsp;费：</td>
            <td width="340" height="40" align="left" valign="middle" style="font-size:12pt; font-family:'微软雅黑'">快递免运费 EMS加6元</td>
          </tr>
          <tr>
            <td width="80" height="40" align="left" valign="middle" style="font-size:15pt; font-family:'微软雅黑';'" >已参团:</td>
            <td width="340" height="40" align="left" valign="middle" style="color: #FACE21; font-size:17pt;font-family:'微软雅黑'"><%=topgods.getSellcount()%><span style="font-size:12pt; font-family:'微软雅黑'; color:#000000;" > 人</span></td>
          </tr>
          <tr>
            <td width="80" height="40" align="left" valign="middle" style="font-size:15pt; font-family:'微软雅黑'">倒计时：</td>
            <td width="340" height="40" align="left" valign="middle"><div id="times" style=" width:220px; line-height:40px; float:left;height:40px;font-size:12pt; margin-top:0px;font-family:'微软雅黑'" ></div></td>
          </tr>
          <tr>
            <td height="220" colspan="2" align="left" valign="bottom">
			<form  method="post" id="dform" name="dform" ><input type="hidden" name="godid" value="<%=topgods.getId().toString()%>"  />
			<table width="365" height="177" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="88" align="center" valign="middle" bgcolor="#B0C983" class="de_gods_1" style=" font-size:16pt; color:#663300;">我要买
                  <input type="text" name="count" style="border-width: 1px;border-style: solid;border-color: #FFFFFF; background-color:#B0C983; color:#ffffff; width:45px; height:25px; font-size:16px; line-height:25px; text-align:center" value="1"  /></td>
              </tr>
			  <tr>
                <td height="2" align="center" valign="middle" bgcolor="#B0C983" ><img src="images/tg_de_tail.png" /></td>
              </tr>
              <tr>
                <td height="88" align="center" valign="middle" bgcolor="#B0C983" class="de_gods_2">
				
				<input type= "button" onclick="buysubmit()" value= "" name= "B1 " style= "cursor: hand; background-image:url( 'images/tg_dte_2.png');width: 123px; height: 31px;border-style:none ">
				&nbsp;<input type= "button" value= "" onclick="cartsubmit()" name= "B1 " style= "cursor: hand; background-image:url( 'images/tg_dte_1.png');width: 123px; height: 31px;border-style:none; ">
				</td>
              </tr>
            </table>
			</form>
			</td>
          </tr>
          <tr>
            <td colspan="2" align="center" valign="middle"  style="font-size:16pt;"></td>
            </tr>
          
        </table></td>
      </tr>
      <tr>
        <td height="20" colspan="3" align="center" valign="top" ></td>
      </tr>
      <tr>
        <td height="200" colspan="3" align="center" valign="top" id="main_firt"><table width="100%" border="0" cellspacing="0" cellpadding="0">
           
           <tr>
            <td height="30" align="left" valign="middle" bgcolor="#638721" ><span style="color:#FFF; font-family:微软雅黑; font-size:16px; margin-left:15px;">商品详细</span></td>
            </tr>
          <tr>
            <td height="140" align="left" valign="top" style="padding-left:15px; padding-top:10px;padding-right:15px"><%=topgods.getContent()%>123132123</td>
            </tr>
          <tr>
            <td height="10">&nbsp;</td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            </tr>
        </table></td>
      </tr>
      
      <tr>
        <td height="10" colspan="5">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5" height="10">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="5" align="right">        </td>
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

<SCRIPT LANGUAGE="JavaScript">
function _fresh()
{
 var endtime=new Date("<%=topgods.getEnddate().toString().replace("-","/")%>");;
 var nowtime = new Date();
 var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
 __d=parseInt(leftsecond/3600/24);
 __h=parseInt((leftsecond/3600)%24);
 __m=parseInt((leftsecond/60)%60);
 __s=parseInt(leftsecond%60);
 document.getElementById("times").innerHTML=__d+"天 "+__h+"小时"+__m+"分"+__s+"秒";
 if(leftsecond<=0){
 document.getElementById("times").innerHTML="抢购已结束";
 clearInterval(sh);
 }
}
_fresh()
var sh;
sh=setInterval(_fresh,1000);
</SCRIPT>
