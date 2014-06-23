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
<SCRIPT type="text/javascript" charset="GB2312" src="js/jquery-1.4.22.min.js"></SCRIPT>
<SCRIPT language=Javascript>
			<!--
				var initialTimeElement = new Array();
				var showTimeElement = new Array();
				
				initialTimeElement[0] = 0.1;					
				showTimeElement[0] = "leftTime0";		
				
			 //-->
    </SCRIPT>
<SCRIPT type=text/javascript>
function addsubmit(){
		var theForm = document.getElementById("regist_putong_page905Form") ;
		
		if (document.regist_putong_page905Form.username.value=="") {      
			alert("请输入您的称呼!");
			document.regist_putong_page905Form.username.focus();        
			return false;
		}
		if (document.regist_putong_page905Form.content.value=="") {      
			alert("请输入您的建议!");
			document.regist_putong_page905Form.content.focus();        
			return false;
		} 
		theForm.submit() ;
	}
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
</head>

<%GodsService godsservice = new GodsService();
	Gods topgods = godsservice.getTopGods();
	Page todaylist = godsservice.getTodayGods(1,35,1);
	List result = todaylist.getThisPageElements();
	Date now = new Date();
    long nowLong = now.getTime();

%>


<body>
<jsp:include page="heads.jsp"  />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
        <td colspan="3" height="20px"></td>
</tr>
  <tr>
    <td>&nbsp;</td>
    <td width="1000" height="200" align="center" valign="top" bgcolor="#FFFFFF" class="faq" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="28" height="300" rowspan="9" bgcolor="#93AC64" class="faq_L">&nbsp;</td>
        <td width="201" height="52" bgcolor="#93AC64" class="faq_RT">&nbsp;</td>
        <td width="201" rowspan="9" align="left" valign="top" class="faq_R">
		
		<div class="content">
		<h1>联系我们</h1>
		<ul class="faqlist">
                    <li>
                        <h4><span>联系我们</span><div class="switch"></div></h4>
                        <p>如有购买问题请将问题发至admin@jfanfan.com</p>
                    </li>
					<li>
                        
                        <h4><span>意见反馈</span><div class="switch"></div></h4>
						<form action="reviewAction.do" method="post"  name="regist_putong_page905Form" ><input type="hidden" name="method" value="addsuggest"  />
                        <table width="710" border="0" align="center" cellpadding="0" cellspacing="0">

                          <tr>
                            <td height="45" colspan="2" style=" font-size:14px;">如有对本站的建议请告知我们，谢谢！</td>
                          </tr>
                          <tr>
                            <td height="45" align="right">您的称呼：</td>
                            <td height="45"><input type="text" name="username" style=" line-height:30px;width:235px; height:30px; border:1px solid #61861E;" 					<%
							String usid = (String)session.getAttribute("userid");
							if(usid!=null){
								User uss = (User)session.getAttribute("user");
							%>
							value=<%=uss.getUsername()%> readonly="true"
							<%}%> /></td>
                          </tr>
                          <tr>
                            <td height="45" align="right">联系方式：</td>
                            <td height="45"><input type="text" name="contact" style=" line-height:30px;width:235px; height:30px; border:1px solid #61861E; "  />
                           <span style="font-size:10px; color:#737373;">请留下您的手机号.邮箱或QQ号方便联系。</span></td>
                          </tr>
                          <tr>
                            <td height="175" align="right" valign="top">提交信息：</td>
                            <td height="45" valign="top"><textarea name="content" cols="50" rows="12" style="line-height:30px;border:1px solid #61861E;" ></textarea></td>
                          </tr>
                          <tr>
                            <td height="28">&nbsp;</td>
                            <td height="35">&nbsp;&nbsp;
                            <input type="button" class="search_button" value="提交" onclick="addsubmit()"  /></td>
                          </tr>
                          <tr>
                            <td width="170" height="28">&nbsp;</td>
                            <td width="540">&nbsp;</td>
                          </tr>
                        </table>
						</form>
                        <p></p>
                    </li>
              </ul>
            </div>
		</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="faq.jsp" style="color:#000000; font-size:14px;font-weight: bold;">最重要的问题</a></td>
      </tr>
      <tr>
        <td height="42" bgcolor="#93AC64" class="faq_Rr">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="privacy.jsp" style="color:#000000; font-size:14px;font-weight: bold;">隐私声明</a></td>
      </tr>
      <tr>
        <td height="42" bgcolor="#93AC64" class="faq_Rr">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="user_terms.jsp" style="color:#000000; font-size:14px;font-weight: bold;">用户协议</a></td>
      </tr>
     <tr>
        <td height="42" bgcolor="#93AC64" class="faq_RB">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#FFFFFF" class="faq_LL" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="contact.jsp" style="color:#000000; font-size:14px;font-weight: bold;">联系我们</a></td>
      </tr>
      <tr>
        <td height="500" bgcolor="#93AC64" class="faq_R">&nbsp;</td>
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
