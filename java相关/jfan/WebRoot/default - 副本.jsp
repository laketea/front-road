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
<title>今凡凡</title>

<link href="css.css" rel="stylesheet" type="text/css" />
<SCRIPT language=Javascript>
			<!--
				var initialTimeElement = new Array();
				var showTimeElement = new Array();
				
				initialTimeElement[0] = 0.1;					
				showTimeElement[0] = "leftTime0";		
				
			 //-->
    </SCRIPT>
<script language="javascript">
//初始化
var def="6";
function mover(object){
  //主菜单
  var mm=document.getElementById("m_"+object);
  mm.className="m_li_a";
  //初始主菜单隐藏效果
 
  //子菜单
 
}
function mout(object){
  //主菜单
  var mm=document.getElementById("m_"+object);
  mm.className="m_li";
  
}
</script>
<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</head>

<%
	GodsService godsservice = new GodsService();
	Gods topgods = godsservice.getTopGods();
	Page todaylist = godsservice.getTodayGods(1,35,1);
	List result = todaylist.getThisPageElements();
	Date now = new Date();
    long nowLong = now.getTime();

%>


<body>
<jsp:include page="headss.jsp"  />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td width="1000" height="200" align="center" valign="top" id="main">
		<table width="980" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3">
		<table width="980" border="0" cellspacing="0" cellpadding="0">
       <tr>
        <td height="10" colspan="3"><img src="images/tg_zhanwei.gif" width="1" height="1" /></td>
      </tr>
	  <form action="searchGoods.jsp" >
	  <tr>
        <td width="64" height="42" align="center" valign="middle"><img src="images/tg_menu.gif" width="51" height="27" align="absmiddle" /></td>
        <td width="473" height="42" align="left" valign="middle" bordercolor="#0033CC"><div id="mid_menu">
	<ul>
	<li><a href="todayGods.jsp" style="background-color:#93ac64; color:#FFF" >今日推荐</a></li>
	<% UserService services = new UserService();
		List resultss = null;
		resultss = services.getSubjectList(1);
			for(int i=0;i<resultss.size();i++){
			Subject subject  =(Subject)resultss.get(i);
			%>		
					<li><a href="columnGods.jsp?column=<%=subject.getId().toString() %>" ><%=subject.getFirstname() %></a></li>
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
    </table>	
		</td>
      </tr>
	   <tr>
        <td colspan="3" height="20"><img src="images/tg_zhanwei.gif" /></td>
      </tr>
      <tr>
        <td height="300" rowspan="2" width="16" align="center" valign="top">&nbsp;</td>
        <td width="948" height="527" align="center" valign="top" id="main_firt"><table width="900" border="0" cellspacing="0" cellpadding="0">
           <tr>
            <td height="10" colspan="2" align="left" valign="top"></td>
            </tr>
          <tr>
		  <tr>
            <td height="140" colspan="2" align="left" valign="top"><span style="font-size: 24px;color: #638721;font-family:微软雅黑;">今日团购推荐：</span><span style=" line-height:35px;"><a class="top_goods_name"   href="godsDetail.jsp?ids=<%=topgods.getId()%>" ><%=topgods.getDiscript() %></a></span></td>
            </tr>
          <tr>
            <td width="340" height="345"><table width="340" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="77" colspan="4" align="left" background="images/tg_qgg.gif" >&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/cartAction.do?method=add&amp;bookid=<%=topgods.getId()%>" title="立即购买"><img src="images/tg_qg.gif" width="97" height="33" border="0" align="absmiddle" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:24px; color:#FFFFFF;font-weight: bold;">￥<%=topgods.getNewprice()%></span></td>
                </tr>
              <tr>
                <td width="93" height="32" align="center" valign="bottom" background="images/tg_qg2.gif"> <span style="font-size:18px; font-family:微软雅黑; font-weight: bold;">现价</span></td>
                <td width="100" align="center" valign="bottom" background="images/tg_qg2.gif"><span style="font-size:18px; font-family:微软雅黑; font-weight: bold;">原价</span></td>
                <td width="100" align="center" valign="bottom" background="images/tg_qg2.gif"><span style="font-size:18px; font-family:微软雅黑; font-weight: bold;">节约</span></td>
                <td width="47">&nbsp;</td>
              </tr>
              <tr>
                <td height="40" align="center" valign="middle" bgcolor="#91AB62"><span style="font-size:18px; color:#FFFFFF;font-weight:400"><%=topgods.getNewprice()%></span></td>
                <td align="center" valign="middle" bgcolor="#91AB62"><span style="font-size:18px; color:#FFFFFF; font-weight:400"><%=topgods.getOldprice()%></span></td>
                <td align="center" valign="middle" bgcolor="#91AB62"><span style="font-size:18px; color:#FFFFFF;font-weight:400"><%=topgods.getOldprice()-topgods.getNewprice()%></span></td>
                <td width="47">&nbsp;</td>
              </tr>
              <tr>
                <td height="50" colspan="3" align="center" bgcolor="#91AB62"> <span style="font-size:22px; font-family:微软雅黑; font-weight: bold; color:yellow"><%=topgods.getSellcount()%></span> <span style="font-size:18px; font-family:微软雅黑; font-weight: bold; ">已参团</span></td>
                <td width="47">&nbsp;</td>
              </tr>
              <tr>
                <td height="45" colspan="3" align="center" bgcolor="#91AB62"><div id="times" class="times" style="font-weight:bold; font-size:14px;" ></div></td>
                <td width="47">&nbsp;</td>
              </tr>
            </table></td>
            <td width="558" id="main_firt"><a  href="godsDetail.jsp?ids=<%=topgods.getId()%>" ><img src="files/<%=topgods.getMinphoto()%>" width="558" border="0" /></a></td>
          </tr>
          <tr>
            <td width="340">&nbsp;</td>
            <td width="558">&nbsp;</td>
          </tr>
        </table></td>
        <td rowspan="2" align="center" valign="top" width="16">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" valign="top">&nbsp;</td>
      </tr>
      
      <tr>
        <td height="100" colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
		  <%for(int i=0;i<=result.size()-1;i++){
Gods gods  =(Gods)result.get(i);
		  %>
            <td width="16" height="100" valign="bottom"><img src="images/tg_gods1.gif" width="16" height="103" hspace="0" vspace="0" /></td>
            <td width="303" height="386" class="de_table"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="10">&nbsp;</td>
                <td height="10">&nbsp;</td>
                <td height="10">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td width="270" align="center" valign="middle" class="de_table"><a  href="godsDetail.jsp?ids=<%=gods.getId()%>" ><img src="files/<%=gods.getMinphoto()%>" width="270" height="208" border="0" /></a></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="35"><a class="gods_list_name" href="godsDetail.jsp?ids=<%=gods.getId()%>" ><%=gods.getName()%></a></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="28">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td height="50" colspan="3" align="left" valign="top" background="images/tg_de_2.gif" class="de_no_table">
				<div style="margin-top:10px; margin-left:40px; font-size:16px; font-family:微软雅黑; color:#FFFFFF; width:100px; float:left;" ><%=gods.getNewprice()%>&nbsp;&nbsp;<%if(gods.getHourcount()==0){%>抢光了<% } else{ if((gods.getEnddate()).getTime()>nowLong)  {%><a href="<%=request.getContextPath()%>/cartAction.do?method=add&amp;bookid=<%=gods.getId()%>" title="立即购买"><img src="images/tg_de_qg.gif" width="49" height="17" border="0" align="absmiddle" /></a><% } else { %><img src="images/tg_de_qg.gif" width="49" height="17" border="0" align="absmiddle" /><%} }%></div><div style="float:right;  width:120px; color:#006600;" class="on_price"><ul><li style="color:#61861E;">原价: ￥<%=gods.getOldprice()%></li><li>现价: ￥<%=gods.getNewprice()%></li><li>节约: ￥<%=gods.getOldprice()-gods.getNewprice()%></li></ul></div>				</td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="20">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="33" align="center" valign="top">
				
				 <script language=Javascript>
	  var nowts = new Date();
	  var enddate = <%=gods.getEnddate().toString()%>;
	  initialTimeElement[<%=i+1%>] = parseInt((new Date("<%=gods.getEnddate().toString().replace("-","/")%>").getTime()-nowts.getTime())/1000);
	  showTimeElement[<%=i+1%>] = 'leftTime<%=i+1%>'</script>
      <div style="width:250px; height:32px; font-size:14px; font-weight:bold; font-family:微软雅黑" id=leftTime<%=i+1%>></div>
				<script language=javascript type=text/javascript 
src="temaizhou.js"></script>				</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
			<%
			if(i%3==2){
			%>
			<td width="16"><img src="images/tg_df_zwf2.png" width="24" height="1" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="20">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
			<%}%>
			<%
			if(i==8){
			%>
			<td width="16">&nbsp;</td>
          </tr>
			<%}
			}
			%>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="3" height="30">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" align="right" height="10"> </td>
      </tr>
      <tr>
        <td colspan="3" height="20" align="right">
       </td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<jsp:include page="bottom.jsp"  />
<A id=top-link onClick="goTop();return false;" 
href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;</A>
</body>
</html>
<SCRIPT type=text/javascript>
function goTop(acceleration, time) {
 acceleration = acceleration || 0.1;
 time = time || 16;
 var x1 = 0;
 var y1 = 0;
 var x2 = 0;
 var y2 = 0;
 var x3 = 0;
 var y3 = 0;
 
 if (document.documentElement) {
  x1 = document.documentElement.scrollLeft || 0;
  y1 = document.documentElement.scrollTop || 0;
 }
 if (document.body) {
  x2 = document.body.scrollLeft || 0;
  y2 = document.body.scrollTop || 0;
 }
 var x3 = window.scrollX || 0;
 var y3 = window.scrollY || 0;
 var x = Math.max(x1, Math.max(x2, x3));
 var y = Math.max(y1, Math.max(y2, y3));
 var speed = 1 + acceleration;
 window.scrollTo(Math.floor(x / speed), Math.floor(y / speed));

 if(x > 0 || y > 0) {
  var invokeFunction = "goTop(" + acceleration + ", " + time + ")";
  window.setTimeout(invokeFunction, time);
 }
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
function _fresh()
{
 var endtime=new Date("<%=topgods.getEnddate().toString().replace("-","/")%>");
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
<script language="javascript">
function confirmadd(bookid){
  if(confirm('确认要加入购物车么!')){
  	location.replace('<%=request.getContextPath()%>/cartAction.do?method=add&amp;bookid='+bookid);
  }
}
</script>
