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
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
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
        <td colspan="3"><table width="980" border="0" cellspacing="0" cellpadding="0">
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
        <td colspan="3" height="20"><img src="images/tg_zhanwei.gif" /></td>
      </tr>
      <tr>
        <td height="300" rowspan="3" width="16" align="center" valign="top">&nbsp;</td>
        <td width="948" height="527" align="center" valign="top" id="main_firt"><table width="948" border="0" cellpadding="0" cellspacing="0" class="de_table">
          <tr>
            <td height="120" colspan="3" align="left" valign="top" style=" padding-left:10px; padding-top:10px;"><span style="font-size: 24px;color: #638721;font-family:微软雅黑;">今日团购推荐：</span><span style=" line-height:35px;"><a class="top_goods_name"   href="godsDetail.jsp?ids=<%=topgods.getId()%>" ><%=topgods.getDiscript() %></a></span></td>
          </tr>
          <tr>
            <td width="330" rowspan="2" align="left" valign="bottom"><table width="275" height="380" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="75" class="s1"><div class="s3">
				<table width="330" height="70" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<td width="145" align="right" valign="middle" style="color:#FFFFFF; font-size:21pt; font-family:'微软雅黑'">
	<%if(topgods.getHourcount()==0){%>抢光了<% } else{ if((topgods.getEnddate()).getTime()>nowLong)  {%><a href="<%=request.getContextPath()%>/cartAction.do?method=add&amp;bookid=<%=topgods.getId()%>" title="立即购买"><img src="images/tg_d_qg.png"  border="0" align="absmiddle" /></a>
	<% } else { %><img src="images/tg_d_qg.png" align="absmiddle" />
	<%} }%>
	</td>
	 <td width="125" align="center" style=" color:#FFFFFF; font-size:21pt; font-family:'微软雅黑'">￥<%=topgods.getNewprice()%></td>
    <td width="70" align="center" valign="middle"><img src="images/yuan.png"  /></td>
   
    
  </tr>
</table>
				
				</div></td>
              </tr>
              <tr>
                <td height="265" align="left" valign="top"><table width="275" border="0" cellpadding="0" cellspacing="0" class="de_df_table">
                  <tr>
                    <td width="92" height="40" align="center" valign="bottom" style=" font-family:'宋体'; font-family:'宋体'; font-size:11.5pt;">原价</td>
                    <td width="91" align="center" valign="bottom" style=" font-family:'宋体'; font-family:'宋体'; font-size:11.5pt;" >现价</td>
                    <td width="92" align="center" valign="bottom" style=" font-family:'宋体'; font-family:'宋体'; font-size:11.5pt;" >节约</td>
                  </tr>
                  <tr>
                    <td height="40" align="center"  valign="middle" style="font-family:'宋体'; font-size:10pt; color:#666666">￥ <%=topgods.getNewprice()%></td>
                    <td height="40" align="center"  valign="middle"  style="font-family:'宋体'; font-size:10pt; color:#6F9132;" >￥ <%=topgods.getOldprice()%></td>
                    <td height="40" align="center"  valign="middle"  style="font-family:'宋体'; font-size:10pt; color:#6F9132;" >￥ <%=topgods.getOldprice()-topgods.getNewprice()%></td>
                  </tr>
                  <tr>
                    <td height="3" colspan="3" align="center"><img src="images/tg_ddf_2.png" /></td>
                  </tr>
                  <tr>
                    <td height="90" colspan="3" align="center" valign="middle"><span style="font-size:17pt; font-family:Arial; color:#face21"><%=topgods.getSellcount()%></span> <span style="font-size:15.3pt; font-family:微软雅黑; color:#000000 ">已参团</span></td>
                  </tr>
                  <tr>
                    <td height="2" colspan="3" align="center"><img src="images/tg_ddf_2.png" /></td>
                  </tr>
                  <tr>
                    <td height="90" colspan="3" align="center" valign="middle"><div id="times" class="times" style="font-weight:bold; font-size:12pt; font-family:Arial, Helvetica, sans-serif" ></div></td>
                  </tr>
                </table>				</td>
              </tr>
              
              <tr>
                <td height="40">&nbsp;</td>
              </tr>
            </table></td>
            <td width="585px" height="380" class="de_table"><a  href="godsDetail.jsp?ids=<%=topgods.getId()%>" ><img src="files/<%=topgods.getMinphoto()%>" width="585px" height="380px" border="0" /></a></td>
            <td width="33" height="380"><img src="images/tg_df_zwf.png" width="30px" /></td>
          </tr>
          <tr>
            <td width="585" height="20">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td rowspan="3" align="center" valign="top" width="16">&nbsp;</td>
      </tr>
      <tr>
        <td height="20" align="center" valign="top" ></td>
      </tr>
      <tr>
        <td height="200" align="center" valign="top" id="main_firt"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
        <td height="10" colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" height="10">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" align="right">        </td>
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
