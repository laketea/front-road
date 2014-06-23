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
		
		<DIV class="content">
<H1>用户协议</H1>
<DIV class="sector">
<H2>用户协议</H2>
<H4>一、今凡网服务条款的确认与接纳</H4>
<P>今凡网站上的各项电子服务的所有权和运作权归本站。本站提供的服务将完全按照其发布的服务条款和操作规则严格执行。用户必须完全同意所有服务条款并完成注册程序，才能成为

本站的正式用户。用户确认：本协议条款是处理双方权利义务的当然约定依据，除非违反国家强制性法律，否则始终有效。在下订单的同时，您也同时承认了您拥有购买这些产品的权利能力

和行为能力，并且将您对您在订单中提供的所有信息的真实性负责。</P></DIV>
<DIV class="sector">
<H4>二、服务简介</H4>
<P>本站运用自己的操作系统通过国际互联网络为用户提供网络服务。同时，用户必须：。</P>
<P>&nbsp;&nbsp;A、自行配备上网的所需设备，包括个人电脑、调制解调器或其他必备上网装置。</P>
<P>&nbsp;&nbsp;B、自行负担个人上网所支付的与此服务有关的电话费用、网络费用。 </P>
<P>基于本站所提供的网络服务的重要性，用户应同意：</P>
<P>&nbsp;&nbsp;A、供详尽、准确的个人资料。</P>
<P>&nbsp;&nbsp;B、不断更新注册资料，符合及时、详尽、准确的要求。</P>
<P>		本站对用户的电子邮件、手机号等隐私资料进行保护，承诺不会在未获得用户许可的情况下擅自将用户的个人资料信息出租或出售给任何第三方，但以下情况除外：		</P>
<P>&nbsp;&nbsp;A、用户同意让第三方共享资料；</P>
<P>&nbsp;&nbsp;B、用户同意公开其个人资料，享受为其提供的产品和服务</P>
<P>&nbsp;&nbsp;C、本站发现用户违反了本站服务条款或本站其它使用规定。</P></DIV>
<DIV class="sector">
<H4>三、价格和数量</H4>
<P>本站产品的价格和可获性都在本站上指明。这类信息将随时更改且不发任何通知。商品的价格都包含了增值税。如果发生了意外情况，在确认了您的订单后，由于供应商提价，税额变化引

起的价格变化，您有权取消您的订单，并希望您能及时通过电子邮件或电话通知本站客户服务部。</P></DIV>
<DIV class="sector">
<H4>四、送货</H4>
<P>本站将会把产品送到您所指定的送货地址。所有在本站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。
		<BR><BR>		请清楚准确地填写您的真实姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，本站将无法承担迟延配送的责任：
		<BR>&nbsp;&nbsp;A、	客户提供错误信息和不详细的地址； 
<BR>&nbsp;&nbsp;B、	货物送达无人签收，由此造成的重复配送所产生的费用及相关的后果。 
<BR>&nbsp;&nbsp;C、	不可抗力，例如：自然灾害、交通戒严、突发战争等。 		</P></DIV>
<DIV class="sector">
<H4>五、用户的账户，密码和安全性</H4>
<P>用户一旦注册成功，成为本站的合法用户，将得到一个密码和用户名。您可随时根据指示改变您的密码。用户将对用户名和密码安全负全部责任。另外，每个用户都要对以其用户名进行的

所有活动和事件负全责。用户若发现任何非法使用用户账户或存在安全漏洞的情况，请立即通告本站。
		<BR><BR>		如发生利用计算机程序进行恶意注册、邀请、参与的情形，聚美优品有权在不事先通知用户的情况下单方面中断或终止向用户提供服务而无需通

知用户。		</P></DIV>
<DIV class="sector">
<H4>六、拒绝提供担保</H4>
<P>用户个人对网络服务的使用承担风险。本站对此不作任何类型的担保，不论是明确的或隐含的，但是不对商业性的隐含担保、特定目的和不违反规定的适当担保作限制。本站不担保服务一

定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。本站对在本站上得到的任何商品购物服务或交易进程，不作担保。		</P></DIV>
<DIV class="sector">
<H4>七、用户隐私制度</H4>
<P>尊重用户个人隐私是本站的一项基本政策。所以，作为对以上第二条注册资料分析的补充，本站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本站中的非公开内容

。		</P></DIV>
<DIV class="sector">
<H4>八、对用户信息的存储和限制</H4>
<P>本站不对用户所发布信息的删除或储存失败负责。本站有判定用户的行为是否符合本站服务条款的要求和精神的保留权利，如果用户违背了服务条款的规定，本站有中断对其提供网络服务

的权利。		</P></DIV>
<DIV class="sector">
<H4>九、结束服务</H4>
<P>用户或本站可随时根据实际情况中断一项或多项网络服务。本站不需对任何个人或第三方负责而随时中断服务。用户对后来的条款修改有异议，或对本站的服务不满，可以行使如下权利：
		<BR>&nbsp;&nbsp;A、停止使用本站的网络服务。<BR>&nbsp;&nbsp;B、通告本站停止对该用户的服务。 <BR>
		结束用户服务后，用户使用网络服务的权利马上中止。从那时起，用户没有权利要求本站，本站也没有义务传送任何未处理的信息或提供未完成的服务给用户或第三方。		</P></DIV>
<DIV class="sector">
<H4>十、通告</H4>
<P>所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。本站的活动信息也将定期通过页面公告及电子邮件方式向用户发送。用户协议条款的修改、服务变更、或其它

重要事件的通告都会以此形式进行。		</P></DIV>
<DIV class="sector">
<H4>十一、网络服务内容的所有权</H4>
<P>本站定义的网络服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；本站为用户提供的其他信息。所有这些内容受版权、商标、标签和其它

财产所有权法律的保护。所以，用户只能在本站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站

共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。		</P></DIV>
<DIV class="sector">
<H4>十二、责任限制</H4>
<P>如因不可抗力或其他本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，本站不承担责任。但是本站会尽可能合理地协助处理善后

事宜，并努力使客户免受经济损失。		</P></DIV>
<DIV class="sector">
<H4>十三、法律管辖和适用</H4>
<P>			本协议的订立、执行和解释及争议的解决均应适用中国法律。<BR><BR>
			如发生本站服务条款与中国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它合法条款则依旧保持对用户产生法律效力和影响。<BR><BR>
			本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。<BR><BR>
			如双方就本协议内容或其执行发生任何争议，双方应尽力友好协商解决；协商不成时，任何一方均可向本站所在地的人民法院提起诉讼。		</P></DIV></DIV>		  </td>
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
        <td height="42" bgcolor="#93AC64" class="faq_RB">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#FFFFFF" class="faq_LL" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="user_terms.jsp" style="color:#000000; font-size:14px;font-weight: bold;">用户协议</a></td>
      </tr>
      <tr>
        <td height="42" bgcolor="#93AC64" class="faq_Rr">&nbsp;</td>
      </tr>
      <tr>
        <td height="32" align="left" bgcolor="#93AC64" class="faq_Rr" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="contact.jsp" style="color:#000000; font-size:14px;font-weight: bold;">联系我们</a></td>
      </tr>
      <tr>
        <td height="2100" bgcolor="#93AC64" class="faq_RB">&nbsp;</td>
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
