<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@page import="com.bookstore.service.UserService"%>
<%@page import="com.bookstore.service.GodsService"%>
<%@page import="com.bookstore.po.User"%>
<%@page import="com.bookstore.po.Gods"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.bookstore.util.UtilFun"%>
<%@page import="com.bookstore.util.Arith"%>
<%@page import="com.bookstore.util.Page"%>
<%@page import="com.bookstore.po.Subject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>今凡网-今日推荐</title>
<%
	String id = request.getParameter("id");
	if(id ==null){ id="1"; }
	
	GodsService godsservice = new GodsService();
	Gods topgods = godsservice.getTopGods();
	Page todaylist = godsservice.getTodayGods(Integer.valueOf(id),50,1);
	List result = todaylist.getThisPageElements();
	Date now = new Date();
    long nowLong = now.getTime();
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
<style type="text/css">
<!--
.STYLE1 {
	font-size: large;
	font-style: italic;
	font-weight: bold;
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
    <td width="1000" height="200" align="center" valign="top" id="main"><table width="980" height="0" border="0" cellpadding="0" cellspacing="0">
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
    </table>		</td>
      </tr>
	   <tr>
        <td colspan="3" height="10"><img src="images/tg_zhanwei.gif" /></td>
      </tr>
      
      <tr>
        <td height="0" width="16" align="center" valign="top">&nbsp;</td>
        <td width="948" height="5" align="center" valign="top">&nbsp;</td>
        <td align="center" valign="top" width="16">&nbsp;</td>
      </tr>
      
      <tr>
        <td height="100" colspan="3" align="center"><table width="948" border="0" cellspacing="0" cellpadding="0">
          <tr>
		   <%for(int i=0;i<=result.size()-1;i++){
Gods gods  =(Gods)result.get(i);
		  %>
            <td width="300" height="346" align="center" valign="top"><table width="300" border="0" cellpadding="0" cellspacing="0" class="de_table">
              <tr>
                <td height="220" colspan="2" align="center" valign="bottom"><a  href="godsDetail.jsp?ids=<%=gods.getId()%>" ><img src="<%=gods.getMinphoto()%>" width="268" height="207" border="0" /></a></td>
              </tr>
              <tr>
                <td height="45" colspan="2" align="center" valign="middle"><a class="gods_list_name" href="godsDetail.jsp?ids=<%=gods.getId()%>" ><%=UtilFun.getString(gods.getName(),15)%></a></td>
              </tr>
              
              <tr>
                <td width="160" height="45" class="s11"><div class="s33"><table width="165" height="44" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="35" align="right" valign="middle"><img src="images/tg_xy.png" width="15" height="15" /></td>
    <td width="60" style=" color:#FFFFFF; font-size:12pt; font-family:'微软雅黑'">￥<%=gods.getNewprice()%></td>
    <td width="70" align="center" valign="middle" style="color:#FFFFFF; font-size:10pt; font-family:'微软雅黑'">
	<%if(gods.getHourcount()==0){%>抢光了<% } else{ if((gods.getEnddate()).getTime()>nowLong)  {%><a href="<%=request.getContextPath()%>/cartAction.do?method=add&amp;bookid=<%=gods.getId()%>" title="立即购买"><img src="images/tg_x_qg.png" width="52" height="19" border="0" align="absmiddle" /></a>
	<% } else { %><img src="images/tg_x_qg.png" width="52" height="19" align="absmiddle" />
	<%} }%>	</td>
  </tr>
</table>
</div></td>
                <td width="138" align="left" valign="top"><span style="width:130px; height:20px; color:#61861e; font-size:9pt;" >原价：￥<%=gods.getOldprice()%></span><br /><span style="width:130px; height:20px; color:#000000; font-size:9pt;" >现价：￥<%=gods.getNewprice()%></span><br /><span style="width:130px;height:20px;color:#000000; font-size:9pt;" >节约：￥<%=Arith.sub(gods.getOldprice(),gods.getNewprice())%></span></td>
              </tr>
              
              <tr>
                <td width="160" height="41" align="center" >
				 <script language=Javascript>
	  var nowts = new Date();
	  var enddate = <%=gods.getEnddate().toString()%>;
	  initialTimeElement[<%=i+1%>] = parseInt((new Date("<%=gods.getEnddate().toString().replace("-","/")%>").getTime()-nowts.getTime())/1000);
	  showTimeElement[<%=i+1%>] = 'leftTime<%=i+1%>'</script>
				<div style="width:160px;height:41px;line-height:41px; font-family:微软雅黑; color:#000000; font-size:12pt;" id=leftTime<%=i+1%>></div>
				<script language=javascript type=text/javascript 
src="temaizhou.js"></script>				</td>
                <td width="138" height="41" align="center" ><span style="font-size:12pt; font-family:'微软雅黑' ; color:#FFCE00"><%=gods.getSellcount()%></span><span style="font-size:10pt; font-family:'微软雅黑'; color:#000000;" >人已购买</span></td>
              </tr>
            </table></td>
			<% if(i%3<=1) {  %>
            <td width="36" height="346"><img  width="28" src="images/tg_df_zwf2.png" /></td>
			<%} 
			if(i%3==2){
			 %>
            
          </tr>
          <tr>
            <td colspan="5" height="15">&nbsp;</td>
          </tr>
		  <% } }%>

        </table></td>
      </tr>
      <tr>
        <td colspan="3" height="10">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" align="right"></td>
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
    <td width="1000"><jsp:include page="bottom.jsp"  /></td>
    <td>&nbsp;</td>
  </tr>
</table>
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
</body>
</html>

<SCRIPT LANGUAGE="JavaScript">
function _fresh()
{
 var endtime=new Date("2011/08/16");
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
function changebg(id){
document.getElementById('menu1').style.backgroundColor='#93ac64';
}
</script>

	
